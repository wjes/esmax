import ExcelJS from "exceljs";
import fs from "fs";
import moment from "moment";

import { headers } from "./headers.mjs";

const getFilename = () => {
  const args = process.argv.slice(2);
  if (args.length === 0) {
    console.log("No arguments provided");
    process.exit(1);
  }
  const filename = args[0];
  // Check that filename exists
  if (!fs.existsSync(filename)) {
    console.log("File not found: " + filename);
    process.exit(1);
  }
  return filename;
};

const getWorksheet = async (filename) => {
  const workbook = new ExcelJS.Workbook();
  await workbook.xlsx.readFile(filename);

  const worksheet = workbook.getWorksheet(1);

  let flag = false;
  worksheet.getRow(1).eachCell((cell, colNumber) => {
    const header = headers[colNumber - 1];

    // Ignore commented ones
    if (header.ignore) {
      console.log(
        "IGNORE Cell " + colNumber + " = " + JSON.stringify(cell.value),
      );
      return;
    }

    if (header.cell != cell.value) {
      console.error("Header mismatch: " + header.cell + " != " + cell.value);
      flag = true;
    }
    console.log("OK Cell " + colNumber + " = " + JSON.stringify(cell.value));
  });

  if (flag) process.exit(1);

  console.log("Headers OK");

  worksheet.spliceRows(1, 1);

  return worksheet;
};

// ----------------------------

(async () => {
  const filename = getFilename();
  const worksheet = await getWorksheet(filename);

  let query = `INSERT INTO tmp_esmax (${headers
    .map((header) =>
      header.ignore || Number.isInteger(header.sql) ? false : header.sql,
    )
    .filter((h) => h)
    .join(", ")}, essays) VALUES \n`;

  const values_block = [];

  const header_names = headers.map(({ cell }) => cell);

  worksheet.eachRow((row, rowNumber) => {
    console.log("Row " + rowNumber + " = " + JSON.stringify(row.values));

    const values = [];
    const essays = {};
    let tag = [];
    row.eachCell({ includeEmpty: true }, (cell, colNumber) => {
      // Why does it must to start with 1?
      const index = colNumber - 1;

      const header = headers[index];

      if (header.ignore) return;

      // If tag constructors
      if (
        [
          header_names.indexOf("Código Equipo"),
          header_names.indexOf("Código Componente"),
        ].includes(index)
      )
        tag.push(cell.value.toString().replace(/^\-+|\-+$/g, ""));
      // If tag
      else if (header_names.indexOf("Tag") === index) {
        values.push(`'${tag.join("-")}'`);
      }
      // If essays
      else if (header_names.indexOf("Relleno") <= index) {
        const { sql } = header;
        if (sql === -1) return;
        essays[sql] = cell.value;
      }
      // rest ...
      else {
        let value;
        if (header_names.indexOf("Fecha") === index) {
          if (!moment(cell.value, "DD MMM YY").isValid())
            value = "'0000-00-00'";
          else
            value = `'${moment(cell.value, "DD MMM YY")
              .format("YYYY-MM-DD")
              .toString()}'`;
        } else if (
          [
            header_names.indexOf("Fecha de Recepción"),
            header_names.indexOf("Informar Fecha de Aviso"),
          ].includes(index)
        ) {
          if (!moment(cell.value, "DD MMM YYYY hh:mm A").isValid())
            value = "0000-00-00 00:00:00";
          else
            value = `'${moment(cell.value, "DD MMM YYYY hh:mm A")
              .format("YYYY-MM-DD HH:mm:00")
              .toString()}'`;
        } else if (header_names.indexOf("Código de Alarma") === index) {
          const condition = cell.value.replace(/\s/g, "").toLowerCase();
          if (["normal", "ok"].includes(condition)) value = 1;
          else if (["alerta", "caution"].includes(condition)) value = 2;
          else if (["anormal", "abnormal", "severe"].includes(condition))
            value = 3;
          else value = 1;
        } else if (header_names.indexOf("Tipo Anomalía") === index) {
          const anomaly = cell.value.replace(/\s/g, "").toLowerCase();
          if (anomaly === "normal") value = 1;
          else if (/^desgaste/.test(anomaly)) value = 2;
          else if (/^conta.*desgaste/.test(anomaly)) value = 3;
          else if (/^diluci/.test(anomaly)) value = 4;
          else if (/^conta.*agua/.test(anomaly)) value = 5;
          else if (/^combusti/.test(anomaly)) value = 6;
          else if (/4406/.test(anomaly)) value = 7;
          else if (/^conta.*lubricante/.test(anomaly)) value = 8;
          else value = 1;
        } else if (header_names.indexOf("Estado Seguimiento") === index) {
          const tracking_state = cell.value.replace(/\s/g, "").toLowerCase();
          if (tracking_state === "normal") value = 1;
          else if (tracking_state === "falla") value = 2;
          else if (tracking_state === "alerta") value = 3;
          else if (tracking_state === "seguimiento") value = 4;
          else value = 1;
        } else
          value =
            typeof cell.value === "string"
              ? `'${cell.value.replaceAll("'", "\\'")}'`
              : cell.value;

        values.push(value);
      }
    });
    //      console.log(row.getCell(1).value.replaceAll("'", "\\'"));
    values.push(
      `'${Object.keys(essays)
        .map((id) => `${id}:${essays[id]}`)
        .join(";")}'`,
    );

    values_block.push(`(${values.map((v) => v || "NULL").join(", ")})`);
  });
  query += values_block.join(",\n");
  query += ";\n";

  try {
    fs.writeFileSync(`${filename}.sql`, query);
  } catch (err) {
    console.log(err);
  }

  console.log("SQL file generated!");
})();

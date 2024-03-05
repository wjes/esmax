-- TODO Relleno -> refill


-- Clients
-- ----------------------------------------------------------
-- Update ids of newly created clients
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_clients AS t2 ON t1.client = t2.name 
SET t1.id_client = t2.id
WHERE t1.client IS NOT NULL AND t1.id_client IS NULL;

--  Create new clients 
INSERT INTO esmax_clients (name, registered_name, rut, dv, legal_address)
SELECT client AS name, client AS registered_name, ROUND(RAND() * 100000000, 0) AS rut, "0" AS dv, "--" AS legal_address FROM tmp_esmax AS t1
WHERE t1.client IS NOT NULL AND id_client IS NULL
GROUP BY t1.client;

-- Update ids of newly created clients
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_clients AS t2 ON t1.client = t2.name 
SET t1.id_client = t2.id
WHERE t1.client IS NOT NULL AND t1.id_client IS NULL;

-- Machine_types
-- ----------------------------------------------------------
-- Make sure not to consider existing machine_types 
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_machine_types AS t2 ON t1.machine_type = t2.name 
SET t1.id_machine_type = t2.id
WHERE t1.machine_type IS NOT NULL AND t1.id_machine_type IS NULL;

--  Create new machine_types 
INSERT INTO esmax_machine_types (name)
SELECT machine_type AS name FROM tmp_esmax AS t1
WHERE t1.machine_type IS NOT NULL AND id_machine_type IS NULL
GROUP BY t1.machine_type;

-- Update ids of newly created machine_types
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_machine_types AS t2 ON t1.machine_type = t2.name 
SET t1.id_machine_type = t2.id
WHERE t1.machine_type IS NOT NULL AND t1.id_machine_type IS NULL;

-- Component_types
-- ----------------------------------------------------------
-- Make sure not to consider existing component_types 
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_component_types AS t2 ON t1.component_type = t2.name 
SET t1.id_component_type = t2.id
WHERE t1.component_type IS NOT NULL AND t1.id_component_type IS NULL;

--  Create new component_types 
INSERT INTO esmax_component_types (name)
SELECT component_type AS name FROM tmp_esmax AS t1
WHERE t1.component_type IS NOT NULL AND id_component_type IS NULL
GROUP BY t1.component_type;

-- Update ids of newly created component_types
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_component_types AS t2 ON t1.component_type = t2.name 
SET t1.id_component_type = t2.id
WHERE t1.component_type IS NOT NULL AND t1.id_component_type IS NULL;

-- Lubricants
-- ----------------------------------------------------------
-- Make sure not to consider existing lubricants 
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_lubricants AS t2 ON t1.lubricant = t2.name 
SET t1.id_lubricant = t2.id
WHERE t1.lubricant IS NOT NULL AND t1.id_lubricant IS NULL;

--  Create new lubricants 
INSERT INTO esmax_lubricants (name, id_protocol)
SELECT lubricant AS name, 1 AS id_protocol 
FROM tmp_esmax AS t1
WHERE t1.lubricant IS NOT NULL AND id_lubricant IS NULL
GROUP BY t1.lubricant;

-- Update ids of newly created lubricants
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_lubricants AS t2 ON t1.lubricant = t2.name 
SET t1.id_lubricant = t2.id
WHERE t1.lubricant IS NOT NULL AND t1.id_lubricant IS NULL;

-- Sites
-- ----------------------------------------------------------
-- Update ids of newly created sites
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_sites AS t2 ON t1.site = t2.name 
SET t1.id_site = t2.id
WHERE t1.site IS NOT NULL AND t1.id_site IS NULL AND t2.id_client = t1.id_client;

--  Create new sites 
INSERT INTO esmax_sites (name, id_client)
SELECT site AS name, id_client 
FROM tmp_esmax AS t1
WHERE t1.site IS NOT NULL AND id_site IS NULL
GROUP BY t1.site;

-- Update ids of newly created sites
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_sites AS t2 ON t1.site = t2.name 
SET t1.id_site = t2.id
WHERE t1.site IS NOT NULL AND t1.id_site IS NULL AND t2.id_client = t1.id_client;

-- Machines
-- ----------------------------------------------------------
-- Update ids of newly created machines
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_machines AS t2 ON t1.machine = t2.name 
SET t1.id_machine = t2.id
WHERE t1.machine IS NOT NULL AND t1.id_machine IS NULL AND t2.id_site = t1.id_site;

--  Create new machines 
INSERT INTO esmax_machines (name, id_site, id_machine_type, id_machine_brand, id_machine_model)
SELECT machine AS name, id_site, id_machine_type, 1 AS id_machine_brand, 1 AS id_machine_model 
FROM tmp_esmax AS t1
WHERE t1.machine IS NOT NULL AND id_machine IS NULL AND id_site IS NOT NULL AND id_machine_type IS NOT NULL
GROUP BY t1.machine;

-- Update ids of newly created machines
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_machines AS t2 ON t1.machine = t2.name 
SET t1.id_machine = t2.id
WHERE t1.machine IS NOT NULL AND t1.id_machine IS NULL AND t2.id_site = t1.id_site;

-- Components 
-- ----------------------------------------------------------
-- Update ids of newly created components
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_components AS t2 ON t1.tag = t2.tag 
SET t1.id_component = t2.id
WHERE t1.tag IS NOT NULL AND t1.id_component IS NULL;

--  Create new components 
INSERT INTO esmax_components (name, id_machine, id_lubricant, id_component_type, tag, id_component_brand, id_protocol, id_component_model, id_sampling_point, id_sampling_procedure)
SELECT component AS name, id_machine, id_lubricant, id_component_type, tag, 1 AS id_component_brand, 2 AS id_protocol, 1 AS id_component_model, 1 AS id_sampling_point, 1 AS id_sampling_procedure 
FROM tmp_esmax AS t1
WHERE t1.component IS NOT NULL AND id_component IS NULL AND id_machine IS NOT NULL AND id_lubricant IS NOT NULL AND id_component_type IS NOT NULL AND tag IS NOT NULL
GROUP BY t1.tag;

-- Update ids of newly created components
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_components AS t2 ON t1.tag = t2.tag 
SET t1.id_component = t2.id
WHERE t1.tag IS NOT NULL AND t1.id_component IS NULL;

-- Samples 
-- ----------------------------------------------------------
-- Update samples 
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_samples AS t2 ON t1.external_number = t2.external_number 
SET t1.id_sample = t2.id
WHERE t1.external_number IS NOT NULL AND t1.id_sample IS NULL;

--  Create new samples 
INSERT INTO esmax_samples (
  date_sampling, date_withdraw, date_entry, date_receive, date_essay, date_proposed,
  external_number, id_stage, 
  id_lubricant, id_lubricant_protocol, lubricant_continuity,
  id_sample_condition, id_anomaly_type, id_sample_tracking_state,
  id_component, id_component_protocol, component_continuity,
  machine_continuity, recommendation)
SELECT 
  t1.samping_date, t1.withdraw_date, t1.withdraw_date, t1.withdraw_date, t1.proposed_date, t1.proposed_date,
  t1.external_number, 4,
  t1.id_lubricant, t2.id_protocol, lubricant_continuity,
  t1.id_sample_condition, t1.id_anomaly_type, t1.id_tracking_state,
  t1.id_component, t3.id_protocol, 0,
  machine_continuity, recommendation
FROM tmp_esmax AS t1
INNER JOIN esmax_lubricants AS t2 ON t1.id_lubricant = t2.id
INNER JOIN esmax_components AS t3 ON t1.id_component = t3.id;

-- Update samples 
UPDATE tmp_esmax AS t1 
INNER JOIN esmax_samples AS t2 ON t1.external_number = t2.external_number 
SET t1.id_sample = t2.id
WHERE t1.external_number IS NOT NULL AND t1.id_sample IS NULL;

-- Sample results
-- ----------------------------------------------------------

DROP PROCEDURE IF EXISTS extract_essays;
DROP PROCEDURE IF EXISTS copy_sample_results;
DROP PROCEDURE IF EXISTS create_report;

-- ----------------------------
DELIMITER //
CREATE PROCEDURE extract_essays(IN id_sample INT(11), IN essays TEXT)
BEGIN

  DECLARE id_essay INT(11);
  DECLARE value VARCHAR(255);
  DECLARE essay TEXT;

  read_loop: LOOP
    IF LENGTH(TRIM(essays)) = 0 OR essays IS NULL THEN
      LEAVE read_loop;
    END IF;
    SET essay = SUBSTRING_INDEX(essays,';',1);
    SET id_essay = SUBSTRING_INDEX(essay,':',1);
    SET value = SUBSTRING_INDEX(essay,':',-1);

    IF value != 'null' THEN

      --  Create new sample results 
      INSERT INTO esmax_sample_results (id_sample, id_essay, id_protocol, value)
      SELECT id_sample, id_essay, t1.id_protocol_type AS id_protocol, value 
      FROM esmax_essays AS t1
      WHERE t1.id = id_essay;

    END IF;

    SET essays = INSERT(essays, 1, IF(essays REGEXP ';', INSTR(essays, ';'), -1), '');
  END LOOP;
END//

-- ----------------------------
CREATE PROCEDURE create_report(IN _id_sample INT(11))
BEGIN

DECLARE _count INT(11);

 INSERT INTO esmax_reports (
   id,
   date_sampling,
   date_receive,
   date_report,
   date_proposed,
   component_continuity,
   machine_continuity,
   lubricant_continuity,

   date_sampling_prev,
   date_receive_prev,
   date_report_prev,
   component_continuity_prev,
   machine_continuity_prev,
   lubricant_continuity_prev,

   state,
   suggestion,
   sampling_condition,
   sample_tracking_states,
   anomaly_type,
   recommendation,

   component_tag,
   component_name,
   component_brand,
   component_model,

   liters,
   sampling_procedure,
   sampling_point,

   machine_name,
   machine_brand,
   machine_model,

   lubricant_name,

   site,

   client,
   client_legal_address,

   patch_test_1_file,
   patch_test_1_comment,
   magnetic_plug_1_file,
   magnetic_plug_1_comment,
   ferrography_1_file,
   ferrography_1_comment,

   responsible,
   graph_1,
   graph_2,
   graph_3,
   graph_4
 )
 SELECT
   t1.id                                                     AS id,
   t1.date_sampling                                          AS date_sampling,
   t1.date_receive                                           AS date_receive,
   t1.date_proposed                                          AS date_report,
   t1.date_proposed                                          AS date_proposed,
   t1.component_continuity                                   AS component_continuity,
   t1.machine_continuity                                     AS machine_continuity,
   t1.lubricant_continuity                                   AS lubricant_continuity,

   t1.date_sampling_prev                                     AS date_sampling_prev,
   t1.date_receive_prev                                      AS date_receive_prev,
   t1.date_proposed_prev                                     AS date_report_prev,
   t1.component_continuity_prev                              AS component_continuity_prev,
   t1.machine_continuity_prev                                AS machine_continuity_prev,
   t1.lubricant_continuity_prev                              AS lubricant_continuity_prev,

   t1.state                                                  AS state,
   t1.suggestion                                             AS suggestion,
   t19.name                                                  AS sampling_condition,
   t20.name                                                  AS sample_tracking_states,
   t21.name                                                  AS anomaly_type,
   t1.recommendation                                         AS recommendation,

   t2.tag                                                    AS component_tag,
   t2.name                                                   AS component_name,
   t3.name                                                   AS component_brand,
   t4.name                                                   AS component_model,

   t2.liters                                                 AS liters,
   t5.name                                                   AS sampling_procedure,
   t9.name                                                   AS sampling_point,

   t6.name                                                   AS machine_name,
   t7.name                                                   AS machine_brand,
   t8.name                                                   AS machine_model,

   t10.name                                                  AS lubricant_name,

   t11.name                                                  AS site,

   t12.name                                                  AS client,
   t12.legal_address                                         AS client_legal_address,

   t15.value                                                 AS patch_test_1_file,
   t15.comment                                               AS patch_test_1_comment,
   t16.value                                                 AS magnetic_plug_1_file,
   t16.comment                                               AS magnetic_plug_1_comment,
   t17.value                                                 AS ferrography_1_file,
   t17.comment                                               AS ferrography_1_comment,

   '--'                                                      AS responsible,
   '{}'                                                      AS graph_1,
   '{}'                                                      AS graph_2,
   '{}'                                                      AS graph_3,
   '{}'                                                      AS graph_4

 FROM (
   SELECT
     tt1.id                                                  AS id,
     tt1.date_sampling                                       AS date_sampling,
     tt1.date_receive                                        AS date_receive,
     tt1.date_proposed                                       AS date_proposed,
     tt1.component_continuity                                AS component_continuity,
     tt1.machine_continuity                                  AS machine_continuity,
     tt1.lubricant_continuity                                AS lubricant_continuity,

     tt1.id_component                                        AS id_component,
     tt1.run_entry                                           AS run_entry,
     tt1.state                                               AS state,
     tt1.suggestion                                          AS suggestion,
     tt1.recommendation                                      AS recommendation,
     tt1.id_sample_condition                                 AS id_sample_condition,
     tt1.id_sample_tracking_state                            AS id_sample_tracking_state,
     tt1.id_anomaly_type                                     AS id_anomaly_type,

     tt2.id                                                  AS id_prev,
     tt2.date_sampling                                       AS date_sampling_prev,
     tt2.date_receive                                        AS date_receive_prev,
     tt2.date_proposed                                       AS date_proposed_prev,
     tt2.component_continuity                                AS component_continuity_prev,
     tt2.machine_continuity                                  AS machine_continuity_prev,
     tt2.lubricant_continuity                                AS lubricant_continuity_prev

   FROM esmax_samples                                        AS tt1
   LEFT JOIN esmax_samples                                   AS tt2  ON  tt2.id_component            = tt1.id_component
                                                                     AND tt2.id                      < tt1.id
                                                                     AND tt2.id_stage                = 4
   WHERE tt1.id = _id_sample
   ORDER BY tt2.id DESC
   LIMIT 1
 )                                                           AS t1
 LEFT JOIN esmax_components                                  AS t2  ON t1.id_component               = t2.id
 LEFT JOIN esmax_component_brands                            AS t3  ON t2.id_component_brand         = t3.id
 LEFT JOIN esmax_component_models                            AS t4  ON t2.id_component_model         = t4.id
 LEFT JOIN esmax_sampling_procedures                         AS t5  ON t2.id_sampling_procedure      = t5.id
 LEFT JOIN esmax_machines                                    AS t6  ON t2.id_machine                 = t6.id
 LEFT JOIN esmax_machine_brands                              AS t7  ON t6.id_machine_brand           = t7.id
 LEFT JOIN esmax_machine_models                              AS t8  ON t6.id_machine_model           = t8.id
 LEFT JOIN esmax_sampling_points                             AS t9  ON t2.id_sampling_point          = t9.id
 LEFT JOIN esmax_lubricants                                  AS t10 ON t2.id_lubricant               = t10.id
 LEFT JOIN esmax_sites                                       AS t11 ON t6.id_site                    = t11.id
 LEFT JOIN esmax_clients                                     AS t12 ON t11.id_client                 = t12.id
 LEFT JOIN esmax_component_types                             AS t13 ON t2.id_component_type          = t13.id
 LEFT JOIN esmax_machine_types                               AS t14 ON t6.id_machine_type            = t14.id
 LEFT JOIN esmax_sample_results                              AS t15 ON t15.id_sample                 = t1.id   AND t15.id_essay = 48
 LEFT JOIN esmax_sample_results                              AS t16 ON t16.id_sample                 = t1.id   AND t16.id_essay = 57
 LEFT JOIN esmax_sample_results                              AS t17 ON t17.id_sample                 = t1.id   AND t17.id_essay = 51
 LEFT JOIN esmax_sample_conditions                           AS t19 ON t1.id_sample_condition        = t19.id
 LEFT JOIN esmax_sample_tracking_states                      AS t20 ON t1.id_sample_tracking_state   = t20.id
 LEFT JOIN esmax_anomaly_types                               AS t21 ON t1.id_anomaly_type            = t21.id;

-- Updating relative ids       
SELECT COUNT(*) INTO _count
FROM esmax_samples                      AS t1
INNER JOIN esmax_samples                AS t2 ON  t2.id_component               = t1.id_component
                                               AND t2.id                         <= t1.id
                                               AND t2.id_stage                   = 4
WHERE t1.id = _id_sample;

UPDATE esmax_reports SET
relative_id = _count, relative_id_prev = IF(_count = 0 , NULL, _count - 1)
WHERE id = _id_sample;

-- Essay results
 INSERT INTO esmax_report_results (
   id_sample,
   date_proposed,
   id_essay,
   essay_name,
   analysis_method,
   minimum,
   maximum,
   value,
   value_prev,
   id_essay_classification
 )
 SELECT
   t1.id                                       AS id_sample,
   t1.date_proposed                            AS date_proposed,
   t3.id                                       AS id_essay,
   t3.name                                     AS essay_name,
   t8.name                                     AS analysis_method,
   CASE
   WHEN t3.id IN (23, 24) THEN t2.lic
   ELSE t2.lsm
   END                                         AS minimum,
   t2.lsc                                      AS maximum,
   t5.value                                    AS value,
   t6.value                                    AS value_prev,
   t4.id                                       AS id_essay_classification
 FROM (
   SELECT
     tt1.date_proposed                         AS date_proposed,
     tt1.id                                    AS id,
     tt2.id                                    AS id_prev,
     tt1.id_lubricant_protocol                 AS id_lubricant_protocol,
     tt1.id_component_protocol                 AS id_component_protocol,
     tt2.id_lubricant_protocol                 AS id_lubricant_protocol_prev,
     tt2.id_component_protocol                 AS id_component_protocol_prev
   FROM esmax_samples                          AS tt1
   LEFT JOIN esmax_samples                     AS tt2 ON  tt2.id_component                 = tt1.id_component
                                                      AND tt2.id                           < tt1.id
                                                      AND tt2.id_stage                     = 4
   WHERE tt1.id = _id_sample
   ORDER BY tt2.id DESC
   LIMIT 1
 )                                             AS t1
 INNER JOIN esmax_essays_protocols             AS t2  ON  t2.id_protocol                   IN (t1.id_lubricant_protocol, t1.id_component_protocol)
 INNER JOIN esmax_essays                       AS t3  ON  t2.id_essay                      = t3.id
 INNER JOIN esmax_essay_classifications        AS t4  ON  t3.id_essay_classification       = t4.id
 LEFT JOIN esmax_sample_results                AS t5  ON  t5.id_sample                     = t1.id
                                                      AND t5.id_essay                      = t3.id
                                                      AND t5.id_protocol                   IN (t1.id_lubricant_protocol, t1.id_component_protocol)
 LEFT  JOIN esmax_sample_results               AS t6  ON  t6.id_sample                     = t1.id_prev
                                                      AND t6.id_essay                      = t3.id
                                                      AND t6.id_protocol                   IN (t1.id_lubricant_protocol_prev, t1.id_component_protocol_prev)
 INNER JOIN esmax_analysis_methods             AS t8  ON  t3.id_essay_analysis_method      = t8.id
 ORDER BY t3.id;


-- Logs
INSERT INTO esmax_sample_logs 
(id_sample, id_stage, name, date_stage, rut_client, dv_client)
  SELECT  
    t1.id                                  AS id_sample,
    4                                      AS id_stage,
    t4.name                                AS name,
    t1.date_proposed                       AS date_stage,
    t5.rut                                 AS rut_client,
    t5.dv                                  AS dv_client
  FROM esmax_samples                       AS t1
  INNER JOIN esmax_components              AS t2 ON t1.id_component = t2.id
  INNER JOIN esmax_machines                AS t3 ON t2.id_machine = t3.id
  INNER JOIN esmax_sites                   AS t4 ON t3.id_site = t4.id
  INNER JOIN esmax_clients                 AS t5 ON t4.id_client = t5.id
  WHERE t1.id = _id_sample;

END//

-- ----------------------------
CREATE PROCEDURE copy_sample_results() 
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE _id_sample INT(11);
  DECLARE _essays TEXT;
  DECLARE cur CURSOR FOR SELECT id_sample, essays FROM tmp_esmax WHERE id_sample IS NOT NULL ORDER BY samping_date;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;

  OPEN cur;

  testLoop: LOOP
    FETCH cur INTO _id_sample, _essays;
    IF done THEN
      LEAVE testLoop;
    END IF;
    CALL extract_essays(_id_sample, _essays);
    CALL create_report(_id_sample);
  END LOOP testLoop;

  CLOSE cur;
END//

DELIMITER ;

CALL copy_sample_results();

DROP PROCEDURE IF EXISTS copy_sample_results;
DROP PROCEDURE IF EXISTS extract_essays;
DROP PROCEDURE IF EXISTS create_report;

TRUNCATE TABLE tmp_esmax;

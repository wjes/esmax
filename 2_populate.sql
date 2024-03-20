DROP PROCEDURE IF EXISTS copy_from_antofa;
DELIMITER //
CREATE PROCEDURE copy_from_antofa()
BEGIN

  DECLARE p_columns_string TEXT;
  DECLARE p_table_name TEXT;
  DECLARE p_table_names TEXT DEFAULT REPLACE('
esmax_analysis_methods,
esmax_anomaly_types,
esmax_component_brands,
esmax_component_change_motive,
esmax_component_change_motives,
esmax_component_models,
esmax_essay_classifications,
esmax_essay_units,
esmax_essays,
esmax_image_levels,
esmax_images,
esmax_lubricant_brands,
esmax_lubricant_change_refill_motives,
esmax_lubricant_change_refills,
esmax_lubricant_models,
esmax_lubricant_paths,
esmax_lubricants,
esmax_machine_brands,
esmax_machine_models,
esmax_protocol_types,
esmax_result_types,
esmax_result_units,
esmax_sample_conditions,
esmax_sample_priorities,
esmax_sample_stages,
esmax_sample_tracking_states,
esmax_sampling_points,
esmax_sampling_procedures', '\n', '');

  read_loop: LOOP
    IF LENGTH(TRIM(p_table_names)) = 0 OR p_table_names IS NULL THEN
      LEAVE read_loop;
    END IF;
    SET p_table_name = SUBSTRING_INDEX(p_table_names,',',1);
    SELECT p_table_name;
    SELECT TRIM(BOTH ',' FROM REPLACE(CONCAT(',', GROUP_CONCAT(COLUMN_NAME), ','), ',id,', ',')) INTO p_columns_string FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = p_table_name;
    PREPARE stmt FROM CONCAT('INSERT INTO ', p_table_name, ' ( ', p_columns_string, ' ) SELECT ', p_columns_string, ' FROM ', REPLACE(p_table_name, 'esmax_', 'antofagasta_'));
    EXECUTE stmt;
    SET p_table_names = INSERT(p_table_names, 1, IF(p_table_names REGEXP ',', INSTR(p_table_names, ','), -1), '');
  END LOOP;
END//
DELIMITER ;
CALL copy_from_antofa();
DROP PROCEDURE IF EXISTS copy_from_antofa;

INSERT INTO esmax_protocols (id, name, id_protocol_type, id_client) VALUES 
(1, 'Dummy AFQ', 1, 0),
(2, 'Dummy Metal', 2, 0);

INSERT INTO esmax_protocols (id, name, id_protocol_type, id_client) 
SELECT 
  t1.id                    AS id, 
  t1.name                  AS name, 
  t1.id_protocol_type      AS id_protocol_type, 
  0                        AS id_client
FROM antofagasta_protocols AS t1 
WHERE t1.id IN (
-- Metal
489,
490,
491,
492,
493,
494,
495,
496,
497,
498,
499,
505,
506,
507,
508,
509,
511,
512,
513,
514,
515,
516,
517,
518,
519,
520,
521,
522,
523,
524,
525,
526,
527,
528,
529,
530,
569,
794,
795,
796,
797,
798,
1511,
-- AFQ
29,
30,
31,
37,
38,
39,
41,
42,
43,
76,
77,
78,
79,
80,
121,
37,
138,
139,
140,
141,
142,
408,
409,
410,
-- AFQ - LUBRAX
552,
790,
793,
815,
881,
919,
981,
988,
1013,
-- AFQ - SHELL
167,
168,
169,
170,
171,
172,
173,
174,
178,
180,
181,
182,
183,
185,
186,
187,
188,
189,
254,
255,
256,
257,
321,
322,
323,
324,
325,
326,
1352,
1562,
1579
)
ORDER BY t1.id;

INSERT INTO esmax_essays_protocols (id_protocol, id_essay) VALUES 
( 2,  1 ), 
( 2,  2 ), 
( 2,  3 ), 
( 2,  4 ), 
( 2,  5 ), 
( 2,  6 ), 
( 2,  7 ), 
( 2,  8 ), 
( 2,  9 ), 
( 2, 10 ), 
( 2, 11 ), 
( 2, 12 ), 
( 2, 13 ), 
( 2, 14 ), 
( 2, 15 ), 
( 1, 16 ), 
( 1, 17 ), 
( 1, 18 ), 
( 1, 19 ), 
( 1, 20 ), 
( 1, 21 ), 
( 1, 22 ), 
( 1, 23 ), 
( 1, 24 ), 
( 1, 26 ), 
( 1, 27 ), 
( 1, 28 ), 
( 1, 29 ), 
( 1, 30 ), 
( 1, 31 ), 
( 1, 32 ), 
( 1, 33 ), 
( 1, 44 ), 
( 1, 45 ), 
( 1, 46 ), 
( 1, 47 ), 
( 1, 55 ), 
( 1, 58 );

INSERT INTO esmax_essays_protocols (id_protocol, id_essay, lic, lim, lsm, lsc) 
SELECT  
  t2.id_protocol                         AS id_protocol, 
  t2.id_essay                            AS id_essay, 
  t2.lic                                 AS lic, 
  t2.lim                                 AS lim, 
  t2.lsm                                 AS lsm, 
  t2.lsc                                 AS lsc 
FROM esmax_protocols                     AS t1
INNER JOIN antofagasta_essays_protocols  AS t2 ON t1.id = t2.id_protocol
WHERE t1.id NOT IN (1, 2);

-- All lubricant protocols to dummy by default
UPDATE esmax_lubricants AS t1
LEFT JOIN esmax_protocols AS t2 ON t1.id_protocol = t2.id
SET id_protocol = 1
WHERE t2.id IS NULL;

INSERT INTO esmax_essays 
(id, name, id_essay_unit, id_essay_analysis_method, id_essay_classification, id_result_type, id_result_unit, id_protocol_type) 
VALUES 
(58, 'Glycol', 1, 9, 4, 3, 0, 1);





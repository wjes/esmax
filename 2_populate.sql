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

INSERT INTO esmax_protocols (name, id_protocol_type, id_client) VALUES 
('Dummy AFQ', 1, 0), 
('Dummy Metal', 2, 0);

-- All lubricant protocols to dummy
UPDATE esmax_lubricants SET id_protocol = 1;

INSERT INTO esmax_essays 
(id, name, id_essay_unit, id_essay_analysis_method, id_essay_classification, id_result_type, id_result_unit, id_protocol_type) 
VALUES 
(58, 'Glycol', 1, 9, 4, 3, 0, 1);

INSERT INTO esmax_essays_protocols (id_essay, id_protocol) VALUES 
(  1, 2), 
(  2, 2), 
(  3, 2), 
(  4, 2), 
(  5, 2), 
(  6, 2), 
(  7, 2), 
(  8, 2), 
(  9, 2), 
( 10, 2), 
( 11, 2), 
( 12, 2), 
( 13, 2), 
( 14, 2), 
( 15, 2), 
( 16, 1), 
( 17, 1), 
( 18, 1), 
( 19, 1), 
( 20, 1), 
( 21, 1), 
( 22, 1), 
( 23, 1), 
( 24, 1), 
( 25, 1), 
( 26, 1), 
( 27, 1), 
( 28, 1), 
( 29, 1), 
( 30, 1), 
( 31, 1), 
( 32, 1), 
( 33, 1), 
( 44, 1), 
( 45, 1), 
( 46, 1), 
( 47, 1), 
( 48, 1), 
( 55, 1), 
( 58, 1);

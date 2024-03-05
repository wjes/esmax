

--
-- Table structure for table `esmax_analysis_methods`
--

DROP TABLE IF EXISTS `esmax_analysis_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_analysis_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_anomaly_types`
--

DROP TABLE IF EXISTS `esmax_anomaly_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_anomaly_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_clients`
--

DROP TABLE IF EXISTS `esmax_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_clients` (
  `id_city` int(11) NOT NULL DEFAULT 443687,
  `id_region` int(11) NOT NULL DEFAULT 1673,
  `id_country` int(11) NOT NULL DEFAULT 81,
  `id_api_key` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` bigint(20) NOT NULL,
  `dv` char(1) NOT NULL,
  `registered_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `legal_address` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`),
  KEY `id_api_key` (`id_api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_clients_cases`
--

DROP TABLE IF EXISTS `esmax_clients_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_clients_cases` (
  `id_client` int(11) NOT NULL,
  `id_case` int(11) NOT NULL,
  `emails` varchar(255) NOT NULL,
  PRIMARY KEY (`id_client`,`id_case`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_collections`
--

DROP TABLE IF EXISTS `esmax_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,3) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_component_brands`
--

DROP TABLE IF EXISTS `esmax_component_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_component_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_component_change_motive`
--

DROP TABLE IF EXISTS `esmax_component_change_motive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_component_change_motive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_component_change_motives`
--

DROP TABLE IF EXISTS `esmax_component_change_motives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_component_change_motives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_component_models`
--

DROP TABLE IF EXISTS `esmax_component_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_component_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_component_brand` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_component_brand` (`id_component_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_component_types`
--

DROP TABLE IF EXISTS `esmax_component_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_component_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `priority_order` int(7) NOT NULL DEFAULT 99,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_components`
--

DROP TABLE IF EXISTS `esmax_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `name` text DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `id_machine` int(11) NOT NULL,
  `id_lubricant` int(11) NOT NULL,
  `liters` decimal(10,3) DEFAULT NULL,
  `id_component_brand` int(11) NOT NULL,
  `id_component_type` int(11) NOT NULL,
  `id_protocol` int(11) NOT NULL,
  `id_collection` int(11) DEFAULT NULL,
  `id_component_model` int(11) NOT NULL,
  `id_sampling_point` int(11) NOT NULL,
  `id_sampling_procedure` int(11) NOT NULL,
  `unsampled_active` int(1) DEFAULT NULL,
  `id_unsampled_interval_type` int(11) DEFAULT NULL,
  `unsampled_interval` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`),
  KEY `tag_2` (`tag`),
  KEY `id_machine` (`id_machine`),
  KEY `id_lubricant` (`id_lubricant`),
  KEY `id_component_brand` (`id_component_brand`),
  KEY `id_component_type` (`id_component_type`),
  KEY `id_protocol` (`id_protocol`),
  KEY `id_collection` (`id_collection`),
  KEY `id_component_model` (`id_component_model`),
  KEY `id_sampling_point` (`id_sampling_point`),
  KEY `id_sampling_procedure` (`id_sampling_procedure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_essay_classifications`
--

DROP TABLE IF EXISTS `esmax_essay_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_essay_classifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_essay_units`
--

DROP TABLE IF EXISTS `esmax_essay_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_essay_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_essays`
--

DROP TABLE IF EXISTS `esmax_essays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_essays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_essay_unit` int(11) NOT NULL,
  `id_essay_analysis_method` int(11) NOT NULL,
  `id_essay_classification` int(11) NOT NULL,
  `id_result_type` int(11) NOT NULL,
  `id_result_unit` int(11) NOT NULL,
  `id_protocol_type` int(11) NOT NULL,
  `use_comment` tinyint(1) NOT NULL DEFAULT 0,
  `use_in_logics` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_essay_unit` (`id_essay_unit`),
  KEY `id_essay_analysis_method` (`id_essay_analysis_method`),
  KEY `id_essay_classification` (`id_essay_classification`),
  KEY `id_result_type` (`id_result_type`),
  KEY `id_result_unit` (`id_result_unit`),
  KEY `id_protocol_type` (`id_protocol_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_essays_protocols`
--

DROP TABLE IF EXISTS `esmax_essays_protocols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_essays_protocols` (
  `id_protocol` int(11) NOT NULL,
  `id_essay` int(11) NOT NULL,
  `lic` decimal(10,3) DEFAULT NULL,
  `lim` decimal(10,3) DEFAULT NULL,
  `lsm` decimal(10,3) DEFAULT NULL,
  `lsc` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id_protocol`,`id_essay`),
  KEY `id_protocol` (`id_protocol`),
  KEY `id_essay` (`id_essay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_fleets`
--

DROP TABLE IF EXISTS `esmax_fleets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_fleets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_image_levels`
--

DROP TABLE IF EXISTS `esmax_image_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_image_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_images`
--

DROP TABLE IF EXISTS `esmax_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_element` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_level` (`id_level`),
  KEY `id_type` (`id_type`),
  KEY `id_element` (`id_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_logics`
--

DROP TABLE IF EXISTS `esmax_logics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_logics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_protocol` int(11) NOT NULL,
  `logic` text NOT NULL,
  `id_state` int(11) NOT NULL,
  `id_suggestion` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_sample_condition` int(11) NOT NULL,
  `id_anomaly_type` int(11) NOT NULL,
  `id_sample_tracking_state` int(11) NOT NULL,
  `recommendation` TEXT,
  `created` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_state` (`id_state`),
  KEY `id_suggestion` (`id_suggestion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_lubricant_brands`
--

DROP TABLE IF EXISTS `esmax_lubricant_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_lubricant_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_lubricant_change_refill_motives`
--

DROP TABLE IF EXISTS `esmax_lubricant_change_refill_motives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_lubricant_change_refill_motives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_lubricant_change_refills`
--

DROP TABLE IF EXISTS `esmax_lubricant_change_refills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_lubricant_change_refills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_lubricant_models`
--

DROP TABLE IF EXISTS `esmax_lubricant_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_lubricant_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_brand` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_lubricant_paths`
--

DROP TABLE IF EXISTS `esmax_lubricant_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_lubricant_paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_lubricants`
--

DROP TABLE IF EXISTS `esmax_lubricants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_lubricants` (
  `id_lubricant_model` int(11) DEFAULT NULL,
  `id_lubricant_brand` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_protocol` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_machine_brands`
--

DROP TABLE IF EXISTS `esmax_machine_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_machine_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_machine_models`
--

DROP TABLE IF EXISTS `esmax_machine_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_machine_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_machine_brand` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_machine_brand` (`id_machine_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_machine_types`
--

DROP TABLE IF EXISTS `esmax_machine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_machine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `priority_order` int(7) NOT NULL DEFAULT 99,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_machines`
--

DROP TABLE IF EXISTS `esmax_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_machines` (
  `id_fleet` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_machine_brand` int(11) NOT NULL,
  `id_machine_model` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_machine_type` int(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_machine_brand` (`id_machine_brand`),
  KEY `id_machine_model` (`id_machine_model`),
  KEY `id_machine_type` (`id_machine_type`),
  KEY `id_site` (`id_site`),
  KEY `id_fleet` (`id_fleet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_massive_samples`
--

DROP TABLE IF EXISTS `esmax_massive_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_massive_samples` (
  `date_entry` datetime DEFAULT NULL,
  `run_entry` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_insert` datetime DEFAULT NULL,
  `run_insert` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_stage` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id_stage` (`id_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_protocol_types`
--

DROP TABLE IF EXISTS `esmax_protocol_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_protocol_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_protocols`
--

DROP TABLE IF EXISTS `esmax_protocols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_protocols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_protocol_type` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_report_results`
--

DROP TABLE IF EXISTS `esmax_report_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_report_results` (
  `id_sample` int(11) NOT NULL,
  `date_proposed` datetime DEFAULT NULL,
  `id_essay` int(11) NOT NULL,
  `essay_name` varchar(255) DEFAULT NULL,
  `analysis_method` varchar(255) DEFAULT NULL,
  `minimum` varchar(45) DEFAULT NULL,
  `maximum` varchar(45) DEFAULT NULL,
  `value_ref` varchar(45) DEFAULT NULL,
  `value_prev` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `id_essay_classification` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sample`,`id_essay`),
  KEY `id_sample` (`id_sample`),
  KEY `id_essay` (`id_essay`),
  KEY `id_essay_classification` (`id_essay_classification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_reports`
--

DROP TABLE IF EXISTS `esmax_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_reports` (
  `liters` decimal(10,3) DEFAULT NULL,
  `sample_tracking_states` varchar(255) DEFAULT NULL,
  `graph_1` text DEFAULT NULL,
  `graph_2` text DEFAULT NULL,
  `graph_3` text DEFAULT NULL,
  `graph_4` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_proposed` datetime DEFAULT NULL,
  `client` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `site` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `responsible` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `component_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `component_brand` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `component_model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lubricant_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `machine_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `machine_brand` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `machine_model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `component_tag` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_sampling_ref` datetime DEFAULT NULL,
  `date_sampling_prev` datetime DEFAULT NULL,
  `date_sampling` datetime DEFAULT NULL,
  `date_receive_ref` datetime DEFAULT NULL,
  `date_receive_prev` datetime DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `date_report_ref` datetime DEFAULT NULL,
  `date_report_prev` datetime DEFAULT NULL,
  `date_report` datetime DEFAULT NULL,
  `component_continuity_ref` varchar(255) DEFAULT NULL,
  `component_continuity_prev` varchar(255) DEFAULT NULL,
  `component_continuity` varchar(255) DEFAULT NULL,
  `lubricant_continuity_ref` varchar(255) DEFAULT NULL,
  `lubricant_continuity_prev` varchar(255) DEFAULT NULL,
  `lubricant_continuity` varchar(255) DEFAULT NULL,
  `relative_id_prev` int(11) DEFAULT NULL,
  `relative_id` int(11) DEFAULT NULL,
  `sampling_procedure` varchar(255) DEFAULT NULL,
  `sampling_point` varchar(255) DEFAULT NULL,
  `client_legal_address` varchar(255) DEFAULT NULL,
  `sampling_condition` varchar(255) DEFAULT NULL,
  `state` text DEFAULT NULL,
  `suggestion` text DEFAULT NULL,
  `anomaly_type` varchar(255) DEFAULT NULL,
  `patch_test_1_file` varchar(255) DEFAULT NULL,
  `patch_test_2_file` varchar(255) DEFAULT NULL,
  `patch_test_1_comment` text DEFAULT NULL,
  `patch_test_2_comment` text DEFAULT NULL,
  `magnetic_plug_1_file` varchar(255) DEFAULT NULL,
  `magnetic_plug_2_file` varchar(255) DEFAULT NULL,
  `magnetic_plug_1_comment` text DEFAULT NULL,
  `magnetic_plug_2_comment` text DEFAULT NULL,
  `ferrography_1_file` varchar(255) DEFAULT NULL,
  `ferrography_2_file` varchar(255) DEFAULT NULL,
  `ferrography_1_comment` text DEFAULT NULL,
  `ferrography_2_comment` text DEFAULT NULL,
  `MAX(id_propuesta_informe)` int(11) DEFAULT NULL,
  `graph_5` text DEFAULT NULL,
  `graph_6` text DEFAULT NULL,
  `machine_continuity_ref` varchar(255) DEFAULT NULL,
  `machine_continuity_prev` varchar(255) DEFAULT NULL,
  `machine_continuity` varchar(255) DEFAULT NULL,
  `recommendation` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_result_comments`
--

DROP TABLE IF EXISTS `esmax_result_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_result_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_result_types`
--

DROP TABLE IF EXISTS `esmax_result_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_result_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_result_units`
--

DROP TABLE IF EXISTS `esmax_result_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_result_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sample_conditions`
--

DROP TABLE IF EXISTS `esmax_sample_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sample_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sample_logs`
--

DROP TABLE IF EXISTS `esmax_sample_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sample_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sample` int(11) NOT NULL,
  `id_stage` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `rut_client` bigint(20) DEFAULT NULL,
  `dv_client` char(1) DEFAULT NULL,
  `date_stage` datetime DEFAULT NULL,
  `run_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sample` (`id_sample`),
  KEY `id_stage` (`id_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sample_priorities`
--

DROP TABLE IF EXISTS `esmax_sample_priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sample_priorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sample_results`
--

DROP TABLE IF EXISTS `esmax_sample_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sample_results` (
  `id_sample` int(11) NOT NULL,
  `id_essay` int(11) NOT NULL,
  `id_protocol` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_resampled` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_sample`,`id_essay`),
  KEY `id_sample` (`id_sample`),
  KEY `id_essay` (`id_essay`),
  KEY `id_protocol` (`id_protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sample_stages`
--

DROP TABLE IF EXISTS `esmax_sample_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sample_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sample_tracking_states`
--

DROP TABLE IF EXISTS `esmax_sample_tracking_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sample_tracking_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_samples`
--

DROP TABLE IF EXISTS `esmax_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_samples` (
  `date_sampling` datetime DEFAULT NULL,
  `date_entry` datetime DEFAULT NULL,
  `id_sample_priority` int(11) NOT NULL DEFAULT 1,
  `id_stage` int(11) NOT NULL DEFAULT 1,
  `date_receive` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_massive` int(11) DEFAULT NULL,
  `external_number` varchar(255) DEFAULT NULL,
  `id_lubricant` int(11) NOT NULL,
  `id_lubricant_protocol` int(11) NOT NULL,
  `run_entry` bigint(20) DEFAULT NULL,
  `id_sample_condition` int(11) DEFAULT NULL,
  `state` text DEFAULT NULL,
  `suggestion` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `id_component` int(11) NOT NULL,
  `id_sample_ref` int(11) DEFAULT NULL,
  `machine_continuity` int(11) DEFAULT NULL,
  `lubricant_continuity` int(11) DEFAULT NULL,
  `number_of_refills` int(11) DEFAULT NULL,
  `id_component_protocol` int(11) NOT NULL,
  `id_anomaly_type` int(11) DEFAULT NULL,
  `id_sample_tracking_state` int(11) DEFAULT NULL,
  `id_component_change_motive` int(11) DEFAULT NULL,
  `id_lubricant_change_refill` int(11) DEFAULT NULL,
  `id_lubricant_change_refill_motive` int(11) DEFAULT NULL,
  `lubricant_change_refill_liters` int(11) DEFAULT NULL,
  `lubricant_change_refill_hours` int(11) DEFAULT NULL,
  `date_withdraw` datetime DEFAULT NULL,
  `run_receive` bigint(20) DEFAULT NULL,
  `run_essay` bigint(20) DEFAULT NULL,
  `date_essay` datetime DEFAULT NULL,
  `component_continuity` int(11) DEFAULT NULL,
  `component_change` varchar(255) DEFAULT NULL,
  `scaa_number` int(11) DEFAULT NULL COMMENT 'TODO: Extract scaa_number from external_number',
  `date_proposed` datetime DEFAULT NULL,
  `is_reprocessed` tinyint(1) NOT NULL DEFAULT 0,
  `run_proposed` bigint(20) DEFAULT NULL,
  `work_order` varchar(50) DEFAULT NULL,
  `priority_order` int(7) NOT NULL DEFAULT 99,
  `recommendation` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scaa_number` (`scaa_number`),
  KEY `date_sampling` (`date_sampling`),
  KEY `date_entry` (`date_entry`),
  KEY `id_sample_priority` (`id_sample_priority`),
  KEY `id_stage` (`id_stage`),
  KEY `date_receive` (`date_receive`),
  KEY `id_massive` (`id_massive`),
  KEY `external_number` (`external_number`),
  KEY `id_lubricant` (`id_lubricant`),
  KEY `id_lubricant_protocol` (`id_lubricant_protocol`),
  KEY `id_sample_condition` (`id_sample_condition`),
  KEY `id_component` (`id_component`),
  KEY `id_sample_ref` (`id_sample_ref`),
  KEY `id_component_protocol` (`id_component_protocol`),
  KEY `id_anomaly_type` (`id_anomaly_type`),
  KEY `id_sample_tracking_state` (`id_sample_tracking_state`),
  KEY `id_component_change_motive` (`id_component_change_motive`),
  KEY `id_lubricant_change_refill` (`id_lubricant_change_refill`),
  KEY `id_lubricant_change_refill_motive` (`id_lubricant_change_refill_motive`),
  KEY `date_withdraw` (`date_withdraw`),
  KEY `date_essay` (`date_essay`),
  KEY `scaa_number_2` (`scaa_number`),
  KEY `date_proposed` (`date_proposed`),
  KEY `is_reprocessed` (`is_reprocessed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sampling_points`
--

DROP TABLE IF EXISTS `esmax_sampling_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sampling_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sampling_procedures`
--

DROP TABLE IF EXISTS `esmax_sampling_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sampling_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_shift_changes`
--

DROP TABLE IF EXISTS `esmax_shift_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_shift_changes` (
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `counts` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL DEFAULT '',
  `comments` text NOT NULL DEFAULT '',
  `id_role` int(11) NOT NULL,
  `manuals` varchar(255) DEFAULT NULL,
  `pending` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`date_from`,`date_to`,`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sites`
--

DROP TABLE IF EXISTS `esmax_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sites` (
  `massive_name` varchar(255) DEFAULT NULL,
  `massive_short_name` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_client` int(11) NOT NULL,
  `latitude` decimal(10,3) DEFAULT NULL,
  `longitude` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_sites_cases`
--

DROP TABLE IF EXISTS `esmax_sites_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_sites_cases` (
  `id_site` int(11) NOT NULL,
  `id_case` int(11) NOT NULL,
  `emails` varchar(255) NOT NULL,
  `id_machine_type` int(11) NOT NULL,
  PRIMARY KEY (`id_site`,`id_case`,`id_machine_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_states`
--

DROP TABLE IF EXISTS `esmax_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_suggestions`
--

DROP TABLE IF EXISTS `esmax_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_unsampled_interval_types`
--

DROP TABLE IF EXISTS `esmax_unsampled_interval_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_unsampled_interval_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `esmax_unused_samples`
--

DROP TABLE IF EXISTS `esmax_unused_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esmax_unused_samples` (
  `date_sampling` datetime DEFAULT NULL,
  `date_entry` datetime DEFAULT NULL,
  `id_sample_priority` int(11) NOT NULL DEFAULT 1,
  `id_stage` int(11) NOT NULL DEFAULT 1,
  `date_receive` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lubricant` int(11) NOT NULL,
  `id_lubricant_protocol` int(11) NOT NULL,
  `run_entry` bigint(20) DEFAULT NULL,
  `id_sample_condition` int(11) DEFAULT NULL,
  `id_state` int(11) DEFAULT NULL COMMENT 'TODO: Map states with the corresponding id',
  `state` text DEFAULT NULL COMMENT 'TODO: After mapping this field should disappear',
  `id_suggestion` int(11) DEFAULT NULL COMMENT 'TODO: Map suggestions with the corresponding id',
  `suggestion` text DEFAULT NULL COMMENT 'TODO: After mapping this field should disappear',
  `comment` text DEFAULT NULL,
  `id_site` int(11) NOT NULL,
  `date_withdraw` datetime DEFAULT NULL,
  `run_receive` bigint(20) DEFAULT NULL,
  `run_essay` bigint(20) DEFAULT NULL,
  `date_essay` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sample_priority` (`id_sample_priority`),
  KEY `id_stage` (`id_stage`),
  KEY `id_lubricant` (`id_lubricant`),
  KEY `id_lubricant_protocol` (`id_lubricant_protocol`),
  KEY `id_sample_condition` (`id_sample_condition`),
  KEY `id_site` (`id_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- This table will be deleted with migrate.sql
DROP TABLE IF EXISTS tmp_esmax;
CREATE TABLE tmp_esmax (
  id_sample INT(11),
  external_number VARCHAR(255),
  samping_date DATE,
  withdraw_date DATETIME,
  proposed_date DATETIME,
  id_client INT(11),
  client VARCHAR(255),
  id_site INT(11),
  site VARCHAR(255),
  id_machine_type INT(11),
  machine_type VARCHAR(255),
  id_machine INT(11),
  machine VARCHAR(255),
  id_component INT(11),
  component VARCHAR(255),
  id_component_type INT(11),
  component_type VARCHAR(255),
  tag VARCHAR(255),
  id_lubricant INT(11),
  lubricant VARCHAR(255),
  recommendation TEXT,
  id_sample_condition INT(11),
  id_anomaly_type INT(11),
  id_tracking_state INT(11),
  machine_continuity INT(11),
  lubricant_continuity INT(11),
  essays TEXT
);

-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: transport_company
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `drivers_no_trips_yesterday`
--

DROP TABLE IF EXISTS `drivers_no_trips_yesterday`;
/*!50001 DROP VIEW IF EXISTS `drivers_no_trips_yesterday`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `drivers_no_trips_yesterday` AS SELECT 
 1 AS `Driver_id`,
 1 AS `Driver_name`,
 1 AS `Class_driver`,
 1 AS `license_plate`,
 1 AS `brand`,
 1 AS `vehicle_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `trip_costs`
--

DROP TABLE IF EXISTS `trip_costs`;
/*!50001 DROP VIEW IF EXISTS `trip_costs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trip_costs` AS SELECT 
 1 AS `trip_id`,
 1 AS `Driver_id`,
 1 AS `Driver_name`,
 1 AS `departure_point`,
 1 AS `arrival_point`,
 1 AS `departure_time`,
 1 AS `distance_km`,
 1 AS `base_rate_per_km`,
 1 AS `ratio`,
 1 AS `trip_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!50001 DROP VIEW IF EXISTS `statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statistics` AS SELECT 
 1 AS `date`,
 1 AS `trip_count`,
 1 AS `avg_trip_cost`,
 1 AS `avg_distance_km`,
 1 AS `avg_duration_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `drivers_no_trips_yesterday`
--

/*!50001 DROP VIEW IF EXISTS `drivers_no_trips_yesterday`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drivers_no_trips_yesterday` AS select `d`.`Driver_id` AS `Driver_id`,`d`.`Driver_name` AS `Driver_name`,`d`.`Class_driver` AS `Class_driver`,`v`.`License_plate` AS `license_plate`,`v`.`brand` AS `brand`,`vt`.`Type_name` AS `vehicle_type` from (((`drivers` `d` left join `vehicles` `v` on((`d`.`License_plate` = `v`.`License_plate`))) left join `vehicle_types` `vt` on((`v`.`Type_name` = `vt`.`Type_name`))) left join `trips` `t` on(((`t`.`Driver_id` = `d`.`Driver_id`) and (cast(`t`.`departure_time` as date) = (curdate() - interval 1 day))))) where (`t`.`trip_id` is null) order by `d`.`Driver_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trip_costs`
--

/*!50001 DROP VIEW IF EXISTS `trip_costs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trip_costs` AS select `t`.`trip_id` AS `trip_id`,`t`.`Driver_id` AS `Driver_id`,`d`.`Driver_name` AS `Driver_name`,`t`.`departure_point` AS `departure_point`,`t`.`arrival_point` AS `arrival_point`,`t`.`departure_time` AS `departure_time`,`t`.`distance_km` AS `distance_km`,`vt`.`base_rate_per_km` AS `base_rate_per_km`,`v`.`Ratio` AS `ratio`,round(((`vt`.`base_rate_per_km` * `v`.`Ratio`) * `t`.`distance_km`),2) AS `trip_cost` from (((`trips` `t` join `drivers` `d` on((`t`.`Driver_id` = `d`.`Driver_id`))) join `vehicles` `v` on((`d`.`License_plate` = `v`.`License_plate`))) join `vehicle_types` `vt` on((`v`.`Type_name` = `vt`.`Type_name`))) order by `t`.`departure_time` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statistics`
--

/*!50001 DROP VIEW IF EXISTS `statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `statistics` AS select cast(`t`.`departure_time` as date) AS `date`,count(0) AS `trip_count`,round(avg(((`vt`.`base_rate_per_km` * `t`.`distance_km`) * `v`.`Ratio`)),2) AS `avg_trip_cost`,round(avg(`t`.`distance_km`),1) AS `avg_distance_km`,round(avg((timestampdiff(MINUTE,`t`.`departure_time`,`t`.`arrival_time`) / 60.0)),1) AS `avg_duration_hours` from (((`trips` `t` join `drivers` `d` on((`t`.`Driver_id` = `d`.`Driver_id`))) join `vehicles` `v` on((`d`.`License_plate` = `v`.`License_plate`))) join `vehicle_types` `vt` on((`v`.`Type_name` = `vt`.`Type_name`))) group by cast(`t`.`departure_time` as date) order by `date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 11:20:32

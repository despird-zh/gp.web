# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.12)
# Database: gpress
# Generation Time: 2016-07-27 10:31:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



--
-- Dumping routines (PROCEDURE) for database 'gpress'
--
DELIMITER ;;

# Dump of PROCEDURE proc_fid2path
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `proc_fid2path` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gpadmin`@`localhost`*/ /*!50003 PROCEDURE `proc_fid2path`(in `p_folder_id` integer, out p_folder_path varchar(2048))
BEGIN
	declare v_fpath varchar(256);
	declare v_pid integer default 0;
	declare v_f_cnt integer default 1;
	declare v_fid integer default 0;
	
	/* initial the output value */
	set p_folder_path = '';
	set v_fid = p_folder_id;
	while v_pid != -99 and v_f_cnt > 0 do
		select folder_name,folder_pid, count(folder_id) into v_fpath, v_pid, v_f_cnt from gp_cab_folders where folder_id = v_fid;
	
		if v_f_cnt > 0 and p_folder_path = '' then
			set p_folder_path = concat('/', v_fpath);
		else
			set p_folder_path = concat(p_folder_path, '/', v_fpath);
		end if;
		set v_fid = v_pid;
	end while;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE proc_org_route
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `proc_org_route` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gpadmin`@`localhost`*/ /*!50003 PROCEDURE `proc_org_route`(in `p_org_id` integer, out `route_ids` varchar(2048))
BEGIN
	
	declare v_pid integer default 0;
	declare v_p_cnt integer default 1;
	declare v_org_id integer ;
	
	set v_org_id = p_org_id;
	set route_ids = '';
	while v_p_cnt > 0 and v_pid != -99 do
		select org_pid, count(org_id) into v_pid, v_p_cnt from gp_org_hier where org_id = v_org_id;
		
		if v_p_cnt > 0 and route_ids = '' then
			set route_ids = v_org_id;
		else
			set route_ids = concat(v_org_id ,'-', route_ids);
		end if;
		set v_org_id = v_pid;
	end while;
	
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE proc_path2fid
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `proc_path2fid` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gpadmin`@`localhost`*/ /*!50003 PROCEDURE `proc_path2fid`(IN `p_cabinet_id` integer,IN `p_folder_path` varchar(2048),OUT `p_folder_id` integer)
BEGIN
	DECLARE v_folder_name varchar(256);
	declare v_idx integer default 1;
	declare v_folder_pid integer default -98;

	repeat
		select func_split_str(p_folder_path,'/',v_idx) into v_folder_name;
		if v_folder_name = '' THEN
			set p_folder_id = v_folder_pid;
		ELSE
			select folder_id into v_folder_pid from gp_cab_folders 
				where folder_name = v_folder_name 
					and cabinet_id = p_cabinet_id 
					and folder_pid = v_folder_pid;
		end if;
		set v_idx = v_idx + 1;
		until v_folder_name = ''
	end repeat; 
	
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE proc_wgroup_route
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `proc_wgroup_route` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gpadmin`@`localhost`*/ /*!50003 PROCEDURE `proc_wgroup_route`(in `p_wgroup_id` integer, out `route_ids` varchar(2048))
BEGIN
	
	declare v_pid integer default 0;
	declare v_p_cnt integer default 1;
	declare v_wgroup_id integer ;
	
	set v_wgroup_id = p_wgroup_id;
	set route_ids = '';
	while v_p_cnt > 0 and v_pid != -99 do
		select workgroup_pid, count(workgroup_id) into v_pid, v_p_cnt from gp_workgroups where workgroup_id = v_wgroup_id;
		
		if v_p_cnt > 0 and route_ids = '' then
			set route_ids = v_wgroup_id;
		else
			set route_ids = concat(v_wgroup_id ,'-', route_ids);
		end if;
		set v_wgroup_id = v_pid;
	end while;
	
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

--
-- Dumping routines (FUNCTION) for database 'gpress'
--
DELIMITER ;;

# Dump of FUNCTION func_split_str
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `func_split_str` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`gpadmin`@`localhost`*/ /*!50003 FUNCTION `func_split_str`(x VARCHAR(255),
  delim VARCHAR(12),
  pos INT) RETURNS varchar(255) CHARSET utf8
BEGIN
RETURN REPLACE(
	SUBSTRING(
		SUBSTRING_INDEX(x, delim, pos + 1),
       LENGTH(SUBSTRING_INDEX(x, delim, pos)) + 1),
       delim, '');
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

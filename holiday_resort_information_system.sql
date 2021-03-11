/*
 Navicat Premium Data Transfer

 Source Server         : tammim
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : localhost:3306
 Source Schema         : sunny_holidays

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : 65001

 Date: 01/02/2018 11:57:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking`  (
  `booking_id` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Start_date` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `End_date` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unit_id` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`Unit_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('B2001', '01-July-2018', '14-July-2018', 9934);
INSERT INTO `booking` VALUES ('B2003', '07-July-2018', '14-July-2018', 4500);
INSERT INTO `booking` VALUES ('B2009', '07-July-2018', '14-July-2018', 5670);
INSERT INTO `booking` VALUES ('B2010', '07-July-2018', '14-July-2018', 2321);
INSERT INTO `booking` VALUES ('B2013', '15-July-2018', '29 July 2018', 2500);

-- ----------------------------
-- Table structure for booking_guest
-- ----------------------------
DROP TABLE IF EXISTS `booking_guest`;
CREATE TABLE `booking_guest`  (
  `booking_guest_id` int(6) NOT NULL,
  `Booking_Id` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Guest_id` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_guest_id`) USING BTREE,
  INDEX `Booking_Id`(`Booking_Id`) USING BTREE,
  INDEX `Guest_id`(`Guest_id`) USING BTREE,
  CONSTRAINT `booking_guest_ibfk_1` FOREIGN KEY (`Booking_Id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_guest_ibfk_2` FOREIGN KEY (`Guest_id`) REFERENCES `guest` (`Guest_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of booking_guest
-- ----------------------------
INSERT INTO `booking_guest` VALUES (55001, 'B2001', 2399);
INSERT INTO `booking_guest` VALUES (55002, 'B2001', 2400);
INSERT INTO `booking_guest` VALUES (55003, 'B2003', 2300);
INSERT INTO `booking_guest` VALUES (55004, 'B2003', 2301);
INSERT INTO `booking_guest` VALUES (55005, 'B2009', 1101);
INSERT INTO `booking_guest` VALUES (55006, 'B2009', 1102);
INSERT INTO `booking_guest` VALUES (55007, 'B2010', 2111);
INSERT INTO `booking_guest` VALUES (55008, 'B2013', 2111);

-- ----------------------------
-- Table structure for camp
-- ----------------------------
DROP TABLE IF EXISTS `camp`;
CREATE TABLE `camp`  (
  `camp_id` int(5) NOT NULL,
  `camp_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resort_id` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`camp_id`) USING BTREE,
  INDEX `resort_id`(`resort_id`) USING BTREE,
  CONSTRAINT `camp_ibfk_1` FOREIGN KEY (`resort_id`) REFERENCES `resort` (`resort_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of camp
-- ----------------------------
INSERT INTO `camp` VALUES (20001, 'Camping Freedom Bordeaux', 50001);
INSERT INTO `camp` VALUES (20002, 'Riverside Camping', 50001);
INSERT INTO `camp` VALUES (20003, 'Camping Freedom Loire', 50002);
INSERT INTO `camp` VALUES (20004, 'Loche Castle Camping', 50003);

-- ----------------------------
-- Table structure for camp_facility
-- ----------------------------
DROP TABLE IF EXISTS `camp_facility`;
CREATE TABLE `camp_facility`  (
  `camp_id` int(5) NULL DEFAULT NULL,
  `facility_id` int(5) NULL DEFAULT NULL,
  `camp_facility_id` int(6) NOT NULL,
  PRIMARY KEY (`camp_facility_id`) USING BTREE,
  INDEX `camp_id`(`camp_id`) USING BTREE,
  INDEX `facility_id`(`facility_id`) USING BTREE,
  CONSTRAINT `camp_facility_ibfk_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`camp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `camp_facility_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of camp_facility
-- ----------------------------
INSERT INTO `camp_facility` VALUES (20001, 1001, 30001);
INSERT INTO `camp_facility` VALUES (20001, 1002, 30002);
INSERT INTO `camp_facility` VALUES (20001, 1003, 30003);
INSERT INTO `camp_facility` VALUES (20001, 1004, 30004);
INSERT INTO `camp_facility` VALUES (20002, 1001, 30005);
INSERT INTO `camp_facility` VALUES (20002, 1005, 30006);
INSERT INTO `camp_facility` VALUES (20003, 1001, 30007);
INSERT INTO `camp_facility` VALUES (20004, 1001, 30008);
INSERT INTO `camp_facility` VALUES (20004, 1005, 30009);
INSERT INTO `camp_facility` VALUES (20004, 1006, 300010);

-- ----------------------------
-- Table structure for facility
-- ----------------------------
DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility`  (
  `facility_id` int(5) NOT NULL,
  `facility_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`facility_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of facility
-- ----------------------------
INSERT INTO `facility` VALUES (1001, 'Swimming Pool');
INSERT INTO `facility` VALUES (1002, 'Games Room');
INSERT INTO `facility` VALUES (1003, 'Night Club');
INSERT INTO `facility` VALUES (1004, 'Mini-Golf');
INSERT INTO `facility` VALUES (1005, 'Cycle Hire');
INSERT INTO `facility` VALUES (1006, 'Restaurant');

-- ----------------------------
-- Table structure for guest
-- ----------------------------
DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest`  (
  `Guest_Id` int(6) NOT NULL,
  `Guest_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Guest_address` varchar(65) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Guest_contact_no` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Age` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`Guest_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guest
-- ----------------------------
INSERT INTO `guest` VALUES (1101, 'Alison Walters', 'Minsk,Belarus', '912349', 30);
INSERT INTO `guest` VALUES (1102, 'Dennis Brown', 'Sofia,Bulgaria', '912350', 38);
INSERT INTO `guest` VALUES (2111, 'Satpal Singh', 'Nicosia,Cyprus', '912351', 42);
INSERT INTO `guest` VALUES (2300, 'Arnie Johnson', 'Manchester,England', '912347', 27);
INSERT INTO `guest` VALUES (2301, 'Mavis Rickman-Kingdom', 'Liverpool,England', '912348', 35);
INSERT INTO `guest` VALUES (2399, 'Sally Harvey', 'Birmingham,England', '912345', 41);
INSERT INTO `guest` VALUES (2400, 'Robert Harvey', 'Leeds,England', '912346', 25);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_Id` int(5) NOT NULL,
  `item_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_type_id` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`item_Id`) USING BTREE,
  INDEX `item_type_id`(`item_type_id`) USING BTREE,
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`item_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (7001, 'Set of Bed Sheets', 101);
INSERT INTO `item` VALUES (7002, 'Pillows', 101);
INSERT INTO `item` VALUES (7003, 'Coffee Maker', 102);
INSERT INTO `item` VALUES (7004, 'Cutlery Set', 102);
INSERT INTO `item` VALUES (7005, 'Crockery Set', 102);
INSERT INTO `item` VALUES (7006, 'Pan Set', 102);
INSERT INTO `item` VALUES (7007, 'Sun Umbrella', 103);
INSERT INTO `item` VALUES (7008, 'Lounger Set', 103);
INSERT INTO `item` VALUES (7009, 'Microwave Oven', 102);
INSERT INTO `item` VALUES (70010, 'Barbeque Set', 103);

-- ----------------------------
-- Table structure for item_type
-- ----------------------------
DROP TABLE IF EXISTS `item_type`;
CREATE TABLE `item_type`  (
  `item_type_id` int(4) NOT NULL,
  `item_type_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`item_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item_type
-- ----------------------------
INSERT INTO `item_type` VALUES (101, 'Bedding');
INSERT INTO `item_type` VALUES (102, 'Kitchen Equipment');
INSERT INTO `item_type` VALUES (103, 'Outdoor Equipment');

-- ----------------------------
-- Table structure for resort
-- ----------------------------
DROP TABLE IF EXISTS `resort`;
CREATE TABLE `resort`  (
  `resort_id` int(6) NOT NULL,
  `resort_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`resort_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of resort
-- ----------------------------
INSERT INTO `resort` VALUES (50001, 'Bordeaux');
INSERT INTO `resort` VALUES (50002, 'Loire Valley');
INSERT INTO `resort` VALUES (50003, 'Loche');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `staff_id` int(5) NOT NULL,
  `staff_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pay_rate` int(6) NULL DEFAULT NULL,
  `staff_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `position` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (151, 'jon', 2000, 'cleaning', 'junior');
INSERT INTO `staff` VALUES (152, 'kabinson', 3500, 'maintenance', 'junior');
INSERT INTO `staff` VALUES (153, 'jack', 2500, 'cleaning', 'senior');
INSERT INTO `staff` VALUES (154, 'mical', 3000, 'maintenance', 'junior');
INSERT INTO `staff` VALUES (155, 'bill', 4000, 'maintenance', 'senior');

-- ----------------------------
-- Table structure for staff_unit
-- ----------------------------
DROP TABLE IF EXISTS `staff_unit`;
CREATE TABLE `staff_unit`  (
  `staff_unit_id` int(5) NOT NULL,
  `staff_id` int(5) NULL DEFAULT NULL,
  `unit_id` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_unit_id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  CONSTRAINT `staff_unit_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff_unit
-- ----------------------------
INSERT INTO `staff_unit` VALUES (1201, 151, 4500);
INSERT INTO `staff_unit` VALUES (1202, 152, 4500);
INSERT INTO `staff_unit` VALUES (1203, 153, 9934);
INSERT INTO `staff_unit` VALUES (1204, 154, 9934);
INSERT INTO `staff_unit` VALUES (1205, 155, 4500);
INSERT INTO `staff_unit` VALUES (1206, 152, 4500);

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `Unit_Id` int(5) NOT NULL,
  `unit_name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_id` int(5) NULL DEFAULT NULL,
  `unit_type_id` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Unit_Id`) USING BTREE,
  INDEX `camp_id`(`camp_id`) USING BTREE,
  INDEX `unit_type_id`(`unit_type_id`) USING BTREE,
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`camp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`unit_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (2321, 'Glamour', 20003, 6003);
INSERT INTO `unit` VALUES (2500, 'Stanley', 20004, 6004);
INSERT INTO `unit` VALUES (4500, 'Elizabethan', 20001, 6002);
INSERT INTO `unit` VALUES (5670, 'Victoria', 20002, 6002);
INSERT INTO `unit` VALUES (9934, 'Capital', 20001, 6001);

-- ----------------------------
-- Table structure for unit_item
-- ----------------------------
DROP TABLE IF EXISTS `unit_item`;
CREATE TABLE `unit_item`  (
  `Unit_item_Id` int(6) NOT NULL,
  `unit_id` int(5) NULL DEFAULT NULL,
  `Item_ID` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`Unit_item_Id`) USING BTREE,
  INDEX `Item_ID`(`Item_ID`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  CONSTRAINT `unit_item_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `item` (`item_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unit_item_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`Unit_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit_item
-- ----------------------------
INSERT INTO `unit_item` VALUES (2201, 9934, 7001);
INSERT INTO `unit_item` VALUES (2202, 9934, 7002);
INSERT INTO `unit_item` VALUES (2203, 9934, 7003);
INSERT INTO `unit_item` VALUES (2204, 9934, 7004);
INSERT INTO `unit_item` VALUES (2205, 9934, 7005);
INSERT INTO `unit_item` VALUES (2206, 9934, 7006);
INSERT INTO `unit_item` VALUES (2207, 4500, 7001);
INSERT INTO `unit_item` VALUES (2208, 4500, 7002);
INSERT INTO `unit_item` VALUES (2209, 4500, 7003);
INSERT INTO `unit_item` VALUES (2210, 4500, 7004);
INSERT INTO `unit_item` VALUES (2211, 4500, 7005);
INSERT INTO `unit_item` VALUES (2212, 4500, 7006);
INSERT INTO `unit_item` VALUES (2213, 4500, 7007);
INSERT INTO `unit_item` VALUES (2214, 4500, 7008);
INSERT INTO `unit_item` VALUES (2215, 5670, 7001);
INSERT INTO `unit_item` VALUES (2216, 5670, 7002);
INSERT INTO `unit_item` VALUES (2217, 5670, 7009);
INSERT INTO `unit_item` VALUES (2218, 5670, 70010);
INSERT INTO `unit_item` VALUES (2219, 2321, 7002);
INSERT INTO `unit_item` VALUES (2220, 2321, 7001);
INSERT INTO `unit_item` VALUES (2221, 2321, 70010);
INSERT INTO `unit_item` VALUES (2222, 2500, 70010);

-- ----------------------------
-- Table structure for unit_type
-- ----------------------------
DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE `unit_type`  (
  `unit_type_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unit_type_id` int(6) NOT NULL,
  PRIMARY KEY (`unit_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit_type
-- ----------------------------
INSERT INTO `unit_type` VALUES ('Standard Caravan', 6001);
INSERT INTO `unit_type` VALUES ('Deluxe caravan', 6002);
INSERT INTO `unit_type` VALUES ('Small fixed tent', 6003);
INSERT INTO `unit_type` VALUES ('Large fixed tent', 6004);

-- ----------------------------
-- Triggers structure for table guest
-- ----------------------------
DROP TRIGGER IF EXISTS `click_insert_age`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` TRIGGER `click_insert_age` BEFORE INSERT ON `guest` FOR EACH ROW BEGIN
		IF new.Age <18

		THEN
				SIGNAL SQLSTATE '45000'
						SET message_text = 'cannot add row: age< 18';
		END if;
	END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

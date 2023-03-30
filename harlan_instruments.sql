/*
 Navicat Premium Data Transfer

 Source Server         : Newman_Local_Host
 Source Server Type    : MySQL
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : harlan_instruments

 Target Server Type    : MySQL
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 25/08/2021 15:32:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `Customer_Id` int NOT NULL,
  `Customer_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Customer_Number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Customer_Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'John Herring', '+8801234567891', 'john_herring525@gmail.com');
INSERT INTO `customer` VALUES (2, 'Cary Robinson', '+8801874561230', 'cary_robinson23@gmail.com');
INSERT INTO `customer` VALUES (3, 'Willy Wonka', '+8801224466899', 'willywonka233@gmail.com');

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument`  (
  `Instrument_Code` int NOT NULL,
  `Instrument_Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Instrument_Code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instrument
-- ----------------------------
INSERT INTO `instrument` VALUES (1221, 'Gutiar');
INSERT INTO `instrument` VALUES (2112, 'Violin');
INSERT INTO `instrument` VALUES (3223, 'Cello');
INSERT INTO `instrument` VALUES (4334, 'Trumpet');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `Orders_Id` int NOT NULL,
  `Orders_Date` date NULL DEFAULT NULL,
  `Customer_Id` int NULL DEFAULT NULL,
  PRIMARY KEY (`Orders_Id`) USING BTREE,
  INDEX `Customer_Id`(`Customer_Id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (11, '2020-01-01', 3);
INSERT INTO `orders` VALUES (33, '2021-03-03', 1);
INSERT INTO `orders` VALUES (76, '2021-07-03', 2);

-- ----------------------------
-- Table structure for orders_instrument
-- ----------------------------
DROP TABLE IF EXISTS `orders_instrument`;
CREATE TABLE `orders_instrument`  (
  `Orders_Id` int NOT NULL,
  `Instrument_Code` int NOT NULL,
  PRIMARY KEY (`Orders_Id`, `Instrument_Code`) USING BTREE,
  INDEX `Instrument_Code`(`Instrument_Code`) USING BTREE,
  CONSTRAINT `orders_instrument_ibfk_1` FOREIGN KEY (`Orders_Id`) REFERENCES `orders` (`Orders_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_instrument_ibfk_2` FOREIGN KEY (`Instrument_Code`) REFERENCES `instrument` (`Instrument_Code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_instrument
-- ----------------------------
INSERT INTO `orders_instrument` VALUES (11, 3223);
INSERT INTO `orders_instrument` VALUES (11, 4334);
INSERT INTO `orders_instrument` VALUES (33, 1221);
INSERT INTO `orders_instrument` VALUES (33, 2112);
INSERT INTO `orders_instrument` VALUES (76, 3223);

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `Service_Id` int NOT NULL,
  `Service_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Service_Schedule` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Orders_Id` int NULL DEFAULT NULL,
  `Staff_Id` int NULL DEFAULT NULL,
  PRIMARY KEY (`Service_Id`) USING BTREE,
  INDEX `Orders_Id`(`Orders_Id`) USING BTREE,
  INDEX `Staff_Id`(`Staff_Id`) USING BTREE,
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`Orders_Id`) REFERENCES `orders` (`Orders_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (3121, 'Delivery', '1 week', 11, 103);
INSERT INTO `service` VALUES (3434, 'Repair', '2 weeks', 33, 102);
INSERT INTO `service` VALUES (3439, 'Repair', '1 week', 33, 102);
INSERT INTO `service` VALUES (3878, 'Delivery', '2 days', 76, 103);
INSERT INTO `service` VALUES (4343, 'Delivery', '5 days', 33, 101);
INSERT INTO `service` VALUES (6766, 'Repair', '10 days', 11, 101);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `Staff_Id` int NOT NULL,
  `Staff_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Staff_Number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Staff_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (101, 'Ben Roberts', '+88012233445566');
INSERT INTO `staff` VALUES (102, 'Gary Crowley', '+88016655443322');
INSERT INTO `staff` VALUES (103, 'Anita Magneson', '+88019988773311');

SET FOREIGN_KEY_CHECKS = 1;

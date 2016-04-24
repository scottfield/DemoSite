/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 5.7.11 : Database - broadleaf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`broadleaf` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `broadleaf`;

/*Table structure for table `address_shop` */

DROP TABLE IF EXISTS `address_shop`;

CREATE TABLE `address_shop` (
  `address_shop_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  PRIMARY KEY (`address_shop_id`),
  KEY `FK9BA2288126710A69` (`address_id`),
  CONSTRAINT `FK9BA2288126710A69` FOREIGN KEY (`address_id`) REFERENCES `customaddressimpl` (`ADDRESS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `address_shop` */

insert  into `address_shop`(`address_shop_id`,`shop_id`,`address_id`) values (4,1,301),(5,2,302),(6,2,303),(7,2,304),(8,2,305),(9,2,306),(10,3,307),(11,2,308),(12,2,309),(13,4,310),(14,4,311),(15,2,351),(16,3,401),(17,1,402),(18,3,403),(19,4,404),(20,2,451),(21,2,501);

/*Table structure for table `blc_additional_offer_info` */

DROP TABLE IF EXISTS `blc_additional_offer_info`;

CREATE TABLE `blc_additional_offer_info` (
  `BLC_ORDER_ORDER_ID` bigint(20) NOT NULL,
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BLC_ORDER_ORDER_ID`,`OFFER_ID`),
  KEY `FK3BFDBD63B5D9C34D` (`OFFER_INFO_ID`),
  KEY `FK3BFDBD63D5F3FAF4` (`OFFER_ID`),
  KEY `FK3BFDBD631891FF79` (`BLC_ORDER_ORDER_ID`),
  CONSTRAINT `FK3BFDBD631891FF79` FOREIGN KEY (`BLC_ORDER_ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK3BFDBD63B5D9C34D` FOREIGN KEY (`OFFER_INFO_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`),
  CONSTRAINT `FK3BFDBD63D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_additional_offer_info` */

/*Table structure for table `blc_address` */

DROP TABLE IF EXISTS `blc_address`;

CREATE TABLE `blc_address` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_LINE1` varchar(255) NOT NULL,
  `ADDRESS_LINE2` varchar(255) DEFAULT NULL,
  `ADDRESS_LINE3` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `COUNTY` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_BUSINESS` tinyint(1) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) NOT NULL,
  `PRIMARY_PHONE` varchar(255) DEFAULT NULL,
  `SECONDARY_PHONE` varchar(255) DEFAULT NULL,
  `STANDARDIZED` tinyint(1) DEFAULT NULL,
  `TOKENIZED_ADDRESS` varchar(255) DEFAULT NULL,
  `VERIFICATION_LEVEL` varchar(255) DEFAULT NULL,
  `ZIP_FOUR` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `PHONE_FAX_ID` bigint(20) DEFAULT NULL,
  `PHONE_PRIMARY_ID` bigint(20) DEFAULT NULL,
  `PHONE_SECONDARY_ID` bigint(20) DEFAULT NULL,
  `STATE_PROV_REGION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_COUNTRY_INDEX` (`COUNTRY`),
  KEY `ADDRESS_PHONE_FAX_IDX` (`PHONE_FAX_ID`),
  KEY `ADDRESS_PHONE_PRI_IDX` (`PHONE_PRIMARY_ID`),
  KEY `ADDRESS_PHONE_SEC_IDX` (`PHONE_SECONDARY_ID`),
  KEY `ADDRESS_STATE_INDEX` (`STATE_PROV_REGION`),
  KEY `FK299F86CEA46E16CF` (`COUNTRY`),
  KEY `FK299F86CEF1A6533F` (`PHONE_FAX_ID`),
  KEY `FK299F86CEBF4449BA` (`PHONE_PRIMARY_ID`),
  KEY `FK299F86CEE12DC0C8` (`PHONE_SECONDARY_ID`),
  KEY `FK299F86CE337C4D50` (`STATE_PROV_REGION`),
  CONSTRAINT `FK299F86CE337C4D50` FOREIGN KEY (`STATE_PROV_REGION`) REFERENCES `blc_state` (`ABBREVIATION`),
  CONSTRAINT `FK299F86CEA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`),
  CONSTRAINT `FK299F86CEBF4449BA` FOREIGN KEY (`PHONE_PRIMARY_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  CONSTRAINT `FK299F86CEE12DC0C8` FOREIGN KEY (`PHONE_SECONDARY_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  CONSTRAINT `FK299F86CEF1A6533F` FOREIGN KEY (`PHONE_FAX_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_address` */

insert  into `blc_address`(`ADDRESS_ID`,`ADDRESS_LINE1`,`ADDRESS_LINE2`,`ADDRESS_LINE3`,`CITY`,`COMPANY_NAME`,`COUNTY`,`EMAIL_ADDRESS`,`FAX`,`FIRST_NAME`,`IS_ACTIVE`,`IS_BUSINESS`,`IS_DEFAULT`,`LAST_NAME`,`POSTAL_CODE`,`PRIMARY_PHONE`,`SECONDARY_PHONE`,`STANDARDIZED`,`TOKENIZED_ADDRESS`,`VERIFICATION_LEVEL`,`ZIP_FOUR`,`COUNTRY`,`PHONE_FAX_ID`,`PHONE_PRIMARY_ID`,`PHONE_SECONDARY_ID`,`STATE_PROV_REGION`) values (1,'fda','fad',NULL,'daf',NULL,NULL,NULL,NULL,'d',1,0,0,'fda','dffad',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,1,NULL,'AK'),(2,'fda','fad',NULL,'daf',NULL,NULL,NULL,NULL,'d',1,0,0,'fda','dffad',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,2,NULL,'AK'),(51,'fda','fda',NULL,'dfa',NULL,NULL,NULL,NULL,'fda',1,0,0,'fad','dfa',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,51,NULL,'DE'),(52,'fda','fda',NULL,'fad',NULL,NULL,NULL,NULL,'fda',1,0,0,'fdda','daf',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,52,NULL,'DE'),(101,'fda','fda',NULL,'dfa',NULL,NULL,NULL,NULL,'dfa',1,0,0,'fda','dfa',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,101,NULL,'AL'),(102,'fda','fda',NULL,'dfa',NULL,NULL,NULL,NULL,'dfa',1,0,0,'fda','dfa',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,102,NULL,'AL'),(151,'成都','青羊区工业园区2',NULL,'chengdu',NULL,NULL,NULL,NULL,'成龙',1,0,1,'王','63000000',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,151,NULL,'PR'),(152,'成都','青羊区工业园区2',NULL,'chengdu',NULL,NULL,NULL,NULL,'成龙',1,0,0,'王','63000000',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,152,NULL,'PR'),(153,'dfa','fda',NULL,'fda',NULL,NULL,NULL,NULL,'daf',1,0,0,'daf','df',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,153,NULL,'DE'),(154,'dfa','fda',NULL,'dfa',NULL,NULL,NULL,NULL,'fda',1,0,0,'dfa','dfs',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,154,NULL,'DE'),(155,'dfa','fda',NULL,'dfa',NULL,NULL,NULL,NULL,'fda',1,0,0,'dfa','dfs',NULL,NULL,0,NULL,NULL,NULL,'US',NULL,155,NULL,'DE'),(252,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'jackie',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,252,NULL,NULL),(301,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dafda',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,301,NULL,NULL),(302,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'jackie',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,302,NULL,NULL),(303,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'scott',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,303,NULL,NULL),(304,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'scott',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,304,NULL,NULL),(305,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'jackie11',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,305,NULL,NULL),(306,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'放大放大',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,306,NULL,NULL),(307,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'王成龙',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,307,NULL,NULL),(308,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'放大放大',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,308,NULL,NULL),(309,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'放大放大',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,309,NULL,NULL),(310,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'发',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,310,NULL,NULL),(311,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'发',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,311,NULL,NULL),(351,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dfad',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,351,NULL,NULL),(401,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'jackie',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,401,NULL,NULL),(402,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'ckkk',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,402,NULL,NULL),(403,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'aaaa',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,403,NULL,NULL),(404,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'jackie',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,404,NULL,NULL),(451,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'王成龙',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,451,NULL,NULL),(501,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `blc_admin_module` */

DROP TABLE IF EXISTS `blc_admin_module`;

CREATE TABLE `blc_admin_module` (
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `MODULE_KEY` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_MODULE_ID`),
  KEY `ADMINMODULE_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_module` */

insert  into `blc_admin_module`(`ADMIN_MODULE_ID`,`DISPLAY_ORDER`,`ICON`,`MODULE_KEY`,`NAME`) values (-7,500,'icon-refresh','BLCWorkflow','Site Updates'),(-6,400,'icon-picture','BLCDesign','Design'),(-5,700,'icon-gear','BLCModuleConfiguration','Settings'),(-4,600,'icon-user','BLCOpenAdmin','Security'),(-3,300,'icon-heart','BLCCustomerCare','Customer Care'),(-2,200,'icon-file','BLCContentManagement','Content'),(-1,100,'icon-barcode','BLCMerchandising','Catalog');

/*Table structure for table `blc_admin_password_token` */

DROP TABLE IF EXISTS `blc_admin_password_token`;

CREATE TABLE `blc_admin_password_token` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_password_token` */

/*Table structure for table `blc_admin_permission` */

DROP TABLE IF EXISTS `blc_admin_permission`;

CREATE TABLE `blc_admin_permission` (
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `IS_FRIENDLY` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `PERMISSION_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_permission` */

insert  into `blc_admin_permission`(`ADMIN_PERMISSION_ID`,`DESCRIPTION`,`IS_FRIENDLY`,`NAME`,`PERMISSION_TYPE`) values (-201,'Read Structured Content Template',0,'PERMISSION_READ_STRUCTURED_CONTENT_TEMPLATE','READ'),(-200,'Read Page Template',0,'PERMISSION_READ_PAGE_TEMPLATE','READ'),(-151,'Maintain Permissions',1,'PERMISSION_PERM_ALL','ALL'),(-150,'View Permissions',1,'PERMISSION_PERM_VIEW','READ'),(-141,'Maintain Roles',1,'PERMISSION_ROLE_ALL','ALL'),(-140,'View Roles',1,'PERMISSION_ROLE_VIEW','READ'),(-131,'Maintain Translations',1,'PERMISSION_TRANSLATION','ALL'),(-130,'View Translations',1,'PERMISSION_TRANSLATION','READ'),(-127,'Maintain Module Configurations',1,'PERMISSION_MODULECONFIGURATION','ALL'),(-126,'View Module Configurations',1,'PERMISSION_MODULECONFIGURATION','READ'),(-123,'Maintain System Properties',1,'PERMISSION_SYSTEMPROPERTY','ALL'),(-122,'View System Properties',1,'PERMISSION_SYSTEMPROPERTY','READ'),(-121,'Maintain Users',1,'PERMISSION_USER','ALL'),(-120,'View Users',1,'PERMISSION_USER','READ'),(-119,'Maintain Customers',1,'PERMISSION_CUSTOMER','ALL'),(-118,'View Customers',1,'PERMISSION_CUSTOMER','READ'),(-117,'Maintain Orders',1,'PERMISSION_ORDER','ALL'),(-116,'View Orders',1,'PERMISSION_ORDER','READ'),(-115,'Maintain URL Redirects',1,'PERMISSION_URLREDIRECT','ALL'),(-114,'View URL Redirects',1,'PERMISSION_URLREDIRECT','READ'),(-113,'Maintain Structured Contents',1,'PERMISSION_STRUCTUREDCONTENT','ALL'),(-112,'View Structured Contents',1,'PERMISSION_STRUCTUREDCONTENT','READ'),(-111,'Maintain Assets',1,'PERMISSION_ASSET','ALL'),(-110,'View Assets',1,'PERMISSION_ASSET','READ'),(-109,'Maintain Pages',1,'PERMISSION_PAGE','ALL'),(-108,'View Pages',1,'PERMISSION_PAGE','READ'),(-107,'Maintain Offers',1,'PERMISSION_OFFER','ALL'),(-106,'View Offers',1,'PERMISSION_OFFER','READ'),(-105,'Maintain Product Options',1,'PERMISSION_PRODUCTOPTIONS','ALL'),(-104,'View Product Options',1,'PERMISSION_PRODUCTOPTIONS','READ'),(-103,'Maintain Products',1,'PERMISSION_PRODUCT','ALL'),(-102,'View Products',1,'PERMISSION_PRODUCT','READ'),(-101,'Maintain Categories',1,'PERMISSION_CATEGORY','ALL'),(-100,'View Categories',1,'PERMISSION_CATEGORY','READ'),(-51,'All Catalog Permissions',0,'PERMISSION_ALL_CATALOG_PERMS','ALL'),(-50,'Read Catalog Permissions',0,'PERMISSION_READ_CATALOG_PERMS','READ'),(-49,'All Admin Permissions',0,'PERMISSION_ALL_ADMIN_PERMS','ALL'),(-48,'Read Admin Permissions',0,'PERMISSION_READ_ADMIN_PERMS','READ'),(-47,'All Admin Roles',0,'PERMISSION_ALL_ADMIN_ROLES','ALL'),(-46,'Read Admin Roles',0,'PERMISSION_READ_ADMIN_ROLES','READ'),(-45,'All System Property',0,'PERMISSION_ALL_SYSTEM_PROPERTY','ALL'),(-44,'Read System Property',0,'PERMISSION_READ_SYSTEM_PROPERTY','READ'),(-43,'All Site Map Gen Configuration',0,'PERMISSION_ALL_SITE_MAP_GEN_CONFIG','ALL'),(-42,'Read Site Map Gen Configuration',0,'PERMISSION_READ_SITE_MAP_GEN_CONFIG','READ'),(-41,'All Translation',0,'PERMISSION_ALL_TRANSLATION','ALL'),(-40,'Read Translation',0,'PERMISSION_READ_TRANSLATION','READ'),(-39,'All Enumeration',0,'PERMISSION_ALL_ENUMERATION','ALL'),(-38,'Read Enumeration',0,'PERMISSION_READ_ENUMERATION','READ'),(-37,'All Configuration',0,'PERMISSION_ALL_MODULECONFIGURATION','ALL'),(-36,'Read Configuration',0,'PERMISSION_READ_MODULECONFIGURATION','READ'),(-35,'All Currency',0,'PERMISSION_ALL_CURRENCY','ALL'),(-34,'Read Currency',0,'PERMISSION_READ_CURRENCY','READ'),(-33,'All SearchFacet',0,'PERMISSION_ALL_SEARCHFACET','ALL'),(-32,'Read SearchFacet',0,'PERMISSION_READ_SEARCHFACET','READ'),(-31,'All SearchRedirect',0,'PERMISSION_ALL_SEARCHREDIRECT','ALL'),(-30,'Read SearchRedirect',0,'PERMISSION_READ_SEARCHREDIRECT','READ'),(-29,'All URLHandler',0,'PERMISSION_ALL_URLHANDLER','ALL'),(-28,'Read URLHandler',0,'PERMISSION_READ_URLHANDLER','READ'),(-27,'All Admin User',0,'PERMISSION_ALL_ADMIN_USER','ALL'),(-26,'Read Admin User',0,'PERMISSION_READ_ADMIN_USER','READ'),(-25,'All Structured Content',0,'PERMISSION_ALL_STRUCTURED_CONTENT','ALL'),(-24,'Read Structured Content',0,'PERMISSION_READ_STRUCTURED_CONTENT','READ'),(-23,'All Asset',0,'PERMISSION_ALL_ASSET','ALL'),(-22,'Read Asset',0,'PERMISSION_READ_ASSET','READ'),(-21,'All Page',0,'PERMISSION_ALL_PAGE','ALL'),(-20,'Read Page',0,'PERMISSION_READ_PAGE','READ'),(-19,'All Customer',0,'PERMISSION_ALL_CUSTOMER','ALL'),(-18,'Read Customer',0,'PERMISSION_READ_CUSTOMER','READ'),(-17,'All Order Item',0,'PERMISSION_ALL_ORDER_ITEM','ALL'),(-16,'Read Order Item',0,'PERMISSION_READ_ORDER_ITEM','READ'),(-15,'All Fulfillment Group',0,'PERMISSION_ALL_FULFILLMENT_GROUP','ALL'),(-14,'Read Fulfillment Group',0,'PERMISSION_READ_FULFILLMENT_GROUP','READ'),(-13,'All Order',0,'PERMISSION_ALL_ORDER','ALL'),(-12,'Read Order',0,'PERMISSION_READ_ORDER','READ'),(-11,'All Promotion',0,'PERMISSION_ALL_PROMOTION','ALL'),(-10,'Read Promotion',0,'PERMISSION_READ_PROMOTION','READ'),(-9,'All Sku',0,'PERMISSION_ALL_SKU','ALL'),(-8,'Read Sku',0,'PERMISSION_READ_SKU','READ'),(-7,'All Product Option',0,'PERMISSION_ALL_PRODUCT_OPTION','ALL'),(-6,'Read Product Option',0,'PERMISSION_READ_PRODUCT_OPTION','READ'),(-5,'All Product',0,'PERMISSION_ALL_PRODUCT','ALL'),(-4,'Read Product',0,'PERMISSION_READ_PRODUCT','READ'),(-3,'All Category',0,'PERMISSION_ALL_CATEGORY','ALL'),(-2,'Read Category',0,'PERMISSION_READ_CATEGORY','READ'),(-1,'Default Permission',0,'PERMISSION_OTHER_DEFAULT','OTHER');

/*Table structure for table `blc_admin_permission_entity` */

DROP TABLE IF EXISTS `blc_admin_permission_entity`;

CREATE TABLE `blc_admin_permission_entity` (
  `ADMIN_PERMISSION_ENTITY_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ENTITY_ID`),
  KEY `FK23C09E3DE88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK23C09E3DE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_permission_entity` */

insert  into `blc_admin_permission_entity`(`ADMIN_PERMISSION_ENTITY_ID`,`CEILING_ENTITY`,`ADMIN_PERMISSION_ID`) values (-987,'org.broadleafcommerce.common.site.domain.Site',-51),(-986,'org.broadleafcommerce.common.site.domain.Site',-50),(-985,'org.broadleafcommerce.common.site.domain.Catalog',-51),(-984,'org.broadleafcommerce.common.site.domain.Catalog',-50),(-983,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermissionQualifiedEntity',-48),(-982,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermissionQualifiedEntity',-49),(-981,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-48),(-980,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-48),(-971,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-47),(-970,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-46),(-961,'org.broadleafcommerce.common.config.domain.SystemProperty',-45),(-960,'org.broadleafcommerce.common.config.domain.SystemProperty',-44),(-953,'org.broadleafcommerce.common.sitemap.domain.SiteMapURLEntry',-43),(-952,'org.broadleafcommerce.common.sitemap.domain.SiteMapURLEntry',-42),(-951,'org.broadleafcommerce.common.sitemap.domain.SiteMapGeneratorConfiguration',-43),(-950,'org.broadleafcommerce.common.sitemap.domain.SiteMapGeneratorConfiguration',-42),(-911,'org.broadleafcommerce.common.i18n.domain.Translation',-41),(-910,'org.broadleafcommerce.common.i18n.domain.Translation',-40),(-903,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumerationValue',-39),(-902,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumerationValue',-38),(-901,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumeration',-39),(-900,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumeration',-38),(-881,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-37),(-880,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-36),(-851,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-35),(-850,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-34),(-809,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-33),(-808,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-32),(-807,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-33),(-806,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-32),(-805,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-33),(-804,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-32),(-803,'org.broadleafcommerce.core.search.domain.Field',-33),(-802,'org.broadleafcommerce.core.search.domain.Field',-32),(-801,'org.broadleafcommerce.core.search.domain.SearchFacet',-33),(-800,'org.broadleafcommerce.core.search.domain.SearchFacet',-32),(-781,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-31),(-780,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-30),(-753,'org.broadleafcommerce.common.locale.domain.Locale',-29),(-752,'org.broadleafcommerce.common.locale.domain.Locale',-28),(-751,'org.broadleafcommerce.cms.url.domain.URLHandler',-29),(-750,'org.broadleafcommerce.cms.url.domain.URLHandler',-28),(-721,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-27),(-720,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-26),(-659,'org.broadleafcommerce.common.locale.domain.Locale',-25),(-658,'org.broadleafcommerce.common.locale.domain.Locale',-24),(-657,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',-201),(-655,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-25),(-654,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-24),(-653,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',-201),(-651,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-25),(-650,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-24),(-603,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-23),(-602,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-22),(-601,'org.broadleafcommerce.cms.file.domain.StaticAsset',-23),(-600,'org.broadleafcommerce.cms.file.domain.StaticAsset',-22),(-557,'org.broadleafcommerce.common.locale.domain.Locale',-21),(-556,'org.broadleafcommerce.common.locale.domain.Locale',-20),(-555,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-21),(-554,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-20),(-552,'org.broadleafcommerce.cms.page.domain.PageTemplate',-200),(-551,'org.broadleafcommerce.cms.page.domain.Page',-21),(-550,'org.broadleafcommerce.cms.page.domain.Page',-20),(-514,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-19),(-513,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-18),(-512,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-19),(-511,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-18),(-510,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-19),(-509,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-18),(-508,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-19),(-507,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-18),(-506,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-19),(-504,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-18),(-503,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-19),(-502,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-18),(-501,'org.broadleafcommerce.profile.core.domain.Customer',-19),(-500,'org.broadleafcommerce.profile.core.domain.Customer',-18),(-461,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-17),(-460,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-16),(-459,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-17),(-458,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-16),(-457,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-17),(-456,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-16),(-455,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-17),(-454,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-16),(-453,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-17),(-452,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-16),(-451,'org.broadleafcommerce.core.order.domain.OrderItem',-17),(-450,'org.broadleafcommerce.core.order.domain.OrderItem',-16),(-407,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-15),(-406,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-14),(-405,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-15),(-404,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-14),(-403,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-15),(-402,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-14),(-401,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-15),(-400,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-14),(-370,'org.broadleafcommerce.core.payment.domain.PaymentTransactionImpl',-13),(-369,'org.broadleafcommerce.core.payment.domain.PaymentTransactionImpl',-12),(-368,'org.broadleafcommerce.profile.core.domain.State',-13),(-367,'org.broadleafcommerce.profile.core.domain.State',-12),(-366,'org.broadleafcommerce.profile.core.domain.Country',-13),(-365,'org.broadleafcommerce.profile.core.domain.Country',-12),(-361,'org.broadleafcommerce.core.payment.domain.OrderPayment',-13),(-360,'org.broadleafcommerce.core.payment.domain.OrderPayment',-12),(-356,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-13),(-355,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-12),(-351,'org.broadleafcommerce.core.order.domain.Order',-13),(-350,'org.broadleafcommerce.core.order.domain.Order',-12),(-307,'org.broadleafcommerce.core.offer.domain.OfferTier',-11),(-306,'org.broadleafcommerce.core.offer.domain.OfferTier',-10),(-305,'org.broadleafcommerce.core.offer.domain.OfferCode',-11),(-304,'org.broadleafcommerce.core.offer.domain.OfferCode',-10),(-303,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-11),(-302,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-10),(-301,'org.broadleafcommerce.core.offer.domain.Offer',-11),(-300,'org.broadleafcommerce.core.offer.domain.Offer',-10),(-251,'org.broadleafcommerce.core.catalog.domain.Sku',-9),(-250,'org.broadleafcommerce.core.catalog.domain.Sku',-8),(-205,'org.broadleafcommerce.core.catalog.domain.ProductOptionXref',-7),(-204,'org.broadleafcommerce.core.catalog.domain.ProductOptionXref',-6),(-203,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-7),(-202,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-6),(-201,'org.broadleafcommerce.core.catalog.domain.ProductOption',-7),(-200,'org.broadleafcommerce.core.catalog.domain.ProductOption',-6),(-107,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-5),(-106,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-4),(-105,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-5),(-104,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-4),(-103,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-5),(-102,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-4),(-101,'org.broadleafcommerce.core.catalog.domain.Product',-5),(-100,'org.broadleafcommerce.core.catalog.domain.Product',-4),(-14,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-3),(-13,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-2),(-12,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-3),(-11,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-2),(-10,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-3),(-9,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-2),(-8,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-3),(-7,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-2),(-6,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-3),(-5,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-2),(-4,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-3),(-3,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-2),(-2,'org.broadleafcommerce.core.catalog.domain.Category',-3),(-1,'org.broadleafcommerce.core.catalog.domain.Category',-2);

/*Table structure for table `blc_admin_permission_xref` */

DROP TABLE IF EXISTS `blc_admin_permission_xref`;

CREATE TABLE `blc_admin_permission_xref` (
  `CHILD_PERMISSION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FKBCAD1F5E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FKBCAD1F575A3C445` (`CHILD_PERMISSION_ID`),
  CONSTRAINT `FKBCAD1F575A3C445` FOREIGN KEY (`CHILD_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FKBCAD1F5E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_permission_xref` */

insert  into `blc_admin_permission_xref`(`CHILD_PERMISSION_ID`,`ADMIN_PERMISSION_ID`) values (-2,-100),(-4,-100),(-32,-100),(-51,-100),(-3,-101),(-4,-101),(-32,-101),(-51,-101),(-4,-102),(-6,-102),(-8,-102),(-34,-102),(-51,-101),(-5,-103),(-6,-103),(-9,-103),(-34,-103),(-51,-103),(-6,-104),(-32,-104),(-51,-104),(-7,-105),(-32,-105),(-51,-105),(-10,-106),(-51,-106),(-11,-107),(-51,-106),(-20,-108),(-200,-108),(-21,-109),(-200,-109),(-22,-110),(-23,-111),(-24,-112),(-201,-112),(-25,-113),(-201,-113),(-28,-114),(-29,-115),(-12,-116),(-16,-116),(-14,-116),(-10,-116),(-13,-117),(-16,-117),(-14,-117),(-10,-117),(-18,-118),(-19,-119),(-26,-120),(-46,-120),(-48,-120),(-27,-121),(-46,-120),(-48,-120),(-44,-122),(-45,-123),(-36,-126),(-37,-127),(-40,-130),(-41,-131),(-46,-140),(-48,-140),(-47,-141),(-48,-141),(-48,-150),(-49,-151);

/*Table structure for table `blc_admin_role` */

DROP TABLE IF EXISTS `blc_admin_role`;

CREATE TABLE `blc_admin_role` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_role` */

insert  into `blc_admin_role`(`ADMIN_ROLE_ID`,`DESCRIPTION`,`NAME`) values (-6,'CMS Approver','ROLE_CONTENT_APPROVER'),(-5,'CMS Editor','ROLE_CONTENT_EDITOR'),(-4,'CSR','ROLE_CUSTOMER_SERVICE_REP'),(-3,'Promotion Manager','ROLE_PROMOTION_MANAGER'),(-2,'Merchandiser','ROLE_MERCHANDISE_MANAGER'),(-1,'Admin Master Access','ROLE_ADMIN'),(1,'测试角色','测试');

/*Table structure for table `blc_admin_role_permission_xref` */

DROP TABLE IF EXISTS `blc_admin_role_permission_xref`;

CREATE TABLE `blc_admin_role_permission_xref` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_ROLE_ID`),
  KEY `FK4A819D98E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK4A819D985F43AAD8` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FK4A819D985F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FK4A819D98E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_role_permission_xref` */

insert  into `blc_admin_role_permission_xref`(`ADMIN_ROLE_ID`,`ADMIN_PERMISSION_ID`) values (-1,-141),(-5,-131),(-3,-131),(-2,-131),(-1,-131),(-1,-127),(-1,-123),(-1,-121),(-4,-119),(-1,-119),(-4,-117),(-1,-117),(1,-116),(-1,-115),(-5,-113),(-1,-113),(-6,-111),(-5,-111),(-2,-111),(-1,-111),(-6,-109),(-5,-109),(-1,-109),(-3,-107),(-1,-107),(-2,-105),(-1,-105),(-2,-103),(-1,-103),(-2,-101),(-1,-101);

/*Table structure for table `blc_admin_sec_perm_xref` */

DROP TABLE IF EXISTS `blc_admin_sec_perm_xref`;

CREATE TABLE `blc_admin_sec_perm_xref` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK5E832966E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK5E8329663AF7F0FC` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK5E8329663AF7F0FC` FOREIGN KEY (`ADMIN_SECTION_ID`) REFERENCES `blc_admin_section` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK5E832966E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_sec_perm_xref` */

insert  into `blc_admin_sec_perm_xref`(`ADMIN_SECTION_ID`,`ADMIN_PERMISSION_ID`) values (-1,-100),(-1,-101),(-2,-102),(-2,-103),(-3,-104),(-3,-105),(-4,-106),(-4,-107),(-5,-108),(-5,-109),(-6,-110),(-6,-111),(-7,-112),(-7,-113),(-8,-114),(-8,-115),(-9,-116),(-9,-117),(-10,-118),(-10,-119),(-11,-120),(-11,-121),(-12,-140),(-12,-141),(-13,-126),(-13,-127),(-15,-122),(-15,-123),(-16,-122),(-16,-123),(-17,-150),(-17,-151);

/*Table structure for table `blc_admin_section` */

DROP TABLE IF EXISTS `blc_admin_section`;

CREATE TABLE `blc_admin_section` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) DEFAULT NULL,
  `DISPLAY_CONTROLLER` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SECTION_KEY` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `USE_DEFAULT_HANDLER` tinyint(1) DEFAULT NULL,
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_SECTION_ID`),
  UNIQUE KEY `uc_BLC_ADMIN_SECTION_1` (`SECTION_KEY`),
  KEY `ADMINSECTION_MODULE_INDEX` (`ADMIN_MODULE_ID`),
  KEY `ADMINSECTION_NAME_INDEX` (`NAME`),
  KEY `FK7EA7D92FB1A18498` (`ADMIN_MODULE_ID`),
  CONSTRAINT `FK7EA7D92FB1A18498` FOREIGN KEY (`ADMIN_MODULE_ID`) REFERENCES `blc_admin_module` (`ADMIN_MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_section` */

insert  into `blc_admin_section`(`ADMIN_SECTION_ID`,`CEILING_ENTITY`,`DISPLAY_CONTROLLER`,`DISPLAY_ORDER`,`NAME`,`SECTION_KEY`,`URL`,`USE_DEFAULT_HANDLER`,`ADMIN_MODULE_ID`) values (-17,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',NULL,3000,'Permission Management','PermissionManagement','/permission-management',NULL,-4),(-16,'org.broadleafcommerce.common.config.domain.SystemProperty',NULL,2000,'System Properties','SystemProperties','/system-properties',NULL,-5),(-15,'org.broadleafcommerce.common.config.domain.SystemProperty',NULL,3000,'System Property Management','SystemPropertyManagement','/system-properties-management',NULL,-5),(-13,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',NULL,1000,'Configuration Management','ConfigurationManagement','/configuration-management',NULL,-5),(-12,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',NULL,2000,'Role Management','RoleManagement','/role-management',NULL,-4),(-11,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',NULL,1000,'User Management','UserManagement','/user-management',NULL,-4),(-10,'org.broadleafcommerce.profile.core.domain.Customer',NULL,1000,'Customer','Customer','/customer',NULL,-3),(-9,'org.broadleafcommerce.core.order.domain.Order',NULL,2000,'Order','Order','/order',NULL,-3),(-8,'org.broadleafcommerce.cms.url.domain.URLHandler',NULL,4000,'Redirect URL','RedirectURL','/redirect-url',NULL,-2),(-7,'org.broadleafcommerce.cms.structure.domain.StructuredContent',NULL,2000,'Structured Content','StructuredContent','/structured-content',NULL,-2),(-6,'org.broadleafcommerce.cms.file.domain.StaticAsset',NULL,3000,'Assets','Assets','/assets',NULL,-2),(-5,'org.broadleafcommerce.cms.page.domain.Page',NULL,1000,'Pages','Pages','/pages',NULL,-2),(-4,'org.broadleafcommerce.core.offer.domain.Offer',NULL,4000,'Offer','Offer','/offer',NULL,-1),(-3,'org.broadleafcommerce.core.catalog.domain.ProductOption',NULL,3000,'Product Options','ProductOptions','/product-options',NULL,-1),(-2,'org.broadleafcommerce.core.catalog.domain.Product',NULL,2000,'Product','Product','/product',NULL,-1),(-1,'org.broadleafcommerce.core.catalog.domain.Category',NULL,1000,'Category','Category','/category',NULL,-1);

/*Table structure for table `blc_admin_user` */

DROP TABLE IF EXISTS `blc_admin_user`;

CREATE TABLE `blc_admin_user` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ACTIVE_STATUS_FLAG` tinyint(1) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `ADMINPERM_EMAIL_INDEX` (`EMAIL`),
  KEY `ADMINUSER_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_user` */

insert  into `blc_admin_user`(`ADMIN_USER_ID`,`ACTIVE_STATUS_FLAG`,`EMAIL`,`LOGIN`,`NAME`,`PASSWORD`,`PHONE_NUMBER`) values (-6,1,'cms_approver@yourdomain.com','cmsApprover','CMS Approver','admin{-6}',NULL),(-5,1,'cms_edit@yourdomain.com','cmsEditor','CMS Editor','admin{-5}',NULL),(-4,1,'csr@yourdomain.com','csr','CSR','admin{-4}',NULL),(-3,1,'promo@yourdomain.com','promo','Promotion Manager','admin{-3}',NULL),(-2,1,'merchandise@yourdomain.com','merchandise','Merchandise Manager','admin{-2}',NULL),(-1,1,'admin@yourdomain.com','admin','管理员','admin{-1}',NULL);

/*Table structure for table `blc_admin_user_addtl_fields` */

DROP TABLE IF EXISTS `blc_admin_user_addtl_fields`;

CREATE TABLE `blc_admin_user_addtl_fields` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`,`FIELD_NAME`),
  KEY `FK73274CDD46EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FK73274CDD46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_user_addtl_fields` */

/*Table structure for table `blc_admin_user_permission_xref` */

DROP TABLE IF EXISTS `blc_admin_user_permission_xref`;

CREATE TABLE `blc_admin_user_permission_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_USER_ID`),
  KEY `FKF0B3BEEDE88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FKF0B3BEED46EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF0B3BEED46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF0B3BEEDE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_user_permission_xref` */

/*Table structure for table `blc_admin_user_role_xref` */

DROP TABLE IF EXISTS `blc_admin_user_role_xref`;

CREATE TABLE `blc_admin_user_role_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`,`ADMIN_USER_ID`),
  KEY `FKFFD33A265F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FKFFD33A2646EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A2646EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A265F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_user_role_xref` */

insert  into `blc_admin_user_role_xref`(`ADMIN_USER_ID`,`ADMIN_ROLE_ID`) values (-6,-6),(-5,-5),(-4,-4),(-3,-3),(-2,-2),(-1,-1);

/*Table structure for table `blc_admin_user_sandbox` */

DROP TABLE IF EXISTS `blc_admin_user_sandbox`;

CREATE TABLE `blc_admin_user_sandbox` (
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `FKD0A97E09579FE59D` (`SANDBOX_ID`),
  KEY `FKD0A97E0946EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKD0A97E0946EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKD0A97E09579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_admin_user_sandbox` */

/*Table structure for table `blc_asset_desc_map` */

DROP TABLE IF EXISTS `blc_asset_desc_map`;

CREATE TABLE `blc_asset_desc_map` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`,`MAP_KEY`),
  KEY `FKE886BAE3E2BA0C9D` (`STATIC_ASSET_DESC_ID`),
  KEY `FKE886BAE367F70B63` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKE886BAE367F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKE886BAE3E2BA0C9D` FOREIGN KEY (`STATIC_ASSET_DESC_ID`) REFERENCES `blc_static_asset_desc` (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_asset_desc_map` */

/*Table structure for table `blc_bank_account_payment` */

DROP TABLE IF EXISTS `blc_bank_account_payment`;

CREATE TABLE `blc_bank_account_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `ACCOUNT_NUMBER` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  `ROUTING_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `BANKACCOUNT_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_bank_account_payment` */

/*Table structure for table `blc_bund_item_fee_price` */

DROP TABLE IF EXISTS `blc_bund_item_fee_price`;

CREATE TABLE `blc_bund_item_fee_price` (
  `BUND_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `IS_TAXABLE` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `BUND_ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUND_ITEM_FEE_PRICE_ID`),
  KEY `FK14267A943FC68307` (`BUND_ORDER_ITEM_ID`),
  CONSTRAINT `FK14267A943FC68307` FOREIGN KEY (`BUND_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_bund_item_fee_price` */

/*Table structure for table `blc_bundle_order_item` */

DROP TABLE IF EXISTS `blc_bundle_order_item`;

CREATE TABLE `blc_bundle_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK489703DBCCF29B96` (`PRODUCT_BUNDLE_ID`),
  KEY `FK489703DBB78C9977` (`SKU_ID`),
  KEY `FK489703DB9AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK489703DB9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK489703DBB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FK489703DBCCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_bundle_order_item` */

/*Table structure for table `blc_candidate_fg_offer` */

DROP TABLE IF EXISTS `blc_candidate_fg_offer`;

CREATE TABLE `blc_candidate_fg_offer` (
  `CANDIDATE_FG_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CANDIDATE_FG_OFFER_ID`),
  KEY `CANDIDATE_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `CANDIDATE_FGOFFER_INDEX` (`OFFER_ID`),
  KEY `FKCE785605028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FKCE78560D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FKCE785605028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKCE78560D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_candidate_fg_offer` */

/*Table structure for table `blc_candidate_item_offer` */

DROP TABLE IF EXISTS `blc_candidate_item_offer`;

CREATE TABLE `blc_candidate_item_offer` (
  `CANDIDATE_ITEM_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ITEM_OFFER_ID`),
  KEY `CANDIDATE_ITEMOFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B2D5F3FAF4` (`OFFER_ID`),
  KEY `FK9EEE9B29AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9EEE9B29AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9EEE9B2D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_candidate_item_offer` */

/*Table structure for table `blc_candidate_order_offer` */

DROP TABLE IF EXISTS `blc_candidate_order_offer`;

CREATE TABLE `blc_candidate_order_offer` (
  `CANDIDATE_ORDER_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ORDER_OFFER_ID`),
  KEY `CANDIDATE_ORDEROFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK61852289D5F3FAF4` (`OFFER_ID`),
  KEY `FK6185228989FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK6185228989FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK61852289D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_candidate_order_offer` */

/*Table structure for table `blc_cat_search_facet_excl_xref` */

DROP TABLE IF EXISTS `blc_cat_search_facet_excl_xref`;

CREATE TABLE `blc_cat_search_facet_excl_xref` (
  `CAT_EXCL_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_EXCL_SEARCH_FACET_ID`),
  KEY `FK8361EF4E15D1A13D` (`CATEGORY_ID`),
  KEY `FK8361EF4EB96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK8361EF4E15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK8361EF4EB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_cat_search_facet_excl_xref` */

/*Table structure for table `blc_cat_search_facet_xref` */

DROP TABLE IF EXISTS `blc_cat_search_facet_xref`;

CREATE TABLE `blc_cat_search_facet_xref` (
  `CATEGORY_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEARCH_FACET_ID`),
  KEY `FK32210EEB15D1A13D` (`CATEGORY_ID`),
  KEY `FK32210EEBB96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK32210EEB15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK32210EEBB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_cat_search_facet_xref` */

insert  into `blc_cat_search_facet_xref`(`CATEGORY_SEARCH_FACET_ID`,`SEQUENCE`,`CATEGORY_ID`,`SEARCH_FACET_ID`) values (1,'1.00',2002,1),(2,'2.00',2002,2),(3,'3.00',1,3),(4,'1.00',2003,4),(950,'4.00',1,4);

/*Table structure for table `blc_cat_site_map_gen_cfg` */

DROP TABLE IF EXISTS `blc_cat_site_map_gen_cfg`;

CREATE TABLE `blc_cat_site_map_gen_cfg` (
  `ENDING_DEPTH` int(11) NOT NULL,
  `STARTING_DEPTH` int(11) NOT NULL,
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  `ROOT_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FK1BA4E695C5F3D60` (`ROOT_CATEGORY_ID`),
  KEY `FK1BA4E69BCAB9F56` (`GEN_CONFIG_ID`),
  CONSTRAINT `FK1BA4E695C5F3D60` FOREIGN KEY (`ROOT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK1BA4E69BCAB9F56` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `blc_site_map_gen_cfg` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_cat_site_map_gen_cfg` */

insert  into `blc_cat_site_map_gen_cfg`(`ENDING_DEPTH`,`STARTING_DEPTH`,`GEN_CONFIG_ID`,`ROOT_CATEGORY_ID`) values (1,1,-4,2);

/*Table structure for table `blc_catalog` */

DROP TABLE IF EXISTS `blc_catalog`;

CREATE TABLE `blc_catalog` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_catalog` */

/*Table structure for table `blc_category` */

DROP TABLE IF EXISTS `blc_category`;

CREATE TABLE `blc_category` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_PARENT_INDEX` (`DEFAULT_PARENT_CATEGORY_ID`),
  KEY `CATEGORY_NAME_INDEX` (`NAME`),
  KEY `CATEGORY_URL_INDEX` (`URL`),
  KEY `CATEGORY_URLKEY_INDEX` (`URL_KEY`),
  KEY `FK55F82D44B177E6` (`DEFAULT_PARENT_CATEGORY_ID`),
  CONSTRAINT `FK55F82D44B177E6` FOREIGN KEY (`DEFAULT_PARENT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_category` */

insert  into `blc_category`(`CATEGORY_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`ARCHIVED`,`DESCRIPTION`,`DISPLAY_TEMPLATE`,`FULFILLMENT_TYPE`,`INVENTORY_TYPE`,`LONG_DESCRIPTION`,`NAME`,`TAX_CODE`,`URL`,`URL_KEY`,`DEFAULT_PARENT_CATEGORY_ID`) values (1,NULL,'2016-04-06 15:28:24',NULL,'Root',NULL,NULL,NULL,NULL,'根',NULL,NULL,NULL,NULL),(2,NULL,'2016-04-06 15:28:24',NULL,'Primary Nav',NULL,NULL,NULL,NULL,'主导航',NULL,NULL,NULL,1),(2001,NULL,'2016-04-06 15:28:24',NULL,'Home','layout/home',NULL,NULL,NULL,'首页',NULL,'/index',NULL,NULL),(2002,NULL,'2016-04-06 15:28:24',NULL,'Hot Sauces',NULL,NULL,NULL,NULL,'撒欢儿吃',NULL,'/dining',NULL,2),(2003,NULL,'2016-04-06 15:28:24',NULL,'Merchandise',NULL,NULL,NULL,NULL,'可劲儿喝',NULL,'/drinking',NULL,2),(2004,NULL,'2016-04-06 15:28:24',NULL,'Clearance',NULL,NULL,NULL,NULL,'放开玩儿',NULL,'/playing',NULL,2),(2005,NULL,'2016-04-06 15:28:24','Y','New to Hot Sauce?',NULL,NULL,'CHECK_QUANTITY',NULL,'New to Hot Sauce?',NULL,'/new-to-hot-sauce',NULL,2),(2006,NULL,'2016-04-06 15:28:24','Y','FAQs',NULL,NULL,NULL,NULL,'FAQs',NULL,'/faq',NULL,2),(9950,NULL,'2016-04-07 10:02:34','N',NULL,NULL,NULL,NULL,'<p>happy乐</p>','happy乐',NULL,'/fun',NULL,2),(10000,NULL,'2016-04-12 14:33:27','N',NULL,NULL,NULL,NULL,'优惠卡券','优惠卡券',NULL,'/promotion',NULL,2);

/*Table structure for table `blc_category_attribute` */

DROP TABLE IF EXISTS `blc_category_attribute`;

CREATE TABLE `blc_category_attribute` (
  `CATEGORY_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ATTRIBUTE_ID`),
  KEY `CATEGORYATTRIBUTE_INDEX` (`CATEGORY_ID`),
  KEY `CATEGORYATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK4E441D4115D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK4E441D4115D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_category_attribute` */

/*Table structure for table `blc_category_image` */

DROP TABLE IF EXISTS `blc_category_image`;

CREATE TABLE `blc_category_image` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`NAME`),
  KEY `FK27CF3E8015D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK27CF3E8015D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_category_image` */

/*Table structure for table `blc_category_media_map` */

DROP TABLE IF EXISTS `blc_category_media_map`;

CREATE TABLE `blc_category_media_map` (
  `BLC_CATEGORY_CATEGORY_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_CATEGORY_CATEGORY_ID`,`MAP_KEY`),
  KEY `FKCD24B1066E4720E0` (`MEDIA_ID`),
  KEY `FKCD24B106D786CEA2` (`BLC_CATEGORY_CATEGORY_ID`),
  CONSTRAINT `FKCD24B1066E4720E0` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`),
  CONSTRAINT `FKCD24B106D786CEA2` FOREIGN KEY (`BLC_CATEGORY_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_category_media_map` */

insert  into `blc_category_media_map`(`BLC_CATEGORY_CATEGORY_ID`,`MEDIA_ID`,`MAP_KEY`) values (9950,99951,'primary'),(2002,100150,'primary'),(2003,100151,'primary'),(2004,100152,'primary'),(10000,100153,'primary');

/*Table structure for table `blc_category_product_xref` */

DROP TABLE IF EXISTS `blc_category_product_xref`;

CREATE TABLE `blc_category_product_xref` (
  `CATEGORY_PRODUCT_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_PRODUCT_ID`),
  KEY `FK635EB1A615D1A13D` (`CATEGORY_ID`),
  KEY `FK635EB1A65F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK635EB1A615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK635EB1A65F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_category_product_xref` */

insert  into `blc_category_product_xref`(`CATEGORY_PRODUCT_ID`,`DISPLAY_ORDER`,`CATEGORY_ID`,`PRODUCT_ID`) values (1251,NULL,2001,10101),(1252,NULL,2001,10102),(1253,NULL,2001,10103),(1300,'0.000000',2002,10101);

/*Table structure for table `blc_category_xref` */

DROP TABLE IF EXISTS `blc_category_xref`;

CREATE TABLE `blc_category_xref` (
  `CATEGORY_XREF_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `SUB_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_XREF_ID`),
  KEY `FKE889733615D1A13D` (`CATEGORY_ID`),
  KEY `FKE8897336D6D45DBE` (`SUB_CATEGORY_ID`),
  CONSTRAINT `FKE889733615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FKE8897336D6D45DBE` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_category_xref` */

insert  into `blc_category_xref`(`CATEGORY_XREF_ID`,`DISPLAY_ORDER`,`CATEGORY_ID`,`SUB_CATEGORY_ID`) values (1,'1.000000',1,2),(3,'1.000000',2,2002),(4,'2.000000',2,2003),(5,'3.000000',2,2004),(950,'4.000000',2,9950),(1001,'5.000000',2,10000);

/*Table structure for table `blc_challenge_question` */

DROP TABLE IF EXISTS `blc_challenge_question`;

CREATE TABLE `blc_challenge_question` (
  `QUESTION_ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_challenge_question` */

insert  into `blc_challenge_question`(`QUESTION_ID`,`QUESTION`) values (1,'What is your favorite sports team?'),(2,'What was your high school name?'),(3,'What was your childhood nickname?'),(4,'What street did you live on in third grade?'),(5,'What is your oldest sibling\'s middle name?'),(6,'What school did you attend for sixth grade?'),(7,'Where does your nearest sibling live?'),(8,'What is your youngest brother\'s birthday?'),(9,'In what city or town was your first job?');

/*Table structure for table `blc_code_types` */

DROP TABLE IF EXISTS `blc_code_types`;

CREATE TABLE `blc_code_types` (
  `CODE_ID` bigint(20) NOT NULL,
  `CODE_TYPE` varchar(255) NOT NULL,
  `CODE_DESC` varchar(255) DEFAULT NULL,
  `CODE_KEY` varchar(255) NOT NULL,
  `MODIFIABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_code_types` */

/*Table structure for table `blc_country` */

DROP TABLE IF EXISTS `blc_country`;

CREATE TABLE `blc_country` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_country` */

insert  into `blc_country`(`ABBREVIATION`,`NAME`) values ('CA','Canada'),('MX','Mexico'),('US','United States');

/*Table structure for table `blc_credit_card_payment` */

DROP TABLE IF EXISTS `blc_credit_card_payment`;

CREATE TABLE `blc_credit_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `EXPIRATION_MONTH` int(11) NOT NULL,
  `EXPIRATION_YEAR` int(11) NOT NULL,
  `NAME_ON_CARD` varchar(255) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `CREDITCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_credit_card_payment` */

/*Table structure for table `blc_currency` */

DROP TABLE IF EXISTS `blc_currency`;

CREATE TABLE `blc_currency` (
  `CURRENCY_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` tinyint(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_currency` */

insert  into `blc_currency`(`CURRENCY_CODE`,`DEFAULT_FLAG`,`FRIENDLY_NAME`) values ('CNY',1,'YUAN'),('EUR',0,'EURO Dollar'),('GBP',0,'GB Pound'),('MXN',0,'Mexican Peso'),('USD',0,'US Dollar');

/*Table structure for table `blc_cust_site_map_gen_cfg` */

DROP TABLE IF EXISTS `blc_cust_site_map_gen_cfg`;

CREATE TABLE `blc_cust_site_map_gen_cfg` (
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FK67C0DBA0BCAB9F56` (`GEN_CONFIG_ID`),
  CONSTRAINT `FK67C0DBA0BCAB9F56` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `blc_site_map_gen_cfg` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_cust_site_map_gen_cfg` */

insert  into `blc_cust_site_map_gen_cfg`(`GEN_CONFIG_ID`) values (-1);

/*Table structure for table `blc_customer` */

DROP TABLE IF EXISTS `blc_customer`;

CREATE TABLE `blc_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,
  `DEACTIVATED` tinyint(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` tinyint(1) DEFAULT NULL,
  `IS_PREVIEW` tinyint(1) DEFAULT NULL,
  `RECEIVE_EMAIL` tinyint(1) DEFAULT NULL,
  `IS_REGISTERED` tinyint(1) DEFAULT NULL,
  `TAX_EXEMPTION_CODE` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),
  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `FK7716F0241422B204` (`CHALLENGE_QUESTION_ID`),
  KEY `FK7716F024A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK7716F0241422B204` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `blc_challenge_question` (`QUESTION_ID`),
  CONSTRAINT `FK7716F024A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer` */

insert  into `blc_customer`(`CUSTOMER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`CHALLENGE_ANSWER`,`DEACTIVATED`,`EMAIL_ADDRESS`,`FIRST_NAME`,`LAST_NAME`,`PASSWORD`,`PASSWORD_CHANGE_REQUIRED`,`IS_PREVIEW`,`RECEIVE_EMAIL`,`IS_REGISTERED`,`TAX_EXEMPTION_CODE`,`USER_NAME`,`CHALLENGE_QUESTION_ID`,`LOCALE_CODE`) values (510,510,'2016-04-07 10:30:49',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'510',NULL,NULL),(511,511,'2016-04-07 10:43:32',NULL,NULL,NULL,0,'scottfield@qq.com','scott','field','123456{511}',0,NULL,1,1,NULL,'scottfield@qq.com',NULL,NULL),(512,512,'2016-04-07 10:54:40',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'512',NULL,NULL),(713,713,'2016-04-11 10:59:18',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'713',NULL,NULL),(801,801,'2016-04-11 13:28:51',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'801',NULL,NULL),(802,802,'2016-04-11 14:15:16',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'802',NULL,NULL),(908,908,'2016-04-11 15:22:33',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'908',NULL,NULL),(909,909,'2016-04-11 15:24:21',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'909',NULL,NULL),(920,920,'2016-04-11 15:49:19',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'920',NULL,NULL),(1003,1003,'2016-04-12 10:12:06',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'1003',NULL,NULL),(1700,1700,'2016-04-13 13:20:41',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'1700',NULL,NULL),(1701,1701,'2016-04-13 13:40:03',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'1701',NULL,NULL),(2000,2000,'2016-04-13 13:52:17',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2000',NULL,NULL),(2100,2100,'2016-04-13 14:01:39',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2100',NULL,NULL),(2101,2101,'2016-04-13 14:03:19',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2101',NULL,NULL),(2102,2102,'2016-04-13 14:10:21',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2102',NULL,NULL),(2400,2400,'2016-04-13 14:39:11',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2400',NULL,NULL),(2500,2500,'2016-04-13 15:01:30',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2500',NULL,NULL),(2502,2502,'2016-04-13 15:28:50',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2502',NULL,NULL),(2503,2503,'2016-04-13 15:35:32',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2503',NULL,NULL),(2505,2505,'2016-04-13 16:25:57',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2505',NULL,NULL),(2513,2513,'2016-04-13 16:53:39',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2513',NULL,NULL),(2600,2600,'2016-04-14 10:31:01',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'2600',NULL,NULL),(3207,3207,'2016-04-14 16:21:36',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'3207',NULL,NULL),(3600,3600,'2016-04-15 09:54:22',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'3600',NULL,NULL),(3700,3700,'2016-04-15 10:19:45',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,'3700',NULL,NULL),(4009,0,'2016-04-22 12:52:55',NULL,NULL,NULL,0,'default','oGrpEuFiufUy-G08zvOCs','oGrpEuFiufUy-G08zvOCs','oGrpEuFiufUy-G08zvOCs{4009}',0,NULL,1,1,NULL,'oGrpEuFiufUy-G08zvOCs',NULL,NULL),(4100,0,'2016-04-22 14:36:22',NULL,NULL,NULL,0,'default','o1Py0tx91UJXWdtT_gD9xMdI5Rdo','o1Py0tx91UJXWdtT_gD9xMdI5Rdo','o1Py0tx91UJXWdtT_gD9xMdI5Rdo{4100}',0,NULL,1,1,NULL,'o1Py0tx91UJXWdtT_gD9xMdI5Rdo',NULL,NULL),(4200,0,'2016-04-22 15:57:48',NULL,NULL,NULL,0,'default','o1Py0t0t_nH7IWeDG5Pt-APwSlvs','o1Py0t0t_nH7IWeDG5Pt-APwSlvs','o1Py0t0t_nH7IWeDG5Pt-APwSlvs{4200}',0,NULL,1,1,NULL,'o1Py0t0t_nH7IWeDG5Pt-APwSlvs',NULL,NULL),(4201,0,'2016-04-22 15:59:55',NULL,NULL,NULL,0,'default','o1Py0t2PtTPrjoC9ZLL-SOET0in4','o1Py0t2PtTPrjoC9ZLL-SOET0in4','o1Py0t2PtTPrjoC9ZLL-SOET0in4{4201}',0,NULL,1,1,NULL,'o1Py0t2PtTPrjoC9ZLL-SOET0in4',NULL,NULL),(4300,0,'2016-04-22 16:29:38',NULL,NULL,NULL,0,'default','o1Py0twT_6kpQRqIX4rJiQD_fjvQ','o1Py0twT_6kpQRqIX4rJiQD_fjvQ','o1Py0twT_6kpQRqIX4rJiQD_fjvQ{4300}',0,NULL,1,1,NULL,'o1Py0twT_6kpQRqIX4rJiQD_fjvQ',NULL,NULL),(4301,0,'2016-04-22 18:17:42',NULL,NULL,NULL,0,'default','o1Py0t1iezuzyemRO4ab6aQv-so0','o1Py0t1iezuzyemRO4ab6aQv-so0','o1Py0t1iezuzyemRO4ab6aQv-so0{4301}',0,NULL,1,1,NULL,'o1Py0t1iezuzyemRO4ab6aQv-so0',NULL,NULL),(4302,0,'2016-04-23 03:02:25',NULL,NULL,NULL,0,'default','o1Py0t7UnGihjJqCfZz2bigtkTu4','o1Py0t7UnGihjJqCfZz2bigtkTu4','o1Py0t7UnGihjJqCfZz2bigtkTu4{4302}',0,NULL,1,1,NULL,'o1Py0t7UnGihjJqCfZz2bigtkTu4',NULL,NULL),(4303,0,'2016-04-23 09:07:10',NULL,NULL,NULL,0,'default','o1Py0t3EI8exRZV1sJwXbjEXKyd0','o1Py0t3EI8exRZV1sJwXbjEXKyd0','o1Py0t3EI8exRZV1sJwXbjEXKyd0{4303}',0,NULL,1,1,NULL,'o1Py0t3EI8exRZV1sJwXbjEXKyd0',NULL,NULL),(4304,0,'2016-04-23 10:21:44',NULL,NULL,NULL,0,'default','o1Py0txluXabtV5Mhi-AX_18GWBQ','o1Py0txluXabtV5Mhi-AX_18GWBQ','o1Py0txluXabtV5Mhi-AX_18GWBQ{4304}',0,NULL,1,1,NULL,'o1Py0txluXabtV5Mhi-AX_18GWBQ',NULL,NULL),(4305,0,'2016-04-23 20:36:51',NULL,NULL,NULL,0,'default','o1Py0t8UiQYUeGVU_2-W8Dp1jpLE','o1Py0t8UiQYUeGVU_2-W8Dp1jpLE','o1Py0t8UiQYUeGVU_2-W8Dp1jpLE{4305}',0,NULL,1,1,NULL,'o1Py0t8UiQYUeGVU_2-W8Dp1jpLE',NULL,NULL),(4306,0,'2016-04-23 22:32:15',NULL,NULL,NULL,0,'default','o1Py0t27K1b8-J5zySnPCze7fSws','o1Py0t27K1b8-J5zySnPCze7fSws','o1Py0t27K1b8-J5zySnPCze7fSws{4306}',0,NULL,1,1,NULL,'o1Py0t27K1b8-J5zySnPCze7fSws',NULL,NULL),(4307,0,'2016-04-23 23:18:28',NULL,NULL,NULL,0,'default','o1Py0t_3eO1w4Rzn8aphFcUK8K84','o1Py0t_3eO1w4Rzn8aphFcUK8K84','o1Py0t_3eO1w4Rzn8aphFcUK8K84{4307}',0,NULL,1,1,NULL,'o1Py0t_3eO1w4Rzn8aphFcUK8K84',NULL,NULL),(4308,0,'2016-04-23 23:50:16',NULL,NULL,NULL,0,'default','o1Py0t4zossAygh4JbGs0CCJHhaI','o1Py0t4zossAygh4JbGs0CCJHhaI','o1Py0t4zossAygh4JbGs0CCJHhaI{4308}',0,NULL,1,1,NULL,'o1Py0t4zossAygh4JbGs0CCJHhaI',NULL,NULL),(4309,0,'2016-04-24 07:24:28',NULL,NULL,NULL,0,'default','o1Py0t_9yjKZUoVH67YQOmmH0ZKw','o1Py0t_9yjKZUoVH67YQOmmH0ZKw','o1Py0t_9yjKZUoVH67YQOmmH0ZKw{4309}',0,NULL,1,1,NULL,'o1Py0t_9yjKZUoVH67YQOmmH0ZKw',NULL,NULL);

/*Table structure for table `blc_customer_address` */

DROP TABLE IF EXISTS `blc_customer_address`;

CREATE TABLE `blc_customer_address` (
  `CUSTOMER_ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ADDRESS_ID`),
  UNIQUE KEY `CSTMR_ADDR_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`ADDRESS_NAME`),
  KEY `CUSTOMERADDRESS_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK75B95AB9C13085DD` (`ADDRESS_ID`),
  KEY `FK75B95AB97470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB97470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB9C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_address` */

insert  into `blc_customer_address`(`CUSTOMER_ADDRESS_ID`,`ADDRESS_NAME`,`ADDRESS_ID`,`CUSTOMER_ID`) values (103,'收货地址',404,511),(151,'收货地址',451,4100),(201,'收货地址',501,4300);

/*Table structure for table `blc_customer_attribute` */

DROP TABLE IF EXISTS `blc_customer_attribute`;

CREATE TABLE `blc_customer_attribute` (
  `CUSTOMER_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTR_ID`),
  KEY `FKB974C8217470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKB974C8217470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_attribute` */

insert  into `blc_customer_attribute`(`CUSTOMER_ATTR_ID`,`NAME`,`VALUE`,`CUSTOMER_ID`) values (8,'openid','oGrpEuFiufUy-G08zvOCs',4009),(51,'openid','o1Py0tx91UJXWdtT_gD9xMdI5Rdo',4100),(101,'openid','o1Py0t0t_nH7IWeDG5Pt-APwSlvs',4200),(102,'openid','o1Py0t2PtTPrjoC9ZLL-SOET0in4',4201),(151,'openid','o1Py0twT_6kpQRqIX4rJiQD_fjvQ',4300),(152,'openid','o1Py0t1iezuzyemRO4ab6aQv-so0',4301),(153,'openid','o1Py0t7UnGihjJqCfZz2bigtkTu4',4302),(154,'openid','o1Py0t3EI8exRZV1sJwXbjEXKyd0',4303),(155,'openid','o1Py0txluXabtV5Mhi-AX_18GWBQ',4304),(156,'openid','o1Py0t8UiQYUeGVU_2-W8Dp1jpLE',4305),(157,'openid','o1Py0t27K1b8-J5zySnPCze7fSws',4306),(158,'openid','o1Py0t_3eO1w4Rzn8aphFcUK8K84',4307),(159,'openid','o1Py0t4zossAygh4JbGs0CCJHhaI',4308),(160,'openid','o1Py0t_9yjKZUoVH67YQOmmH0ZKw',4309);

/*Table structure for table `blc_customer_offer_xref` */

DROP TABLE IF EXISTS `blc_customer_offer_xref`;

CREATE TABLE `blc_customer_offer_xref` (
  `CUSTOMER_OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_OFFER_ID`),
  KEY `CUSTOFFER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTOFFER_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK685E80397470F437` (`CUSTOMER_ID`),
  KEY `FK685E8039D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK685E80397470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK685E8039D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_offer_xref` */

/*Table structure for table `blc_customer_password_token` */

DROP TABLE IF EXISTS `blc_customer_password_token`;

CREATE TABLE `blc_customer_password_token` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_password_token` */

/*Table structure for table `blc_customer_payment` */

DROP TABLE IF EXISTS `blc_customer_payment`;

CREATE TABLE `blc_customer_payment` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `PAYMENT_TOKEN` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`),
  UNIQUE KEY `CSTMR_PAY_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`PAYMENT_TOKEN`),
  KEY `FK8B3DF0CBC13085DD` (`ADDRESS_ID`),
  KEY `FK8B3DF0CB7470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CB7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CBC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_payment` */

/*Table structure for table `blc_customer_payment_fields` */

DROP TABLE IF EXISTS `blc_customer_payment_fields`;

CREATE TABLE `blc_customer_payment_fields` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`,`FIELD_NAME`),
  KEY `FK5CCB14ADCA0B98E0` (`CUSTOMER_PAYMENT_ID`),
  CONSTRAINT `FK5CCB14ADCA0B98E0` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `blc_customer_payment` (`CUSTOMER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_payment_fields` */

/*Table structure for table `blc_customer_phone` */

DROP TABLE IF EXISTS `blc_customer_phone`;

CREATE TABLE `blc_customer_phone` (
  `CUSTOMER_PHONE_ID` bigint(20) NOT NULL,
  `PHONE_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PHONE_ID`),
  UNIQUE KEY `CSTMR_PHONE_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`PHONE_NAME`),
  KEY `CUSTPHONE_PHONE_INDEX` (`PHONE_ID`),
  KEY `FK3D28ED737470F437` (`CUSTOMER_ID`),
  KEY `FK3D28ED73D894CB5D` (`PHONE_ID`),
  CONSTRAINT `FK3D28ED737470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK3D28ED73D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_phone` */

/*Table structure for table `blc_customer_role` */

DROP TABLE IF EXISTS `blc_customer_role`;

CREATE TABLE `blc_customer_role` (
  `CUSTOMER_ROLE_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ROLE_ID`),
  KEY `CUSTROLE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTROLE_ROLE_INDEX` (`ROLE_ID`),
  KEY `FK548EB7B17470F437` (`CUSTOMER_ID`),
  KEY `FK548EB7B1B8587B7` (`ROLE_ID`),
  CONSTRAINT `FK548EB7B17470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK548EB7B1B8587B7` FOREIGN KEY (`ROLE_ID`) REFERENCES `blc_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_customer_role` */

insert  into `blc_customer_role`(`CUSTOMER_ROLE_ID`,`CUSTOMER_ID`,`ROLE_ID`) values (1,511,1),(57,4009,1),(101,4100,1),(151,4200,1),(152,4201,1),(201,4300,1),(202,4301,1),(203,4302,1),(204,4303,1),(205,4304,1),(206,4305,1),(207,4306,1),(208,4307,1),(209,4308,1),(210,4309,1);

/*Table structure for table `blc_data_drvn_enum` */

DROP TABLE IF EXISTS `blc_data_drvn_enum`;

CREATE TABLE `blc_data_drvn_enum` (
  `ENUM_ID` bigint(20) NOT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `MODIFIABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ENUM_ID`),
  KEY `ENUM_KEY_INDEX` (`ENUM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_data_drvn_enum` */

/*Table structure for table `blc_data_drvn_enum_val` */

DROP TABLE IF EXISTS `blc_data_drvn_enum_val`;

CREATE TABLE `blc_data_drvn_enum_val` (
  `ENUM_VAL_ID` bigint(20) NOT NULL,
  `DISPLAY` varchar(255) DEFAULT NULL,
  `HIDDEN` tinyint(1) DEFAULT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `ENUM_TYPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENUM_VAL_ID`),
  KEY `HIDDEN_INDEX` (`HIDDEN`),
  KEY `ENUM_VAL_KEY_INDEX` (`ENUM_KEY`),
  KEY `FKB2D5700DA60E0554` (`ENUM_TYPE`),
  CONSTRAINT `FKB2D5700DA60E0554` FOREIGN KEY (`ENUM_TYPE`) REFERENCES `blc_data_drvn_enum` (`ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_data_drvn_enum_val` */

/*Table structure for table `blc_disc_item_fee_price` */

DROP TABLE IF EXISTS `blc_disc_item_fee_price`;

CREATE TABLE `blc_disc_item_fee_price` (
  `DISC_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DISC_ITEM_FEE_PRICE_ID`),
  KEY `FK2A641CC8B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK2A641CC8B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_disc_item_fee_price` */

/*Table structure for table `blc_discrete_order_item` */

DROP TABLE IF EXISTS `blc_discrete_order_item`;

CREATE TABLE `blc_discrete_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `BUNDLE_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  `SKU_BUNDLE_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `DISCRETE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `DISCRETE_SKU_INDEX` (`SKU_ID`),
  KEY `FKBC3A8A845CDFCA80` (`BUNDLE_ORDER_ITEM_ID`),
  KEY `FKBC3A8A845F11A0B7` (`PRODUCT_ID`),
  KEY `FKBC3A8A84B78C9977` (`SKU_ID`),
  KEY `FKBC3A8A841285903B` (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKBC3A8A849AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A841285903B` FOREIGN KEY (`SKU_BUNDLE_ITEM_ID`) REFERENCES `blc_sku_bundle_item` (`SKU_BUNDLE_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845CDFCA80` FOREIGN KEY (`BUNDLE_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKBC3A8A849AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A84B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_discrete_order_item` */

insert  into `blc_discrete_order_item`(`BASE_RETAIL_PRICE`,`BASE_SALE_PRICE`,`ORDER_ITEM_ID`,`BUNDLE_ORDER_ITEM_ID`,`PRODUCT_ID`,`SKU_ID`,`SKU_BUNDLE_ITEM_ID`) values ('699.00000','499.00000',901,NULL,10101,10201,NULL),('699.00000','499.00000',951,NULL,10101,10201,NULL),('699.00000','499.00000',952,NULL,10101,10201,NULL),('699.00000','499.00000',1001,NULL,10101,10201,NULL),('699.00000','499.00000',1051,NULL,10101,10201,NULL),('699.00000','499.00000',1052,NULL,10101,10201,NULL),('699.00000','499.00000',1053,NULL,10101,10201,NULL),('899.00000','699.00000',1054,NULL,10102,10202,NULL),('699.00000','499.00000',1055,NULL,10101,10201,NULL),('699.00000','499.00000',1056,NULL,10101,10201,NULL),('699.00000','499.00000',1101,NULL,10101,10201,NULL),('699.00000','499.00000',1151,NULL,10101,10201,NULL),('699.00000','499.00000',1201,NULL,10101,10201,NULL),('699.00000','499.00000',1251,NULL,10101,10201,NULL);

/*Table structure for table `blc_dyn_discrete_order_item` */

DROP TABLE IF EXISTS `blc_dyn_discrete_order_item`;

CREATE TABLE `blc_dyn_discrete_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK209DEE9EB76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK209DEE9EB76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_dyn_discrete_order_item` */

/*Table structure for table `blc_email_tracking` */

DROP TABLE IF EXISTS `blc_email_tracking`;

CREATE TABLE `blc_email_tracking` (
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_TRACKING_ID`),
  KEY `EMAILTRACKING_INDEX` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_email_tracking` */

insert  into `blc_email_tracking`(`EMAIL_TRACKING_ID`,`DATE_SENT`,`EMAIL_ADDRESS`,`TYPE`) values (1,'2016-04-07 10:43:32','scottfield@qq.com',NULL),(2,'2016-04-07 10:44:14','scottfield@qq.com',NULL),(51,'2016-04-11 11:00:30','scottfield@qq.com',NULL),(52,'2016-04-11 11:03:03','scottfield@qq.com',NULL),(101,'2016-04-11 13:29:49','scottfield@qq.com',NULL),(102,'2016-04-11 14:16:45','scottfield@qq.com',NULL),(151,'2016-04-12 10:13:15','scottfield@qq.com',NULL),(207,'2016-04-22 12:52:55','default',NULL),(251,'2016-04-22 14:36:22','default',NULL),(301,'2016-04-22 15:57:48','default',NULL),(302,'2016-04-22 15:59:55','default',NULL),(351,'2016-04-22 16:29:38','default',NULL),(352,'2016-04-22 18:17:42','default',NULL),(353,'2016-04-23 03:02:25','default',NULL),(354,'2016-04-23 09:07:10','default',NULL),(355,'2016-04-23 10:21:44','default',NULL),(356,'2016-04-23 20:36:51','default',NULL),(357,'2016-04-23 22:32:15','default',NULL),(358,'2016-04-23 23:18:28','default',NULL),(359,'2016-04-23 23:50:16','default',NULL),(360,'2016-04-24 07:24:28','default',NULL);

/*Table structure for table `blc_email_tracking_clicks` */

DROP TABLE IF EXISTS `blc_email_tracking_clicks`;

CREATE TABLE `blc_email_tracking_clicks` (
  `CLICK_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `DATE_CLICKED` datetime NOT NULL,
  `DESTINATION_URI` varchar(255) DEFAULT NULL,
  `QUERY_STRING` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLICK_ID`),
  KEY `TRACKINGCLICKS_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `TRACKINGCLICKS_TRACKING_INDEX` (`EMAIL_TRACKING_ID`),
  KEY `FKFDF9F52AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKFDF9F52AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_email_tracking_clicks` */

/*Table structure for table `blc_email_tracking_opens` */

DROP TABLE IF EXISTS `blc_email_tracking_opens`;

CREATE TABLE `blc_email_tracking_opens` (
  `OPEN_ID` bigint(20) NOT NULL,
  `DATE_OPENED` datetime DEFAULT NULL,
  `USER_AGENT` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OPEN_ID`),
  KEY `TRACKINGOPEN_TRACKING` (`EMAIL_TRACKING_ID`),
  KEY `FKA5C3722AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKA5C3722AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_email_tracking_opens` */

/*Table structure for table `blc_fg_adjustment` */

DROP TABLE IF EXISTS `blc_fg_adjustment`;

CREATE TABLE `blc_fg_adjustment` (
  `FG_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FG_ADJUSTMENT_ID`),
  KEY `FGADJUSTMENT_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGADJUSTMENT_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK468C8F255028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FK468C8F25D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK468C8F255028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK468C8F25D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fg_adjustment` */

/*Table structure for table `blc_fg_fee_tax_xref` */

DROP TABLE IF EXISTS `blc_fg_fee_tax_xref`;

CREATE TABLE `blc_fg_fee_tax_xref` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_25426DC0FA888C35` (`TAX_DETAIL_ID`),
  KEY `FK25426DC071448C19` (`TAX_DETAIL_ID`),
  KEY `FK25426DC0598F6D02` (`FULFILLMENT_GROUP_FEE_ID`),
  CONSTRAINT `FK25426DC0598F6D02` FOREIGN KEY (`FULFILLMENT_GROUP_FEE_ID`) REFERENCES `blc_fulfillment_group_fee` (`FULFILLMENT_GROUP_FEE_ID`),
  CONSTRAINT `FK25426DC071448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fg_fee_tax_xref` */

/*Table structure for table `blc_fg_fg_tax_xref` */

DROP TABLE IF EXISTS `blc_fg_fg_tax_xref`;

CREATE TABLE `blc_fg_fg_tax_xref` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_61BEA455FA888C35` (`TAX_DETAIL_ID`),
  KEY `FK61BEA45571448C19` (`TAX_DETAIL_ID`),
  KEY `FK61BEA4555028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA4555028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA45571448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fg_fg_tax_xref` */

/*Table structure for table `blc_fg_item_tax_xref` */

DROP TABLE IF EXISTS `blc_fg_item_tax_xref`;

CREATE TABLE `blc_fg_item_tax_xref` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_DD3E8443FA888C35` (`TAX_DETAIL_ID`),
  KEY `FKDD3E844371448C19` (`TAX_DETAIL_ID`),
  KEY `FKDD3E8443E3BBB4D2` (`FULFILLMENT_GROUP_ITEM_ID`),
  CONSTRAINT `FKDD3E844371448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKDD3E8443E3BBB4D2` FOREIGN KEY (`FULFILLMENT_GROUP_ITEM_ID`) REFERENCES `blc_fulfillment_group_item` (`FULFILLMENT_GROUP_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fg_item_tax_xref` */

/*Table structure for table `blc_field` */

DROP TABLE IF EXISTS `blc_field`;

CREATE TABLE `blc_field` (
  `FIELD_ID` bigint(20) NOT NULL,
  `ABBREVIATION` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `FACET_FIELD_TYPE` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `TRANSLATABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `ENTITY_TYPE_INDEX` (`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_field` */

insert  into `blc_field`(`FIELD_ID`,`ABBREVIATION`,`ENTITY_TYPE`,`FACET_FIELD_TYPE`,`PROPERTY_NAME`,`SEARCHABLE`,`TRANSLATABLE`) values (1,'mfg','PRODUCT','s','manufacturer',1,NULL),(2,'heatRange','PRODUCT','i','productAttributes.heatRange',0,NULL),(3,'price','PRODUCT','p','defaultSku.retailPrice',0,NULL),(4,'name','PRODUCT','s','defaultSku.name',1,1),(5,'model','PRODUCT','s','model',1,NULL),(6,'desc','PRODUCT',NULL,'defaultSku.description',1,1),(7,'ldesc','PRODUCT',NULL,'defaultSku.longDescription',1,1),(8,'color','PRODUCT','s','productAttributes.color',1,NULL);

/*Table structure for table `blc_field_search_types` */

DROP TABLE IF EXISTS `blc_field_search_types`;

CREATE TABLE `blc_field_search_types` (
  `FIELD_ID` bigint(20) NOT NULL,
  `SEARCHABLE_FIELD_TYPE` varchar(255) DEFAULT NULL,
  KEY `FKF52D130D3C3907C4` (`FIELD_ID`),
  CONSTRAINT `FKF52D130D3C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_field_search_types` */

insert  into `blc_field_search_types`(`FIELD_ID`,`SEARCHABLE_FIELD_TYPE`) values (1,'t'),(4,'t'),(5,'t'),(6,'t'),(7,'t');

/*Table structure for table `blc_fld_def` */

DROP TABLE IF EXISTS `blc_fld_def`;

CREATE TABLE `blc_fld_def` (
  `FLD_DEF_ID` bigint(20) NOT NULL,
  `ALLOW_MULTIPLES` tinyint(1) DEFAULT NULL,
  `COLUMN_WIDTH` varchar(255) DEFAULT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FLD_TYPE` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `HIDDEN_FLAG` tinyint(1) DEFAULT NULL,
  `MAX_LENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REQUIRED_FLAG` tinyint(1) DEFAULT NULL,
  `SECURITY_LEVEL` varchar(255) DEFAULT NULL,
  `TEXT_AREA_FLAG` tinyint(1) DEFAULT NULL,
  `VLDTN_ERROR_MSSG_KEY` varchar(255) DEFAULT NULL,
  `VLDTN_REGEX` varchar(255) DEFAULT NULL,
  `ENUM_ID` bigint(20) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_DEF_ID`),
  KEY `FK3FCB575E38D08AB5` (`ENUM_ID`),
  KEY `FK3FCB575E6A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575E38D08AB5` FOREIGN KEY (`ENUM_ID`) REFERENCES `blc_data_drvn_enum` (`ENUM_ID`),
  CONSTRAINT `FK3FCB575E6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fld_def` */

insert  into `blc_fld_def`(`FLD_DEF_ID`,`ALLOW_MULTIPLES`,`COLUMN_WIDTH`,`FLD_ORDER`,`FLD_TYPE`,`FRIENDLY_NAME`,`HIDDEN_FLAG`,`MAX_LENGTH`,`NAME`,`REQUIRED_FLAG`,`SECURITY_LEVEL`,`TEXT_AREA_FLAG`,`VLDTN_ERROR_MSSG_KEY`,`VLDTN_REGEX`,`ENUM_ID`,`FLD_GROUP_ID`) values (-2,0,'*',1,'BOOLEAN','纯文本',0,NULL,'plainText',NULL,NULL,0,NULL,NULL,NULL,-3),(-1,0,'*',0,'HTML','文件内容',0,NULL,'body',NULL,NULL,0,NULL,NULL,NULL,-3),(2,0,'*',1,'HTML','内容',0,NULL,'body',NULL,NULL,0,NULL,NULL,NULL,1),(3,0,'*',0,'STRING','标题',0,NULL,'title',NULL,NULL,0,NULL,NULL,NULL,1),(7,0,'*',0,'STRING','图片路径',0,150,'imageUrl',NULL,NULL,0,NULL,NULL,NULL,4),(8,0,'*',1,'STRING','目标路径',0,150,'targetUrl',NULL,NULL,0,NULL,NULL,NULL,4),(9,0,'*',0,'STRING','消息文本',0,150,'messageText',NULL,NULL,0,NULL,NULL,NULL,6),(10,0,'*',0,'HTML','HTML内容',0,NULL,'htmlContent',NULL,NULL,0,NULL,NULL,NULL,5);

/*Table structure for table `blc_fld_enum` */

DROP TABLE IF EXISTS `blc_fld_enum`;

CREATE TABLE `blc_fld_enum` (
  `FLD_ENUM_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fld_enum` */

/*Table structure for table `blc_fld_enum_item` */

DROP TABLE IF EXISTS `blc_fld_enum_item`;

CREATE TABLE `blc_fld_enum_item` (
  `FLD_ENUM_ITEM_ID` bigint(20) NOT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ITEM_ID`),
  KEY `FK83A6A84AFD2EA299` (`FLD_ENUM_ID`),
  CONSTRAINT `FK83A6A84AFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `blc_fld_enum` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fld_enum_item` */

/*Table structure for table `blc_fld_group` */

DROP TABLE IF EXISTS `blc_fld_group`;

CREATE TABLE `blc_fld_group` (
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `INIT_COLLAPSED_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fld_group` */

insert  into `blc_fld_group`(`FLD_GROUP_ID`,`INIT_COLLAPSED_FLAG`,`NAME`) values (-3,0,'无'),(1,0,'内容'),(4,0,'添加字段'),(5,0,'HTML字段'),(6,0,'消息字段');

/*Table structure for table `blc_fulfillment_group` */

DROP TABLE IF EXISTS `blc_fulfillment_group`;

CREATE TABLE `blc_fulfillment_group` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `DELIVERY_INSTRUCTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `SHIPPING_PRICE_TAXABLE` tinyint(1) DEFAULT NULL,
  `MERCHANDISE_TOTAL` decimal(19,5) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `IS_PRIMARY` tinyint(1) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_SEQUNCE` int(11) DEFAULT NULL,
  `SERVICE` varchar(255) DEFAULT NULL,
  `SHIPPING_OVERRIDE` tinyint(1) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_FG_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ID`),
  KEY `FG_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FG_METHOD_INDEX` (`METHOD`),
  KEY `FG_ORDER_INDEX` (`ORDER_ID`),
  KEY `FG_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FG_PHONE_INDEX` (`PHONE_ID`),
  KEY `FG_PRIMARY_INDEX` (`IS_PRIMARY`),
  KEY `FG_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `FG_SERVICE_INDEX` (`SERVICE`),
  KEY `FG_STATUS_INDEX` (`STATUS`),
  KEY `FKC5B9EF18C13085DD` (`ADDRESS_ID`),
  KEY `FKC5B9EF1881F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKC5B9EF1889FE8A02` (`ORDER_ID`),
  KEY `FKC5B9EF1877F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FKC5B9EF18D894CB5D` (`PHONE_ID`),
  CONSTRAINT `FKC5B9EF1877F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FKC5B9EF1881F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC5B9EF1889FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FKC5B9EF18C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`),
  CONSTRAINT `FKC5B9EF18D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_group` */

insert  into `blc_fulfillment_group`(`FULFILLMENT_GROUP_ID`,`DELIVERY_INSTRUCTION`,`PRICE`,`SHIPPING_PRICE_TAXABLE`,`MERCHANDISE_TOTAL`,`METHOD`,`IS_PRIMARY`,`REFERENCE_NUMBER`,`RETAIL_PRICE`,`SALE_PRICE`,`FULFILLMENT_GROUP_SEQUNCE`,`SERVICE`,`SHIPPING_OVERRIDE`,`STATUS`,`TOTAL`,`TOTAL_FEE_TAX`,`TOTAL_FG_TAX`,`TOTAL_ITEM_TAX`,`TOTAL_TAX`,`TYPE`,`ADDRESS_ID`,`FULFILLMENT_OPTION_ID`,`ORDER_ID`,`PERSONAL_MESSAGE_ID`,`PHONE_ID`) values (751,NULL,'0.00000',0,'998.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'998.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,851,NULL,NULL),(801,NULL,'0.00000',0,'998.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'998.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,901,NULL,NULL),(802,NULL,'0.00000',0,'499.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'499.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,902,NULL,NULL),(851,NULL,'0.00000',0,'1497.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'1497.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,951,NULL,NULL),(901,NULL,'0.00000',0,'499.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'499.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1001,NULL,NULL),(902,NULL,'0.00000',0,'998.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'998.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1002,NULL,NULL),(903,NULL,'0.00000',0,'3594.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'3594.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1003,NULL,NULL),(904,NULL,'0.00000',0,'1497.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'1497.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1004,NULL,NULL),(905,NULL,'0.00000',0,'998.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'998.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1005,NULL,NULL),(951,NULL,'0.00000',0,'499.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'499.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1051,NULL,NULL),(1001,NULL,'0.00000',0,'499.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'499.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1101,NULL,NULL),(1051,NULL,'0.00000',0,'998.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'998.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1151,NULL,NULL),(1101,NULL,'0.00000',0,'998.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'998.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,1201,NULL,NULL);

/*Table structure for table `blc_fulfillment_group_fee` */

DROP TABLE IF EXISTS `blc_fulfillment_group_fee`;

CREATE TABLE `blc_fulfillment_group_fee` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `FEE_TAXABLE_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK6AA8E1BF5028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK6AA8E1BF5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_group_fee` */

/*Table structure for table `blc_fulfillment_group_item` */

DROP TABLE IF EXISTS `blc_fulfillment_group_item`;

CREATE TABLE `blc_fulfillment_group_item` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `PRORATED_ORDER_ADJ` decimal(19,2) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL_ITEM_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAXABLE_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FGITEM_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGITEM_STATUS_INDEX` (`STATUS`),
  KEY `FKEA74EBDA5028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FKEA74EBDA9AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKEA74EBDA5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKEA74EBDA9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_group_item` */

insert  into `blc_fulfillment_group_item`(`FULFILLMENT_GROUP_ITEM_ID`,`PRORATED_ORDER_ADJ`,`QUANTITY`,`STATUS`,`TOTAL_ITEM_AMOUNT`,`TOTAL_ITEM_TAXABLE_AMOUNT`,`TOTAL_ITEM_TAX`,`FULFILLMENT_GROUP_ID`,`ORDER_ITEM_ID`) values (901,'0.00',2,NULL,'998.00000','998.00000','0.00000',751,901),(951,'0.00',2,NULL,'998.00000','998.00000','0.00000',801,951),(952,'0.00',1,NULL,'499.00000','499.00000','0.00000',802,952),(1001,'0.00',3,NULL,'1497.00000','1497.00000','0.00000',851,1001),(1051,'0.00',1,NULL,'499.00000','499.00000','0.00000',901,1051),(1052,'0.00',2,NULL,'998.00000','998.00000','0.00000',902,1052),(1053,'0.00',3,NULL,'1497.00000','1497.00000','0.00000',903,1053),(1054,'0.00',3,NULL,'2097.00000','2097.00000','0.00000',903,1054),(1055,'0.00',3,NULL,'1497.00000','1497.00000','0.00000',904,1055),(1056,'0.00',2,NULL,'998.00000','998.00000','0.00000',905,1056),(1101,'0.00',1,NULL,'499.00000','499.00000','0.00000',951,1101),(1151,'0.00',1,NULL,'499.00000','499.00000','0.00000',1001,1151),(1201,'0.00',2,NULL,'998.00000','998.00000','0.00000',1051,1201),(1251,'0.00',2,NULL,'998.00000','998.00000','0.00000',1101,1251);

/*Table structure for table `blc_fulfillment_opt_banded_prc` */

DROP TABLE IF EXISTS `blc_fulfillment_opt_banded_prc`;

CREATE TABLE `blc_fulfillment_opt_banded_prc` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD71E981F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD71E981F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_opt_banded_prc` */

/*Table structure for table `blc_fulfillment_opt_banded_wgt` */

DROP TABLE IF EXISTS `blc_fulfillment_opt_banded_wgt`;

CREATE TABLE `blc_fulfillment_opt_banded_wgt` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD8AEC81F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD8AEC81F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_opt_banded_wgt` */

/*Table structure for table `blc_fulfillment_option` */

DROP TABLE IF EXISTS `blc_fulfillment_option`;

CREATE TABLE `blc_fulfillment_option` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `FULFILLMENT_TYPE` varchar(255) NOT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `TAXABLE` tinyint(1) DEFAULT NULL,
  `USE_FLAT_RATES` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_option` */

insert  into `blc_fulfillment_option`(`FULFILLMENT_OPTION_ID`,`FULFILLMENT_TYPE`,`LONG_DESCRIPTION`,`NAME`,`TAX_CODE`,`TAXABLE`,`USE_FLAT_RATES`) values (1,'PHYSICAL_SHIP','5 - 7 Days','Standard',NULL,NULL,0),(2,'PHYSICAL_SHIP','3 - 5 Days','Priority',NULL,NULL,0),(3,'PHYSICAL_SHIP','1 - 2 Days','Express',NULL,NULL,0);

/*Table structure for table `blc_fulfillment_option_fixed` */

DROP TABLE IF EXISTS `blc_fulfillment_option_fixed`;

CREATE TABLE `blc_fulfillment_option_fixed` (
  `PRICE` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FK408360313E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK4083603181F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK408360313E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK4083603181F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_option_fixed` */

insert  into `blc_fulfillment_option_fixed`(`PRICE`,`FULFILLMENT_OPTION_ID`,`CURRENCY_CODE`) values ('5.00000',1,NULL),('10.00000',2,NULL),('20.00000',3,NULL);

/*Table structure for table `blc_fulfillment_price_band` */

DROP TABLE IF EXISTS `blc_fulfillment_price_band`;

CREATE TABLE `blc_fulfillment_price_band` (
  `FULFILLMENT_PRICE_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `RETAIL_PRICE_MINIMUM_AMOUNT` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_PRICE_BAND_ID`),
  KEY `FK46C9EA726CDF59CA` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK46C9EA726CDF59CA` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_prc` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_price_band` */

/*Table structure for table `blc_fulfillment_weight_band` */

DROP TABLE IF EXISTS `blc_fulfillment_weight_band`;

CREATE TABLE `blc_fulfillment_weight_band` (
  `FULFILLMENT_WEIGHT_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `MINIMUM_WEIGHT` decimal(19,5) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_WEIGHT_BAND_ID`),
  KEY `FK6A048D95A0B429C3` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK6A048D95A0B429C3` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_wgt` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_fulfillment_weight_band` */

/*Table structure for table `blc_gift_card_payment` */

DROP TABLE IF EXISTS `blc_gift_card_payment`;

CREATE TABLE `blc_gift_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `PIN` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `GIFTCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_gift_card_payment` */

/*Table structure for table `blc_giftwrap_order_item` */

DROP TABLE IF EXISTS `blc_giftwrap_order_item`;

CREATE TABLE `blc_giftwrap_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FKE1BE1563B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKE1BE1563B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_giftwrap_order_item` */

/*Table structure for table `blc_id_generation` */

DROP TABLE IF EXISTS `blc_id_generation`;

CREATE TABLE `blc_id_generation` (
  `ID_TYPE` varchar(255) NOT NULL,
  `BATCH_SIZE` bigint(20) NOT NULL,
  `BATCH_START` bigint(20) NOT NULL,
  `ID_MIN` bigint(20) DEFAULT NULL,
  `ID_MAX` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_id_generation` */

insert  into `blc_id_generation`(`ID_TYPE`,`BATCH_SIZE`,`BATCH_START`,`ID_MIN`,`ID_MAX`,`version`) values ('org.broadleafcommerce.profile.core.domain.Customer',100,4400,NULL,NULL,44);

/*Table structure for table `blc_img_static_asset` */

DROP TABLE IF EXISTS `blc_img_static_asset`;

CREATE TABLE `blc_img_static_asset` (
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `FKCC4B772167F70B63` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKCC4B772167F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_img_static_asset` */

insert  into `blc_img_static_asset`(`HEIGHT`,`WIDTH`,`STATIC_ASSET_ID`) values (119,180,99950),(119,180,99951),(407,641,99952),(1181,1772,100000),(119,180,100001),(174,134,100002),(174,134,100003),(174,134,100004),(174,134,100005),(174,134,100006),(358,358,100007);

/*Table structure for table `blc_item_offer_qualifier` */

DROP TABLE IF EXISTS `blc_item_offer_qualifier`;

CREATE TABLE `blc_item_offer_qualifier` (
  `ITEM_OFFER_QUALIFIER_ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ITEM_OFFER_QUALIFIER_ID`),
  KEY `FKD9C50C61D5F3FAF4` (`OFFER_ID`),
  KEY `FKD9C50C619AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKD9C50C619AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKD9C50C61D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_item_offer_qualifier` */

/*Table structure for table `blc_locale` */

DROP TABLE IF EXISTS `blc_locale`;

CREATE TABLE `blc_locale` (
  `LOCALE_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` tinyint(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `USE_IN_SEARCH_INDEX` tinyint(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCALE_CODE`),
  KEY `FK56C7DC203E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FK56C7DC203E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_locale` */

insert  into `blc_locale`(`LOCALE_CODE`,`DEFAULT_FLAG`,`FRIENDLY_NAME`,`USE_IN_SEARCH_INDEX`,`CURRENCY_CODE`) values ('en',0,'English',NULL,'USD'),('en_GB',0,'English (United Kingdom)',NULL,'GBP'),('en_US',0,'English US',NULL,'USD'),('es',0,'Spanish',NULL,'EUR'),('es_ES',0,'Spanish (Spain)',NULL,'EUR'),('es_MX',0,'Spanish (Mexico)',NULL,'MXN'),('fr',0,'French',NULL,'EUR'),('fr_FR',0,'French (France)',NULL,'EUR'),('zh_CN',1,'中国(简体中文)',NULL,'CNY');

/*Table structure for table `blc_media` */

DROP TABLE IF EXISTS `blc_media`;

CREATE TABLE `blc_media` (
  `MEDIA_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `MEDIA_TITLE_INDEX` (`TITLE`),
  KEY `MEDIA_URL_INDEX` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_media` */

insert  into `blc_media`(`MEDIA_ID`,`ALT_TEXT`,`TAGS`,`TITLE`,`URL`) values (99951,'happy乐','happy乐','happy乐','/cmsstatic/category/99951/in_21-11.png'),(100150,'撒欢儿吃','撒欢儿吃','撒欢儿吃','/cmsstatic/category/2002/in_21.png'),(100151,'可劲儿喝','可劲儿喝','可劲儿喝','/cmsstatic/category/2003/in_21-09.png'),(100152,'放开玩儿','放开玩儿','放开玩儿','/cmsstatic/category/2004/in_21-10.png'),(100153,'优惠卡券','优惠卡券','优惠卡券','/cmsstatic/category/10000/in_21-12.png'),(100200,NULL,NULL,NULL,'/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg'),(100301,NULL,NULL,NULL,'/cmsstatic/product/9950/ii_11.png'),(100302,NULL,NULL,NULL,'/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg'),(100303,NULL,NULL,NULL,'/cmsstatic/product/9950/ii_11.png');

/*Table structure for table `blc_module_configuration` */

DROP TABLE IF EXISTS `blc_module_configuration`;

CREATE TABLE `blc_module_configuration` (
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONFIG_TYPE` varchar(255) NOT NULL,
  `IS_DEFAULT` tinyint(1) NOT NULL,
  `MODULE_NAME` varchar(255) NOT NULL,
  `MODULE_PRIORITY` int(11) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_module_configuration` */

insert  into `blc_module_configuration`(`MODULE_CONFIG_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`ARCHIVED`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`CONFIG_TYPE`,`IS_DEFAULT`,`MODULE_NAME`,`MODULE_PRIORITY`) values (-1,NULL,'2016-04-06 15:28:26',NULL,NULL,NULL,NULL,NULL,'SITE_MAP',1,'SITE_MAP',100);

/*Table structure for table `blc_offer` */

DROP TABLE IF EXISTS `blc_offer`;

CREATE TABLE `blc_offer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `APPLIES_WHEN_RULES` longtext,
  `APPLIES_TO_RULES` longtext,
  `APPLY_OFFER_TO_MARKED_ITEMS` tinyint(1) DEFAULT NULL,
  `APPLY_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `AUTOMATICALLY_ADDED` tinyint(1) DEFAULT NULL,
  `COMBINABLE_WITH_OTHER_OFFERS` tinyint(1) DEFAULT NULL,
  `OFFER_DELIVERY_TYPE` varchar(255) DEFAULT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_DISCOUNT_TYPE` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MARKETING_MESSASGE` varchar(255) DEFAULT NULL,
  `MAX_USES_PER_CUSTOMER` bigint(20) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_NAME` varchar(255) NOT NULL,
  `OFFER_ITEM_QUALIFIER_RULE` varchar(255) DEFAULT NULL,
  `OFFER_ITEM_TARGET_RULE` varchar(255) DEFAULT NULL,
  `OFFER_PRIORITY` int(11) DEFAULT NULL,
  `QUALIFYING_ITEM_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `REQUIRES_RELATED_TAR_QUAL` tinyint(1) DEFAULT NULL,
  `STACKABLE` tinyint(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TARGET_SYSTEM` varchar(255) DEFAULT NULL,
  `TOTALITARIAN_OFFER` tinyint(1) DEFAULT NULL,
  `USE_NEW_FORMAT` tinyint(1) DEFAULT NULL,
  `OFFER_TYPE` varchar(255) NOT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_VALUE` decimal(19,5) NOT NULL,
  PRIMARY KEY (`OFFER_ID`),
  KEY `OFFER_DISCOUNT_INDEX` (`OFFER_DISCOUNT_TYPE`),
  KEY `OFFER_MARKETING_MESSAGE_INDEX` (`MARKETING_MESSASGE`),
  KEY `OFFER_NAME_INDEX` (`OFFER_NAME`),
  KEY `OFFER_TYPE_INDEX` (`OFFER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer` */

insert  into `blc_offer`(`OFFER_ID`,`APPLIES_WHEN_RULES`,`APPLIES_TO_RULES`,`APPLY_OFFER_TO_MARKED_ITEMS`,`APPLY_TO_SALE_PRICE`,`ARCHIVED`,`AUTOMATICALLY_ADDED`,`COMBINABLE_WITH_OTHER_OFFERS`,`OFFER_DELIVERY_TYPE`,`OFFER_DESCRIPTION`,`OFFER_DISCOUNT_TYPE`,`END_DATE`,`MARKETING_MESSASGE`,`MAX_USES_PER_CUSTOMER`,`MAX_USES`,`OFFER_NAME`,`OFFER_ITEM_QUALIFIER_RULE`,`OFFER_ITEM_TARGET_RULE`,`OFFER_PRIORITY`,`QUALIFYING_ITEM_MIN_TOTAL`,`REQUIRES_RELATED_TAR_QUAL`,`STACKABLE`,`START_DATE`,`TARGET_SYSTEM`,`TOTALITARIAN_OFFER`,`USE_NEW_FORMAT`,`OFFER_TYPE`,`USES`,`OFFER_VALUE`) values (1,NULL,NULL,0,0,NULL,NULL,1,'AUTOMATIC',NULL,'PERCENT_OFF','2020-01-01 00:00:00',NULL,NULL,0,'Shirts Special',NULL,NULL,10,NULL,NULL,1,'2016-04-06 00:00:00',NULL,NULL,NULL,'ORDER_ITEM',0,'20.00000');

/*Table structure for table `blc_offer_audit` */

DROP TABLE IF EXISTS `blc_offer_audit`;

CREATE TABLE `blc_offer_audit` (
  `OFFER_AUDIT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `OFFER_CODE_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `REDEEMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OFFER_AUDIT_ID`),
  KEY `OFFERAUDIT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `OFFERAUDIT_OFFER_CODE_INDEX` (`OFFER_CODE_ID`),
  KEY `OFFERAUDIT_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERAUDIT_ORDER_INDEX` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_audit` */

/*Table structure for table `blc_offer_code` */

DROP TABLE IF EXISTS `blc_offer_code`;

CREATE TABLE `blc_offer_code` (
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_CODE` varchar(255) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_CODE_ID`),
  KEY `OFFERCODE_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERCODE_CODE_INDEX` (`OFFER_CODE`),
  KEY `FK76B8C8D6D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK76B8C8D6D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_code` */

insert  into `blc_offer_code`(`OFFER_CODE_ID`,`ARCHIVED`,`MAX_USES`,`OFFER_CODE`,`END_DATE`,`START_DATE`,`USES`,`OFFER_ID`) values (950,'N',NULL,'123456',NULL,NULL,0,1);

/*Table structure for table `blc_offer_info` */

DROP TABLE IF EXISTS `blc_offer_info`;

CREATE TABLE `blc_offer_info` (
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_info` */

/*Table structure for table `blc_offer_info_fields` */

DROP TABLE IF EXISTS `blc_offer_info_fields`;

CREATE TABLE `blc_offer_info_fields` (
  `OFFER_INFO_FIELDS_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_FIELDS_ID`,`FIELD_NAME`),
  KEY `FKA901886183AE7237` (`OFFER_INFO_FIELDS_ID`),
  CONSTRAINT `FKA901886183AE7237` FOREIGN KEY (`OFFER_INFO_FIELDS_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_info_fields` */

/*Table structure for table `blc_offer_item_criteria` */

DROP TABLE IF EXISTS `blc_offer_item_criteria`;

CREATE TABLE `blc_offer_item_criteria` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_item_criteria` */

insert  into `blc_offer_item_criteria`(`OFFER_ITEM_CRITERIA_ID`,`ORDER_ITEM_MATCH_RULE`,`QUANTITY`) values (1,'MVEL.eval(\"toUpperCase()\",discreteOrderItem.category.name)==MVEL.eval(\"toUpperCase()\",\"merchandise\")',1);

/*Table structure for table `blc_offer_rule` */

DROP TABLE IF EXISTS `blc_offer_rule`;

CREATE TABLE `blc_offer_rule` (
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_rule` */

/*Table structure for table `blc_offer_rule_map` */

DROP TABLE IF EXISTS `blc_offer_rule_map`;

CREATE TABLE `blc_offer_rule_map` (
  `BLC_OFFER_OFFER_ID` bigint(20) NOT NULL,
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_OFFER_OFFER_ID`,`MAP_KEY`),
  KEY `FKCA468FE2C11A218D` (`OFFER_RULE_ID`),
  KEY `FKCA468FE245C66D1D` (`BLC_OFFER_OFFER_ID`),
  CONSTRAINT `FKCA468FE245C66D1D` FOREIGN KEY (`BLC_OFFER_OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  CONSTRAINT `FKCA468FE2C11A218D` FOREIGN KEY (`OFFER_RULE_ID`) REFERENCES `blc_offer_rule` (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_offer_rule_map` */

/*Table structure for table `blc_order` */

DROP TABLE IF EXISTS `blc_order`;

CREATE TABLE `blc_order` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_NUMBER` varchar(255) DEFAULT NULL,
  `IS_PREVIEW` tinyint(1) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_SUBTOTAL` decimal(19,5) DEFAULT NULL,
  `SUBMIT_DATE` datetime DEFAULT NULL,
  `TAX_OVERRIDE` tinyint(1) DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_SHIPPING` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `ORDER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `ORDER_NAME_INDEX` (`NAME`),
  KEY `ORDER_NUMBER_INDEX` (`ORDER_NUMBER`),
  KEY `ORDER_STATUS_INDEX` (`ORDER_STATUS`),
  KEY `FK8F5B64A83E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK8F5B64A87470F437` (`CUSTOMER_ID`),
  KEY `FK8F5B64A8A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK8F5B64A83E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK8F5B64A87470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK8F5B64A8A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order` */

insert  into `blc_order`(`ORDER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`EMAIL_ADDRESS`,`NAME`,`ORDER_NUMBER`,`IS_PREVIEW`,`ORDER_STATUS`,`ORDER_SUBTOTAL`,`SUBMIT_DATE`,`TAX_OVERRIDE`,`ORDER_TOTAL`,`TOTAL_SHIPPING`,`TOTAL_TAX`,`CURRENCY_CODE`,`CUSTOMER_ID`,`LOCALE_CODE`) values (851,511,'2016-04-20 12:59:39','2016-04-20 13:02:12',511,'scottfield@qq.com',NULL,'20160420125953833851',NULL,'CANCELLED','998.00000','2016-04-20 12:59:54',NULL,'998.00000','0.00000','0.00000','CNY',511,'zh_CN'),(901,511,'2016-04-20 13:34:10','2016-04-20 13:37:14',511,'scottfield@qq.com',NULL,'20160420133420856901',NULL,'CANCELLED','998.00000','2016-04-20 13:34:21',NULL,'998.00000','0.00000','0.00000','CNY',511,'zh_CN'),(902,511,'2016-04-20 13:40:17','2016-04-20 13:40:37',511,'scottfield@qq.com',NULL,'2016042013402337902',NULL,'CANCELLED','499.00000','2016-04-20 13:40:23',NULL,'499.00000','0.00000','0.00000','CNY',511,'zh_CN'),(951,511,'2016-04-20 14:17:34','2016-04-20 14:29:46',511,'scottfield@qq.com',NULL,'201604201417394951',NULL,'CANCELLED','1497.00000','2016-04-20 14:17:39',NULL,'1497.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1001,511,'2016-04-20 14:32:10','2016-04-20 14:35:05',511,'scottfield@qq.com',NULL,'201604201432158591001',NULL,'CANCELLED','499.00000','2016-04-20 14:32:16',NULL,'499.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1002,511,'2016-04-20 14:35:40','2016-04-20 14:36:09',511,'scottfield@qq.com',NULL,'201604201435474531002',NULL,'CANCELLED','998.00000','2016-04-20 14:35:47',NULL,'998.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1003,511,'2016-04-20 14:43:19','2016-04-20 15:08:49',511,'scottfield@qq.com',NULL,'201604201452491431003',NULL,'CANCELLED','3594.00000','2016-04-20 14:52:49',NULL,'3594.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1004,511,'2016-04-20 15:07:38','2016-04-20 15:08:53',511,'scottfield@qq.com',NULL,'201604201507467741004',NULL,'CONSUMED','1497.00000','2016-04-20 15:07:47',NULL,'1497.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1005,511,'2016-04-20 15:37:36','2016-04-20 17:43:03',511,'scottfield@qq.com',NULL,'201604201559347861005',NULL,'CONSUMED','998.00000','2016-04-20 15:59:35',NULL,'998.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1051,511,'2016-04-20 16:14:30','2016-04-20 18:14:43',511,'scottfield@qq.com',NULL,'20160420161446621051',NULL,'CONSUMED','499.00000','2016-04-20 16:14:46',NULL,'499.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1101,511,'2016-04-20 18:04:51','2016-04-20 18:09:40',511,'scottfield@qq.com',NULL,'201604201809404221101',NULL,'UNPAID','499.00000','2016-04-20 18:09:40',NULL,'499.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1151,511,'2016-04-21 10:26:00','2016-04-21 10:26:01',511,'scottfield@qq.com',NULL,NULL,NULL,'IN_PROCESS','998.00000',NULL,NULL,'998.00000','0.00000','0.00000','CNY',511,'zh_CN'),(1201,4100,'2016-04-22 15:54:36','2016-04-22 15:55:16',4100,'default',NULL,'201604221555157331201',NULL,'UNPAID','998.00000','2016-04-22 15:55:16',NULL,'998.00000','0.00000','0.00000','CNY',4100,'zh_CN'),(1251,4300,'2016-04-23 10:21:50','2016-04-23 11:29:08',4300,'default',NULL,NULL,NULL,'IN_PROCESS','0.00000',NULL,NULL,'0.00000','0.00000','0.00000','CNY',4300,'zh_CN');

/*Table structure for table `blc_order_adjustment` */

DROP TABLE IF EXISTS `blc_order_adjustment`;

CREATE TABLE `blc_order_adjustment` (
  `ORDER_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ADJUSTMENT_ID`),
  KEY `ORDERADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `ORDERADJUST_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK1E92D164D5F3FAF4` (`OFFER_ID`),
  KEY `FK1E92D16489FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK1E92D16489FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK1E92D164D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_adjustment` */

/*Table structure for table `blc_order_attribute` */

DROP TABLE IF EXISTS `blc_order_attribute`;

CREATE TABLE `blc_order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FKB3A467A589FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKB3A467A589FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_attribute` */

insert  into `blc_order_attribute`(`ORDER_ATTRIBUTE_ID`,`NAME`,`VALUE`,`ORDER_ID`) values (1,'receiverPhone','18981258',1051),(2,'receiver','dfadfa',1051);

/*Table structure for table `blc_order_item` */

DROP TABLE IF EXISTS `blc_order_item`;

CREATE TABLE `blc_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `DISCOUNTS_ALLOWED` tinyint(1) DEFAULT NULL,
  `ITEM_TAXABLE_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `RETAIL_PRICE_OVERRIDE` tinyint(1) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE_OVERRIDE` tinyint(1) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GIFT_WRAP_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PARENT_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `ORDERITEM_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `ORDERITEM_GIFT_INDEX` (`GIFT_WRAP_ITEM_ID`),
  KEY `ORDERITEM_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERITEM_TYPE_INDEX` (`ORDER_ITEM_TYPE`),
  KEY `ORDERITEM_PARENT_INDEX` (`PARENT_ORDER_ITEM_ID`),
  KEY `ORDERITEM_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FK9A2E704A15D1A13D` (`CATEGORY_ID`),
  KEY `FK9A2E704AFD2F1F10` (`GIFT_WRAP_ITEM_ID`),
  KEY `FK9A2E704A89FE8A02` (`ORDER_ID`),
  KEY `FK9A2E704AB0B0D00A` (`PARENT_ORDER_ITEM_ID`),
  KEY `FK9A2E704A77F565E1` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK9A2E704A15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK9A2E704A77F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK9A2E704A89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK9A2E704AB0B0D00A` FOREIGN KEY (`PARENT_ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9A2E704AFD2F1F10` FOREIGN KEY (`GIFT_WRAP_ITEM_ID`) REFERENCES `blc_giftwrap_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_item` */

insert  into `blc_order_item`(`ORDER_ITEM_ID`,`DISCOUNTS_ALLOWED`,`ITEM_TAXABLE_FLAG`,`NAME`,`ORDER_ITEM_TYPE`,`PRICE`,`QUANTITY`,`RETAIL_PRICE`,`RETAIL_PRICE_OVERRIDE`,`SALE_PRICE`,`SALE_PRICE_OVERRIDE`,`TOTAL_TAX`,`CATEGORY_ID`,`GIFT_WRAP_ITEM_ID`,`ORDER_ID`,`PARENT_ORDER_ITEM_ID`,`PERSONAL_MESSAGE_ID`) values (901,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',2,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,851,NULL,NULL),(951,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',2,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,901,NULL,NULL),(952,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',1,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,902,NULL,NULL),(1001,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',3,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,951,NULL,NULL),(1051,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',1,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1001,NULL,NULL),(1052,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',2,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1002,NULL,NULL),(1053,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',3,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1003,NULL,NULL),(1054,NULL,NULL,'测试产品2','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','699.00000',3,'899.00000',NULL,'699.00000',NULL,NULL,2001,NULL,1003,NULL,NULL),(1055,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',3,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1004,NULL,NULL),(1056,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',2,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1005,NULL,NULL),(1101,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',1,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1051,NULL,NULL),(1151,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',1,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1101,NULL,NULL),(1201,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',2,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1151,NULL,NULL),(1251,NULL,NULL,'测试产品','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','499.00000',2,'699.00000',NULL,'499.00000',NULL,NULL,2001,NULL,1201,NULL,NULL);

/*Table structure for table `blc_order_item_add_attr` */

DROP TABLE IF EXISTS `blc_order_item_add_attr`;

CREATE TABLE `blc_order_item_add_attr` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`,`NAME`),
  KEY `FKA466AB44B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA466AB44B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_item_add_attr` */

/*Table structure for table `blc_order_item_adjustment` */

DROP TABLE IF EXISTS `blc_order_item_adjustment`;

CREATE TABLE `blc_order_item_adjustment` (
  `ORDER_ITEM_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADJUSTMENT_ID`),
  KEY `OIADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `OIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKA2658C82D5F3FAF4` (`OFFER_ID`),
  KEY `FKA2658C829AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA2658C829AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA2658C82D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_item_adjustment` */

/*Table structure for table `blc_order_item_attribute` */

DROP TABLE IF EXISTS `blc_order_item_attribute`;

CREATE TABLE `blc_order_item_attribute` (
  `ORDER_ITEM_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ATTRIBUTE_ID`),
  KEY `FK9F1ED0C79AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9F1ED0C79AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_item_attribute` */

/*Table structure for table `blc_order_item_dtl_adj` */

DROP TABLE IF EXISTS `blc_order_item_dtl_adj`;

CREATE TABLE `blc_order_item_dtl_adj` (
  `ORDER_ITEM_DTL_ADJ_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `OFFER_NAME` varchar(255) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_DTL_ADJ_ID`),
  KEY `FK85F0248FD5F3FAF4` (`OFFER_ID`),
  KEY `FK85F0248FD4AEA2C0` (`ORDER_ITEM_PRICE_DTL_ID`),
  CONSTRAINT `FK85F0248FD4AEA2C0` FOREIGN KEY (`ORDER_ITEM_PRICE_DTL_ID`) REFERENCES `blc_order_item_price_dtl` (`ORDER_ITEM_PRICE_DTL_ID`),
  CONSTRAINT `FK85F0248FD5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_item_dtl_adj` */

/*Table structure for table `blc_order_item_price_dtl` */

DROP TABLE IF EXISTS `blc_order_item_price_dtl`;

CREATE TABLE `blc_order_item_price_dtl` (
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `USE_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_PRICE_DTL_ID`),
  KEY `FK1FB64BF19AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK1FB64BF19AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_item_price_dtl` */

insert  into `blc_order_item_price_dtl`(`ORDER_ITEM_PRICE_DTL_ID`,`QUANTITY`,`USE_SALE_PRICE`,`ORDER_ITEM_ID`) values (901,2,1,901),(951,2,1,951),(952,1,1,952),(1001,3,1,1001),(1051,1,1,1051),(1052,2,1,1052),(1053,3,1,1053),(1054,3,1,1054),(1055,3,1,1055),(1056,2,1,1056),(1101,1,1,1101),(1151,1,1,1151),(1201,2,1,1201),(1251,2,1,1251);

/*Table structure for table `blc_order_multiship_option` */

DROP TABLE IF EXISTS `blc_order_multiship_option`;

CREATE TABLE `blc_order_multiship_option` (
  `ORDER_MULTISHIP_OPTION_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_MULTISHIP_OPTION_ID`),
  KEY `MULTISHIP_OPTION_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKB3D3F7D6C13085DD` (`ADDRESS_ID`),
  KEY `FKB3D3F7D681F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKB3D3F7D689FE8A02` (`ORDER_ID`),
  KEY `FKB3D3F7D69AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKB3D3F7D681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB3D3F7D689FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FKB3D3F7D69AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKB3D3F7D6C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_multiship_option` */

/*Table structure for table `blc_order_offer_code_xref` */

DROP TABLE IF EXISTS `blc_order_offer_code_xref`;

CREATE TABLE `blc_order_offer_code_xref` (
  `ORDER_ID` bigint(20) NOT NULL,
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  KEY `FKFDF0E8533BB10F6D` (`OFFER_CODE_ID`),
  KEY `FKFDF0E85389FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKFDF0E8533BB10F6D` FOREIGN KEY (`OFFER_CODE_ID`) REFERENCES `blc_offer_code` (`OFFER_CODE_ID`),
  CONSTRAINT `FKFDF0E85389FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_offer_code_xref` */

/*Table structure for table `blc_order_payment` */

DROP TABLE IF EXISTS `blc_order_payment`;

CREATE TABLE `blc_order_payment` (
  `ORDER_PAYMENT_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `GATEWAY_TYPE` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_PAYMENT_ID`),
  KEY `ORDERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `ORDERPAYMENT_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERPAYMENT_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `ORDERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  KEY `FK9517A14FC13085DD` (`ADDRESS_ID`),
  KEY `FK9517A14F89FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK9517A14F89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK9517A14FC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_payment` */

/*Table structure for table `blc_order_payment_transaction` */

DROP TABLE IF EXISTS `blc_order_payment_transaction`;

CREATE TABLE `blc_order_payment_transaction` (
  `PAYMENT_TRANSACTION_ID` bigint(20) NOT NULL,
  `TRANSACTION_AMOUNT` decimal(19,2) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CUSTOMER_IP_ADDRESS` varchar(255) DEFAULT NULL,
  `DATE_RECORDED` datetime DEFAULT NULL,
  `RAW_RESPONSE` longtext,
  `SUCCESS` tinyint(1) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_PAYMENT` bigint(20) NOT NULL,
  `PARENT_TRANSACTION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_TRANSACTION_ID`),
  KEY `FK86FDE7CE6A69DD9D` (`ORDER_PAYMENT`),
  KEY `FK86FDE7CEE1B66C71` (`PARENT_TRANSACTION`),
  CONSTRAINT `FK86FDE7CE6A69DD9D` FOREIGN KEY (`ORDER_PAYMENT`) REFERENCES `blc_order_payment` (`ORDER_PAYMENT_ID`),
  CONSTRAINT `FK86FDE7CEE1B66C71` FOREIGN KEY (`PARENT_TRANSACTION`) REFERENCES `blc_order_payment_transaction` (`PAYMENT_TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_order_payment_transaction` */

/*Table structure for table `blc_page` */

DROP TABLE IF EXISTS `blc_page`;

CREATE TABLE `blc_page` (
  `PAGE_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXCLUDE_FROM_SITE_MAP` tinyint(1) DEFAULT NULL,
  `FULL_URL` varchar(255) DEFAULT NULL,
  `OFFLINE_FLAG` tinyint(1) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `PAGE_FULL_URL_INDEX` (`FULL_URL`),
  KEY `FKF41BEDD5D49D3961` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FKF41BEDD5D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page` */

insert  into `blc_page`(`PAGE_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`DESCRIPTION`,`EXCLUDE_FROM_SITE_MAP`,`FULL_URL`,`OFFLINE_FLAG`,`PRIORITY`,`PAGE_TMPLT_ID`) values (1,NULL,NULL,NULL,NULL,'About Us',NULL,'/about_us',NULL,NULL,1),(2,NULL,NULL,NULL,NULL,'FAQ',NULL,'/faq',NULL,NULL,1),(3,NULL,NULL,NULL,NULL,'New to Hot Sauce',NULL,'/new-to-hot-sauce',NULL,NULL,1),(10,NULL,NULL,NULL,NULL,'Prueba de Contenido',NULL,'/about_us',NULL,NULL,2),(11,NULL,NULL,NULL,NULL,'FAQ',NULL,'/faq',NULL,NULL,2),(13,NULL,NULL,NULL,NULL,'New to Hot Sauce',NULL,'/new-to-hot-sauce',NULL,NULL,2);

/*Table structure for table `blc_page_fld` */

DROP TABLE IF EXISTS `blc_page_fld`;

CREATE TABLE `blc_page_fld` (
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PAGE_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page_fld` */

insert  into `blc_page_fld`(`PAGE_FLD_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`FLD_KEY`,`LOB_VALUE`,`VALUE`) values (1,NULL,NULL,NULL,NULL,'body',NULL,'test content'),(2,NULL,NULL,NULL,NULL,'title',NULL,''),(3,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2><h4 style=\"text-align:center;\"><a href=\"http://www.broadleafcommerce.com/features/content\">Click Here</a> to see more about Content Management in Broadleaf.</h4>'),(4,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2>'),(10,NULL,NULL,NULL,NULL,'body',NULL,'prueba de contenido'),(11,NULL,NULL,NULL,NULL,'title',NULL,'Espa&ntilde;ol G&eacute;nerico'),(12,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2><h4 style=\"text-align:center;\">Haga <a href=\"http://www.broadleafcommerce.com/features/content\">click aqu&iacute;</a> para mas informaci&oacute;n.</h4>'),(13,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2>');

/*Table structure for table `blc_page_fld_map` */

DROP TABLE IF EXISTS `blc_page_fld_map`;

CREATE TABLE `blc_page_fld_map` (
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`MAP_KEY`),
  KEY `FKE9EE09515AEDD08A` (`PAGE_FLD_ID`),
  KEY `FKE9EE0951883C2667` (`PAGE_ID`),
  CONSTRAINT `FKE9EE09515AEDD08A` FOREIGN KEY (`PAGE_FLD_ID`) REFERENCES `blc_page_fld` (`PAGE_FLD_ID`),
  CONSTRAINT `FKE9EE0951883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page_fld_map` */

insert  into `blc_page_fld_map`(`PAGE_ID`,`PAGE_FLD_ID`,`MAP_KEY`) values (1,1,'body'),(1,2,'title'),(2,3,'body'),(3,4,'body'),(10,10,'body'),(10,11,'title'),(11,12,'body'),(13,13,'body');

/*Table structure for table `blc_page_item_criteria` */

DROP TABLE IF EXISTS `blc_page_item_criteria`;

CREATE TABLE `blc_page_item_criteria` (
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page_item_criteria` */

/*Table structure for table `blc_page_rule` */

DROP TABLE IF EXISTS `blc_page_rule`;

CREATE TABLE `blc_page_rule` (
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page_rule` */

/*Table structure for table `blc_page_rule_map` */

DROP TABLE IF EXISTS `blc_page_rule_map`;

CREATE TABLE `blc_page_rule_map` (
  `BLC_PAGE_PAGE_ID` bigint(20) NOT NULL,
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_PAGE_PAGE_ID`,`MAP_KEY`),
  KEY `FK1ABA0CA336D91846` (`PAGE_RULE_ID`),
  KEY `FK1ABA0CA3C38455DD` (`BLC_PAGE_PAGE_ID`),
  CONSTRAINT `FK1ABA0CA336D91846` FOREIGN KEY (`PAGE_RULE_ID`) REFERENCES `blc_page_rule` (`PAGE_RULE_ID`),
  CONSTRAINT `FK1ABA0CA3C38455DD` FOREIGN KEY (`BLC_PAGE_PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page_rule_map` */

/*Table structure for table `blc_page_tmplt` */

DROP TABLE IF EXISTS `blc_page_tmplt`;

CREATE TABLE `blc_page_tmplt` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `TMPLT_DESCR` varchar(255) DEFAULT NULL,
  `TMPLT_NAME` varchar(255) DEFAULT NULL,
  `TMPLT_PATH` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`),
  KEY `FK325C9D5A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK325C9D5A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_page_tmplt` */

insert  into `blc_page_tmplt`(`PAGE_TMPLT_ID`,`TMPLT_DESCR`,`TMPLT_NAME`,`TMPLT_PATH`,`LOCALE_CODE`) values (-3,'Outputs the body field.','NONE','NONE',NULL),(1,'Provides a basic layout with header and footer surrounding the content and title.','Default Template','/content/default',NULL),(2,'This template provides a basic layout with header and footer surrounding the content and title.','Basic Spanish Template','/content/default','es');

/*Table structure for table `blc_payment_log` */

DROP TABLE IF EXISTS `blc_payment_log`;

CREATE TABLE `blc_payment_log` (
  `PAYMENT_LOG_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `EXCEPTION_MESSAGE` varchar(255) DEFAULT NULL,
  `LOG_TYPE` varchar(255) NOT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `ORDER_PAYMENT_REF_NUM` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` tinyint(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_LOG_ID`),
  KEY `PAYMENTLOG_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYMENTLOG_LOGTYPE_INDEX` (`LOG_TYPE`),
  KEY `PAYMENTLOG_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYMENTLOG_REFERENCE_INDEX` (`ORDER_PAYMENT_REF_NUM`),
  KEY `PAYMENTLOG_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `PAYMENTLOG_USER_INDEX` (`USER_NAME`),
  KEY `FKA43703453E2FC4F9` (`CURRENCY_CODE`),
  KEY `FKA43703457470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKA43703453E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FKA43703457470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_payment_log` */

/*Table structure for table `blc_personal_message` */

DROP TABLE IF EXISTS `blc_personal_message`;

CREATE TABLE `blc_personal_message` (
  `PERSONAL_MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) DEFAULT NULL,
  `MESSAGE_TO` varchar(255) DEFAULT NULL,
  `OCCASION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_personal_message` */

/*Table structure for table `blc_pgtmplt_fldgrp_xref` */

DROP TABLE IF EXISTS `blc_pgtmplt_fldgrp_xref`;

CREATE TABLE `blc_pgtmplt_fldgrp_xref` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK99D625F66A79BDB5` (`FLD_GROUP_ID`),
  KEY `FK99D625F6D49D3961` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FK99D625F66A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK99D625F6D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_pgtmplt_fldgrp_xref` */

insert  into `blc_pgtmplt_fldgrp_xref`(`PAGE_TMPLT_ID`,`FLD_GROUP_ID`,`GROUP_ORDER`) values (-3,-3,0),(1,1,0),(2,1,0);

/*Table structure for table `blc_phone` */

DROP TABLE IF EXISTS `blc_phone`;

CREATE TABLE `blc_phone` (
  `PHONE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_phone` */

insert  into `blc_phone`(`PHONE_ID`,`IS_ACTIVE`,`IS_DEFAULT`,`PHONE_NUMBER`) values (1,1,0,'fda'),(2,1,0,'fda'),(51,1,0,'fda'),(52,1,0,'da'),(101,1,0,'fda'),(102,1,0,'fda'),(151,1,0,'18981286003'),(152,1,0,'18981286003'),(153,1,0,'dfa'),(154,1,0,'fda'),(155,1,0,'fda'),(252,1,0,'18981286003'),(301,1,0,'dfadfafda'),(302,1,0,'18981286003'),(303,1,0,'18985546658'),(304,1,0,'18985546658'),(305,1,0,'125445854458'),(306,1,0,'18981286003'),(307,1,0,'18981286003'),(308,1,0,'5454545'),(309,1,0,'5454545'),(310,1,0,'8785454'),(311,1,0,'8785454'),(351,1,0,'21125452245'),(401,1,0,'1215454511215'),(402,1,0,'11455254'),(403,1,0,'2222'),(404,1,0,'77884458'),(451,1,0,'18981286003');

/*Table structure for table `blc_product` */

DROP TABLE IF EXISTS `blc_product`;

CREATE TABLE `blc_product` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CAN_SELL_WITHOUT_OPTIONS` tinyint(1) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `IS_FEATURED_PRODUCT` tinyint(1) NOT NULL,
  `MANUFACTURE` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEFAULT_SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY_INDEX` (`DEFAULT_CATEGORY_ID`),
  KEY `PRODUCT_URL_INDEX` (`URL`,`URL_KEY`),
  KEY `FK5B95B7C9DF057C3F` (`DEFAULT_CATEGORY_ID`),
  KEY `FK5B95B7C96D386535` (`DEFAULT_SKU_ID`),
  CONSTRAINT `FK5B95B7C96D386535` FOREIGN KEY (`DEFAULT_SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FK5B95B7C9DF057C3F` FOREIGN KEY (`DEFAULT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product` */

insert  into `blc_product`(`PRODUCT_ID`,`ARCHIVED`,`CAN_SELL_WITHOUT_OPTIONS`,`DISPLAY_TEMPLATE`,`IS_FEATURED_PRODUCT`,`MANUFACTURE`,`MODEL`,`URL`,`URL_KEY`,`DEFAULT_CATEGORY_ID`,`DEFAULT_SKU_ID`) values (1,'Y',NULL,NULL,1,'Blair\'s',NULL,'/hot-sauces/sudden_death_sauce',NULL,2002,NULL),(2,'Y',NULL,NULL,0,'Blair\'s',NULL,'/hot-sauces/sweet_death_sauce',NULL,2002,NULL),(3,'Y',NULL,NULL,0,'Salsa Express',NULL,'/hot-sauces/hoppin_hot_sauce',NULL,2002,NULL),(4,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,2002,NULL),(5,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,2002,NULL),(6,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,2002,NULL),(7,'Y',NULL,NULL,0,'Garden Row',NULL,'/hot-sauces/green_ghost',NULL,2002,NULL),(8,'Y',NULL,NULL,0,'D. L. Jardine\'s',NULL,'/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,2002,NULL),(9,'Y',NULL,NULL,1,'Figueroa Brothers',NULL,'/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,2002,NULL),(10,'Y',NULL,NULL,0,'Figueroa Brothers',NULL,'/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,2002,NULL),(11,'Y',NULL,NULL,0,'Brazos Legends',NULL,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,2002,NULL),(12,'Y',NULL,NULL,0,'Garden Row',NULL,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,2002,NULL),(13,'Y',NULL,NULL,1,'Brazos Legends',NULL,'/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,2002,NULL),(14,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,2002,NULL),(15,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_garlic_hot_sauce',NULL,2002,NULL),(16,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/scotch_bonnet_hot_sauce',NULL,2002,NULL),(17,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/insanity_sauce',NULL,2002,NULL),(18,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,2002,NULL),(19,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,2002,NULL),(100,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,2003,NULL),(200,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,2003,NULL),(300,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,2003,NULL),(400,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,2003,NULL),(500,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_mens',NULL,2003,NULL),(600,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_womens',NULL,2003,NULL),(992,'Y',0,NULL,0,NULL,NULL,'/bundle1',NULL,NULL,NULL),(993,'Y',0,NULL,0,NULL,NULL,'/bundle2',NULL,NULL,NULL),(9950,'Y',0,NULL,1,'香奈儿',NULL,'/chanel',NULL,9950,NULL),(10000,'Y',0,NULL,0,'美即',NULL,'/product-meiji-facialmask',NULL,2001,NULL),(10001,'Y',0,NULL,0,NULL,NULL,'/product-cleanclear-mask',NULL,2001,NULL),(10002,'Y',0,NULL,0,NULL,NULL,'/product-facial-mask',NULL,2001,NULL),(10050,'Y',0,NULL,0,NULL,NULL,'/product-custom',NULL,2001,NULL),(10100,'Y',0,NULL,0,NULL,NULL,'/dfddd',NULL,2001,NULL),(10101,'N',0,NULL,0,NULL,NULL,'/test',NULL,2001,10201),(10102,'N',0,NULL,0,NULL,NULL,'/test2',NULL,2001,10202),(10103,'N',0,NULL,0,NULL,NULL,'/test3',NULL,2001,10203);

/*Table structure for table `blc_product_attribute` */

DROP TABLE IF EXISTS `blc_product_attribute`;

CREATE TABLE `blc_product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  KEY `PRODUCTATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `PRODUCTATTRIBUTE_INDEX` (`PRODUCT_ID`),
  KEY `FK56CE05865F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK56CE05865F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_attribute` */

insert  into `blc_product_attribute`(`PRODUCT_ATTRIBUTE_ID`,`NAME`,`SEARCHABLE`,`VALUE`,`PRODUCT_ID`) values (1101,'规格',0,'100mlx3',10101);

/*Table structure for table `blc_product_bundle` */

DROP TABLE IF EXISTS `blc_product_bundle`;

CREATE TABLE `blc_product_bundle` (
  `AUTO_BUNDLE` tinyint(1) DEFAULT NULL,
  `BUNDLE_PROMOTABLE` tinyint(1) DEFAULT NULL,
  `ITEMS_PROMOTABLE` tinyint(1) DEFAULT NULL,
  `PRICING_MODEL` varchar(255) DEFAULT NULL,
  `BUNDLE_PRIORITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FK8CC5B85F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK8CC5B85F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_bundle` */

/*Table structure for table `blc_product_cross_sale` */

DROP TABLE IF EXISTS `blc_product_cross_sale`;

CREATE TABLE `blc_product_cross_sale` (
  `CROSS_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CROSS_SALE_PRODUCT_ID`),
  KEY `CROSSSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `CROSSSALE_INDEX` (`PRODUCT_ID`),
  KEY `CROSSSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C15D1A13D` (`CATEGORY_ID`),
  KEY `FK8324FB3C5F11A0B7` (`PRODUCT_ID`),
  KEY `FK8324FB3C62D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK8324FB3C5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C62D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_cross_sale` */

/*Table structure for table `blc_product_featured` */

DROP TABLE IF EXISTS `blc_product_featured`;

CREATE TABLE `blc_product_featured` (
  `FEATURED_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURED_PRODUCT_ID`),
  KEY `PRODFEATURED_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `PRODFEATURED_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `FK4C49FFE415D1A13D` (`CATEGORY_ID`),
  KEY `FK4C49FFE45F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK4C49FFE415D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK4C49FFE45F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_featured` */

insert  into `blc_product_featured`(`FEATURED_PRODUCT_ID`,`PROMOTION_MESSAGE`,`SEQUENCE`,`CATEGORY_ID`,`PRODUCT_ID`) values (1,NULL,'1.000000',1,18),(2,NULL,'2.000000',1,15),(3,NULL,'3.000000',1,200),(4,NULL,'4.000000',1,100),(5,NULL,'1.000000',2003,4),(8,NULL,'1.000000',2002,500),(9,NULL,'2.000000',2002,200),(10,NULL,'3.000000',2002,300),(950,'热卖品','0.000000',2001,9950);

/*Table structure for table `blc_product_option` */

DROP TABLE IF EXISTS `blc_product_option`;

CREATE TABLE `blc_product_option` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ERROR_CODE` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALIDATION_STRATEGY_TYPE` varchar(255) DEFAULT NULL,
  `VALIDATION_TYPE` varchar(255) DEFAULT NULL,
  `REQUIRED` tinyint(1) DEFAULT NULL,
  `OPTION_TYPE` varchar(255) DEFAULT NULL,
  `USE_IN_SKU_GENERATION` tinyint(1) DEFAULT NULL,
  `VALIDATION_STRING` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_option` */

insert  into `blc_product_option`(`PRODUCT_OPTION_ID`,`ATTRIBUTE_NAME`,`DISPLAY_ORDER`,`ERROR_CODE`,`ERROR_MESSAGE`,`LABEL`,`VALIDATION_STRATEGY_TYPE`,`VALIDATION_TYPE`,`REQUIRED`,`OPTION_TYPE`,`USE_IN_SKU_GENERATION`,`VALIDATION_STRING`) values (1,'COLOR',NULL,NULL,NULL,'Shirt Color',NULL,NULL,1,'COLOR',NULL,NULL),(2,'SIZE',NULL,NULL,NULL,'Shirt Size',NULL,NULL,1,'SIZE',NULL,NULL),(3,'NAME',NULL,'INVALID_NAME','Name must be less than 30 characters, with only letters and spaces','Personalized Name',NULL,'REGEX',0,'TEXT',0,'[a-zA-Z ]{3,30}'),(950,'香水容量',1,NULL,NULL,'容量',NULL,NULL,1,'INTEGER',1,NULL);

/*Table structure for table `blc_product_option_value` */

DROP TABLE IF EXISTS `blc_product_option_value`;

CREATE TABLE `blc_product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `PRICE_ADJUSTMENT` decimal(19,5) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK6DEEEDBD92EA8136` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK6DEEEDBD92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_option_value` */

insert  into `blc_product_option_value`(`PRODUCT_OPTION_VALUE_ID`,`ATTRIBUTE_VALUE`,`DISPLAY_ORDER`,`PRICE_ADJUSTMENT`,`PRODUCT_OPTION_ID`) values (1,'Black',1,NULL,1),(2,'Red',2,NULL,1),(3,'Silver',3,NULL,1),(11,'S',1,NULL,2),(12,'M',2,NULL,2),(13,'L',3,NULL,2),(14,'XL',4,NULL,2),(950,'5ml',1,NULL,950),(951,'10ml',2,NULL,950);

/*Table structure for table `blc_product_option_xref` */

DROP TABLE IF EXISTS `blc_product_option_xref`;

CREATE TABLE `blc_product_option_xref` (
  `PRODUCT_OPTION_XREF_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_XREF_ID`),
  KEY `FKDA42AB2F5F11A0B7` (`PRODUCT_ID`),
  KEY `FKDA42AB2F92EA8136` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FKDA42AB2F5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKDA42AB2F92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_option_xref` */

insert  into `blc_product_option_xref`(`PRODUCT_OPTION_XREF_ID`,`PRODUCT_ID`,`PRODUCT_OPTION_ID`) values (1,100,1),(2,200,1),(3,300,1),(4,400,1),(5,500,1),(6,600,1),(7,100,2),(8,200,2),(9,300,2),(10,400,2),(11,500,2),(12,600,2),(13,100,3),(951,9950,950),(952,17,950),(953,17,2),(1050,10000,950);

/*Table structure for table `blc_product_sku_xref` */

DROP TABLE IF EXISTS `blc_product_sku_xref`;

CREATE TABLE `blc_product_sku_xref` (
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `FKF2DBF6D35F11A0B7` (`PRODUCT_ID`),
  KEY `FKF2DBF6D3B78C9977` (`SKU_ID`),
  CONSTRAINT `FKF2DBF6D35F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKF2DBF6D3B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_sku_xref` */

insert  into `blc_product_sku_xref`(`PRODUCT_ID`,`SKU_ID`) values (100,111),(100,112),(100,113),(100,114),(100,121),(100,122),(100,123),(100,124),(100,131),(100,132),(100,133),(100,134),(200,211),(200,212),(200,213),(200,214),(200,221),(200,222),(200,223),(200,224),(200,231),(200,232),(200,233),(200,234),(300,311),(300,312),(300,313),(300,314),(300,321),(300,322),(300,323),(300,324),(300,331),(300,332),(300,333),(300,334),(400,411),(400,412),(400,413),(400,414),(400,421),(400,422),(400,423),(400,424),(400,431),(400,432),(400,433),(400,434),(500,511),(500,512),(500,513),(500,514),(500,521),(500,522),(500,523),(500,524),(500,531),(500,532),(500,533),(500,534),(600,611),(600,612),(600,613),(600,614),(600,621),(600,622),(600,623),(600,624),(600,631),(600,632),(600,633),(600,634),(9950,10001),(9950,10002),(10000,10100);

/*Table structure for table `blc_product_up_sale` */

DROP TABLE IF EXISTS `blc_product_up_sale`;

CREATE TABLE `blc_product_up_sale` (
  `UP_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_SALE_PRODUCT_ID`),
  KEY `UPSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `UPSALE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `UPSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FKF69054F515D1A13D` (`CATEGORY_ID`),
  KEY `FKF69054F55F11A0B7` (`PRODUCT_ID`),
  KEY `FKF69054F562D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  CONSTRAINT `FKF69054F515D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FKF69054F55F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKF69054F562D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_product_up_sale` */

/*Table structure for table `blc_qual_crit_offer_xref` */

DROP TABLE IF EXISTS `blc_qual_crit_offer_xref`;

CREATE TABLE `blc_qual_crit_offer_xref` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_D592E919E7AB0252` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FKD592E9193615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FKD592E919D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FKD592E9193615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E919D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_qual_crit_offer_xref` */

/*Table structure for table `blc_qual_crit_page_xref` */

DROP TABLE IF EXISTS `blc_qual_crit_page_xref`;

CREATE TABLE `blc_qual_crit_page_xref` (
  `PAGE_ID` bigint(20) NOT NULL DEFAULT '0',
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`PAGE_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_874BE5902B6BC67F` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590883C2667` (`PAGE_ID`),
  KEY `FK874BE590378418CD` (`PAGE_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK874BE590378418CD` FOREIGN KEY (`PAGE_ITEM_CRITERIA_ID`) REFERENCES `blc_page_item_criteria` (`PAGE_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK874BE590883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_qual_crit_page_xref` */

/*Table structure for table `blc_qual_crit_sc_xref` */

DROP TABLE IF EXISTS `blc_qual_crit_sc_xref`;

CREATE TABLE `blc_qual_crit_sc_xref` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SC_ID`,`SC_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_C4A353AFFF06F4DE` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF13D95585` (`SC_ID`),
  KEY `FKC4A353AF85C77F2B` (`SC_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKC4A353AF13D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FKC4A353AF85C77F2B` FOREIGN KEY (`SC_ITEM_CRITERIA_ID`) REFERENCES `blc_sc_item_criteria` (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_qual_crit_sc_xref` */

/*Table structure for table `blc_rating_detail` */

DROP TABLE IF EXISTS `blc_rating_detail`;

CREATE TABLE `blc_rating_detail` (
  `RATING_DETAIL_ID` bigint(20) NOT NULL,
  `RATING` double NOT NULL,
  `RATING_SUBMITTED_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RATING_DETAIL_ID`),
  KEY `RATING_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `FKC9D04AD7470F437` (`CUSTOMER_ID`),
  KEY `FKC9D04ADD4E76BF4` (`RATING_SUMMARY_ID`),
  CONSTRAINT `FKC9D04AD7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKC9D04ADD4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_rating_detail` */

/*Table structure for table `blc_rating_summary` */

DROP TABLE IF EXISTS `blc_rating_summary`;

CREATE TABLE `blc_rating_summary` (
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  `AVERAGE_RATING` double NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `RATING_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`RATING_SUMMARY_ID`),
  KEY `RATINGSUMM_ITEM_INDEX` (`ITEM_ID`),
  KEY `RATINGSUMM_TYPE_INDEX` (`RATING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_rating_summary` */

/*Table structure for table `blc_review_detail` */

DROP TABLE IF EXISTS `blc_review_detail`;

CREATE TABLE `blc_review_detail` (
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  `HELPFUL_COUNT` int(11) NOT NULL,
  `NOT_HELPFUL_COUNT` int(11) NOT NULL,
  `REVIEW_SUBMITTED_DATE` datetime NOT NULL,
  `REVIEW_STATUS` varchar(255) NOT NULL,
  `REVIEW_TEXT` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_DETAIL_ID` bigint(20) DEFAULT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_ID`),
  KEY `REVIEWDETAIL_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWDETAIL_RATING_INDEX` (`RATING_DETAIL_ID`),
  KEY `REVIEWDETAIL_SUMMARY_INDEX` (`RATING_SUMMARY_ID`),
  KEY `REVIEWDETAIL_STATUS_INDEX` (`REVIEW_STATUS`),
  KEY `FK9CD7E6927470F437` (`CUSTOMER_ID`),
  KEY `FK9CD7E69245DC39E0` (`RATING_DETAIL_ID`),
  KEY `FK9CD7E692D4E76BF4` (`RATING_SUMMARY_ID`),
  CONSTRAINT `FK9CD7E69245DC39E0` FOREIGN KEY (`RATING_DETAIL_ID`) REFERENCES `blc_rating_detail` (`RATING_DETAIL_ID`),
  CONSTRAINT `FK9CD7E6927470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK9CD7E692D4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_review_detail` */

/*Table structure for table `blc_review_feedback` */

DROP TABLE IF EXISTS `blc_review_feedback`;

CREATE TABLE `blc_review_feedback` (
  `REVIEW_FEEDBACK_ID` bigint(20) NOT NULL,
  `IS_HELPFUL` tinyint(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_FEEDBACK_ID`),
  KEY `REVIEWFEED_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWFEED_DETAIL_INDEX` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC929867470F437` (`CUSTOMER_ID`),
  KEY `FK7CC92986AE4769D6` (`REVIEW_DETAIL_ID`),
  CONSTRAINT `FK7CC929867470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK7CC92986AE4769D6` FOREIGN KEY (`REVIEW_DETAIL_ID`) REFERENCES `blc_review_detail` (`REVIEW_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_review_feedback` */

/*Table structure for table `blc_role` */

DROP TABLE IF EXISTS `blc_role`;

CREATE TABLE `blc_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `ROLE_NAME_INDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_role` */

insert  into `blc_role`(`ROLE_ID`,`ROLE_NAME`) values (1,'ROLE_USER');

/*Table structure for table `blc_sandbox` */

DROP TABLE IF EXISTS `blc_sandbox`;

CREATE TABLE `blc_sandbox` (
  `SANDBOX_ID` bigint(20) NOT NULL,
  `AUTHOR` bigint(20) DEFAULT NULL,
  `COLOR` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GO_LIVE_DATE` datetime DEFAULT NULL,
  `SANDBOX_NAME` varchar(255) DEFAULT NULL,
  `SANDBOX_TYPE` varchar(255) DEFAULT NULL,
  `PARENT_SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `SANDBOX_NAME_INDEX` (`SANDBOX_NAME`),
  KEY `FKDD37A9A174160452` (`PARENT_SANDBOX_ID`),
  CONSTRAINT `FKDD37A9A174160452` FOREIGN KEY (`PARENT_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sandbox` */

insert  into `blc_sandbox`(`SANDBOX_ID`,`AUTHOR`,`COLOR`,`DESCRIPTION`,`GO_LIVE_DATE`,`SANDBOX_NAME`,`SANDBOX_TYPE`,`PARENT_SANDBOX_ID`) values (1,NULL,'#0B9098',NULL,NULL,'Default','DEFAULT',NULL),(2,-1,NULL,NULL,NULL,'Default','USER',1),(51,1,NULL,NULL,NULL,'Default','USER',1);

/*Table structure for table `blc_sandbox_mgmt` */

DROP TABLE IF EXISTS `blc_sandbox_mgmt`;

CREATE TABLE `blc_sandbox_mgmt` (
  `SANDBOX_MGMT_ID` bigint(20) NOT NULL,
  `SANDBOX_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SANDBOX_MGMT_ID`),
  UNIQUE KEY `UK_4845009FE52B6993` (`SANDBOX_ID`),
  KEY `FK4845009F579FE59D` (`SANDBOX_ID`),
  CONSTRAINT `FK4845009F579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sandbox_mgmt` */

insert  into `blc_sandbox_mgmt`(`SANDBOX_MGMT_ID`,`SANDBOX_ID`) values (1,1),(2,2),(51,51);

/*Table structure for table `blc_sc` */

DROP TABLE IF EXISTS `blc_sc`;

CREATE TABLE `blc_sc` (
  `SC_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `OFFLINE_FLAG` tinyint(1) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `LOCALE_CODE` varchar(255) NOT NULL,
  `SC_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `CONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `SC_OFFLN_FLG_INDX` (`OFFLINE_FLAG`),
  KEY `CONTENT_PRIORITY_INDEX` (`PRIORITY`),
  KEY `FK74EEB716A1E1C128` (`LOCALE_CODE`),
  KEY `FK74EEB71671EBFA46` (`SC_TYPE_ID`),
  CONSTRAINT `FK74EEB71671EBFA46` FOREIGN KEY (`SC_TYPE_ID`) REFERENCES `blc_sc_type` (`SC_TYPE_ID`),
  CONSTRAINT `FK74EEB716A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc` */

insert  into `blc_sc`(`SC_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`CONTENT_NAME`,`OFFLINE_FLAG`,`PRIORITY`,`LOCALE_CODE`,`SC_TYPE_ID`) values (100,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Buy One Get One - Twice the Burn',0,5,'en',1),(101,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Shirt Special - 20% off all shirts',0,1,'en',1),(102,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Member Special - $10 off next order over $50',0,5,'en',1),(110,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Home Page Snippet - Aficionado',0,5,'en',2),(130,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Home Page Featured Products Title',0,5,'en',3),(140,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'RHS - The Essentials Collection',0,5,'en',4),(151,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Promocion - 20% de descuento en todas las camisas',0,1,'es',1),(152,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Promocion - 20% de descuento en todas las camisas',0,1,'fr',1),(153,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Home Page Snippet (es) - Aficionado',0,5,'es',2),(154,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Home Page Snippet (es) - Aficionado',0,5,'fr',2),(155,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Home Page Featured Products Title',0,5,'es',3),(156,1,'2016-04-06 15:28:26','2016-04-06 15:28:26',1,'Home Page Featured Products Title',0,5,'fr',3);

/*Table structure for table `blc_sc_fld` */

DROP TABLE IF EXISTS `blc_sc_fld`;

CREATE TABLE `blc_sc_fld` (
  `SC_FLD_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_fld` */

insert  into `blc_sc_fld`(`SC_FLD_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`FLD_KEY`,`LOB_VALUE`,`VALUE`) values (1,1,'2016-04-06 15:28:26',NULL,NULL,'imageUrl',NULL,'/img/banners/buy-one-get-one-home-banner.jpg'),(2,1,'2016-04-06 15:28:26',NULL,NULL,'targetUrl',NULL,'/hot-sauces'),(3,1,'2016-04-06 15:28:26',NULL,NULL,'imageUrl',NULL,'/img/banners/shirt-special.jpg'),(4,1,'2016-04-06 15:28:26',NULL,NULL,'targetUrl',NULL,'/merchandise'),(5,1,'2016-04-06 15:28:26',NULL,NULL,'imageUrl',NULL,'/img/banners/member-special.jpg'),(6,1,'2016-04-06 15:28:26',NULL,NULL,'targetUrl',NULL,'/register'),(9,1,'2016-04-06 15:28:26',NULL,NULL,'htmlContent',NULL,'<h2>HOT SAUCE AFICIONADO?</h2> Click to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.'),(11,1,'2016-04-06 15:28:26',NULL,NULL,'messageText',NULL,'The Heat Clinic\'s Top Selling Sauces'),(12,1,'2016-04-06 15:28:26',NULL,NULL,'imageUrl',NULL,'/img/rhs-ad.jpg'),(13,1,'2016-04-06 15:28:26',NULL,NULL,'targetUrl',NULL,'/hot-sauces'),(51,1,'2016-04-06 15:28:26',NULL,NULL,'imageUrl',NULL,'/img/banners/promocion-camisas.jpg'),(52,1,'2016-04-06 15:28:26',NULL,NULL,'targetUrl',NULL,'/merchandise'),(53,1,'2016-04-06 15:28:26',NULL,NULL,'imageUrl',NULL,'/img/banners/shirts-speciale.jpg'),(54,1,'2016-04-06 15:28:26',NULL,NULL,'targetUrl',NULL,'/merchandise'),(55,1,'2016-04-06 15:28:26',NULL,NULL,'htmlContent',NULL,'<h2>AFICIONADO DE SALSAS PICANTES?</h2> Haga click para unirse a nuerto programa de Cuidades Intensivos de Heat Clinic. El lugar para conseguir las mejores ofertas.'),(56,1,'2016-04-06 15:28:26',NULL,NULL,'htmlContent',NULL,'<h2>AFICIONADO SAUCE PIQUANTE?</h2> Cliquez ici pour vous joindre &agrave; notre clinique de chaleur du Programme de soins fr&eacute;quents. L&#39;endroit pour obtenir toutes les offres sur le traitement des br&ucirc;lures.'),(57,1,'2016-04-06 15:28:26',NULL,NULL,'messageText',NULL,'Las Salsas M&aacute;s vendidas de Heat Clinic'),(58,1,'2016-04-06 15:28:26',NULL,NULL,'messageText',NULL,'La Clinique Heat Sauces Meilleures Ventes');

/*Table structure for table `blc_sc_fld_map` */

DROP TABLE IF EXISTS `blc_sc_fld_map`;

CREATE TABLE `blc_sc_fld_map` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`SC_ID`,`MAP_KEY`),
  KEY `FKD9480192DD6FD28A` (`SC_FLD_ID`),
  KEY `FKD948019213D95585` (`SC_ID`),
  CONSTRAINT `FKD948019213D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FKD9480192DD6FD28A` FOREIGN KEY (`SC_FLD_ID`) REFERENCES `blc_sc_fld` (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_fld_map` */

insert  into `blc_sc_fld_map`(`SC_ID`,`SC_FLD_ID`,`MAP_KEY`) values (100,1,'imageUrl'),(100,2,'targetUrl'),(101,3,'imageUrl'),(101,4,'targetUrl'),(102,5,'imageUrl'),(102,6,'targetUrl'),(110,9,'htmlContent'),(130,11,'messageText'),(140,12,'imageUrl'),(140,13,'targetUrl'),(151,51,'imageUrl'),(151,52,'targetUrl'),(152,53,'imageUrl'),(152,54,'targetUrl'),(153,55,'htmlContent'),(154,56,'htmlContent'),(155,57,'messageText'),(156,58,'messageText');

/*Table structure for table `blc_sc_fld_tmplt` */

DROP TABLE IF EXISTS `blc_sc_fld_tmplt`;

CREATE TABLE `blc_sc_fld_tmplt` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_fld_tmplt` */

insert  into `blc_sc_fld_tmplt`(`SC_FLD_TMPLT_ID`,`NAME`) values (1,'Ad Template'),(2,'HTML Template'),(3,'Message Template');

/*Table structure for table `blc_sc_fldgrp_xref` */

DROP TABLE IF EXISTS `blc_sc_fldgrp_xref`;

CREATE TABLE `blc_sc_fldgrp_xref` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK71612AEA6A79BDB5` (`FLD_GROUP_ID`),
  KEY `FK71612AEAF6B0BA84` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FK71612AEA6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK71612AEAF6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_fldgrp_xref` */

insert  into `blc_sc_fldgrp_xref`(`SC_FLD_TMPLT_ID`,`FLD_GROUP_ID`,`GROUP_ORDER`) values (1,4,0),(2,5,0),(3,6,0);

/*Table structure for table `blc_sc_item_criteria` */

DROP TABLE IF EXISTS `blc_sc_item_criteria`;

CREATE TABLE `blc_sc_item_criteria` (
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_item_criteria` */

/*Table structure for table `blc_sc_rule` */

DROP TABLE IF EXISTS `blc_sc_rule`;

CREATE TABLE `blc_sc_rule` (
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_rule` */

/*Table structure for table `blc_sc_rule_map` */

DROP TABLE IF EXISTS `blc_sc_rule_map`;

CREATE TABLE `blc_sc_rule_map` (
  `BLC_SC_SC_ID` bigint(20) NOT NULL,
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SC_SC_ID`,`MAP_KEY`),
  KEY `FK169F1C8256E51A06` (`SC_RULE_ID`),
  KEY `FK169F1C82156E72FC` (`BLC_SC_SC_ID`),
  CONSTRAINT `FK169F1C82156E72FC` FOREIGN KEY (`BLC_SC_SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FK169F1C8256E51A06` FOREIGN KEY (`SC_RULE_ID`) REFERENCES `blc_sc_rule` (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_rule_map` */

/*Table structure for table `blc_sc_type` */

DROP TABLE IF EXISTS `blc_sc_type`;

CREATE TABLE `blc_sc_type` (
  `SC_TYPE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_TYPE_ID`),
  KEY `SC_TYPE_NAME_INDEX` (`NAME`),
  KEY `FKE19886C3F6B0BA84` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FKE19886C3F6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sc_type` */

insert  into `blc_sc_type`(`SC_TYPE_ID`,`DESCRIPTION`,`NAME`,`SC_FLD_TMPLT_ID`) values (1,NULL,'Homepage Banner Ad',1),(2,NULL,'Homepage Middle Promo Snippet',2),(3,NULL,'Homepage Featured Products Title',3),(4,NULL,'Right Hand Side Banner Ad',1);

/*Table structure for table `blc_search_facet` */

DROP TABLE IF EXISTS `blc_search_facet`;

CREATE TABLE `blc_search_facet` (
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  `MULTISELECT` tinyint(1) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `REQUIRES_ALL_DEPENDENT` tinyint(1) DEFAULT NULL,
  `SEARCH_DISPLAY_PRIORITY` int(11) DEFAULT NULL,
  `SHOW_ON_SEARCH` tinyint(1) DEFAULT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SEARCH_FACET_ID`),
  KEY `FK4FFCC9863C3907C4` (`FIELD_ID`),
  CONSTRAINT `FK4FFCC9863C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_search_facet` */

insert  into `blc_search_facet`(`SEARCH_FACET_ID`,`MULTISELECT`,`LABEL`,`REQUIRES_ALL_DEPENDENT`,`SEARCH_DISPLAY_PRIORITY`,`SHOW_ON_SEARCH`,`FIELD_ID`) values (1,1,'Manufacturer',NULL,0,0,1),(2,1,'Heat Range',NULL,0,0,2),(3,1,'Price',NULL,1,1,3),(4,1,'Color',NULL,0,1,8);

/*Table structure for table `blc_search_facet_range` */

DROP TABLE IF EXISTS `blc_search_facet_range`;

CREATE TABLE `blc_search_facet_range` (
  `SEARCH_FACET_RANGE_ID` bigint(20) NOT NULL,
  `MAX_VALUE` decimal(19,5) DEFAULT NULL,
  `MIN_VALUE` decimal(19,5) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_FACET_RANGE_ID`),
  KEY `SEARCH_FACET_INDEX` (`SEARCH_FACET_ID`),
  KEY `FK7EC3B124B96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK7EC3B124B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_search_facet_range` */

insert  into `blc_search_facet_range`(`SEARCH_FACET_RANGE_ID`,`MAX_VALUE`,`MIN_VALUE`,`SEARCH_FACET_ID`) values (1,'5.00000','0.00000',3),(2,'10.00000','5.00000',3),(3,'15.00000','10.00000',3),(4,NULL,'15.00000',3);

/*Table structure for table `blc_search_facet_xref` */

DROP TABLE IF EXISTS `blc_search_facet_xref`;

CREATE TABLE `blc_search_facet_xref` (
  `ID` bigint(20) NOT NULL,
  `REQUIRED_FACET_ID` bigint(20) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK35A63034DA7E1C7C` (`REQUIRED_FACET_ID`),
  KEY `FK35A63034B96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK35A63034B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK35A63034DA7E1C7C` FOREIGN KEY (`REQUIRED_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_search_facet_xref` */

/*Table structure for table `blc_search_intercept` */

DROP TABLE IF EXISTS `blc_search_intercept`;

CREATE TABLE `blc_search_intercept` (
  `SEARCH_REDIRECT_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `SEARCH_TERM` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`SEARCH_REDIRECT_ID`),
  KEY `SEARCH_ACTIVE_INDEX` (`ACTIVE_END_DATE`),
  KEY `SEARCH_PRIORITY_INDEX` (`PRIORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_search_intercept` */

insert  into `blc_search_intercept`(`SEARCH_REDIRECT_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`PRIORITY`,`SEARCH_TERM`,`URL`) values (1,NULL,NULL,1,'insanity','/hot-sauces/insanity_sauce'),(2,'1999-10-15 21:28:36','1992-10-15 14:28:36',-10,'new york','/search?q=pace picante');

/*Table structure for table `blc_search_synonym` */

DROP TABLE IF EXISTS `blc_search_synonym`;

CREATE TABLE `blc_search_synonym` (
  `SEARCH_SYNONYM_ID` bigint(20) NOT NULL,
  `SYNONYMS` varchar(255) DEFAULT NULL,
  `TERM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_SYNONYM_ID`),
  KEY `SEARCHSYNONYM_TERM_INDEX` (`TERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_search_synonym` */

/*Table structure for table `blc_shipping_rate` */

DROP TABLE IF EXISTS `blc_shipping_rate`;

CREATE TABLE `blc_shipping_rate` (
  `ID` bigint(20) NOT NULL,
  `BAND_RESULT_PCT` int(11) NOT NULL,
  `BAND_RESULT_QTY` decimal(19,2) NOT NULL,
  `BAND_UNIT_QTY` decimal(19,2) NOT NULL,
  `FEE_BAND` int(11) NOT NULL,
  `FEE_SUB_TYPE` varchar(255) DEFAULT NULL,
  `FEE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPINGRATE_FEESUB_INDEX` (`FEE_SUB_TYPE`),
  KEY `SHIPPINGRATE_FEE_INDEX` (`FEE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_shipping_rate` */

/*Table structure for table `blc_site` */

DROP TABLE IF EXISTS `blc_site`;

CREATE TABLE `blc_site` (
  `SITE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DEACTIVATED` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_TYPE` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `BLC_SITE_ID_VAL_INDEX` (`SITE_IDENTIFIER_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_site` */

/*Table structure for table `blc_site_catalog` */

DROP TABLE IF EXISTS `blc_site_catalog`;

CREATE TABLE `blc_site_catalog` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `SITE_ID` bigint(20) NOT NULL,
  KEY `FK5F3F2047843A8B63` (`SITE_ID`),
  KEY `FK5F3F2047A350C7F1` (`CATALOG_ID`),
  CONSTRAINT `FK5F3F2047843A8B63` FOREIGN KEY (`SITE_ID`) REFERENCES `blc_site` (`SITE_ID`),
  CONSTRAINT `FK5F3F2047A350C7F1` FOREIGN KEY (`CATALOG_ID`) REFERENCES `blc_catalog` (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_site_catalog` */

/*Table structure for table `blc_site_map_cfg` */

DROP TABLE IF EXISTS `blc_site_map_cfg`;

CREATE TABLE `blc_site_map_cfg` (
  `INDEXED_SITE_MAP_FILE_NAME` varchar(255) DEFAULT NULL,
  `INDEXED_SITE_MAP_FILE_PATTERN` varchar(255) DEFAULT NULL,
  `MAX_URL_ENTRIES_PER_FILE` int(11) DEFAULT NULL,
  `SITE_MAP_FILE_NAME` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`),
  KEY `FK7012930FC50D449` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FK7012930FC50D449` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_module_configuration` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_site_map_cfg` */

insert  into `blc_site_map_cfg`(`INDEXED_SITE_MAP_FILE_NAME`,`INDEXED_SITE_MAP_FILE_PATTERN`,`MAX_URL_ENTRIES_PER_FILE`,`SITE_MAP_FILE_NAME`,`MODULE_CONFIG_ID`) values (NULL,NULL,NULL,NULL,-1);

/*Table structure for table `blc_site_map_gen_cfg` */

DROP TABLE IF EXISTS `blc_site_map_gen_cfg`;

CREATE TABLE `blc_site_map_gen_cfg` (
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  `CHANGE_FREQ` varchar(255) NOT NULL,
  `DISABLED` tinyint(1) NOT NULL,
  `GENERATOR_TYPE` varchar(255) NOT NULL,
  `PRIORITY` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FK1D76000A340ED71` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FK1D76000A340ED71` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_site_map_cfg` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_site_map_gen_cfg` */

insert  into `blc_site_map_gen_cfg`(`GEN_CONFIG_ID`,`CHANGE_FREQ`,`DISABLED`,`GENERATOR_TYPE`,`PRIORITY`,`MODULE_CONFIG_ID`) values (-4,'HOURLY',0,'CATEGORY','0.5',-1),(-3,'HOURLY',0,'PAGE','0.5',-1),(-2,'HOURLY',0,'PRODUCT','0.5',-1),(-1,'HOURLY',0,'CUSTOM','0.5',-1);

/*Table structure for table `blc_site_map_url_entry` */

DROP TABLE IF EXISTS `blc_site_map_url_entry`;

CREATE TABLE `blc_site_map_url_entry` (
  `URL_ENTRY_ID` bigint(20) NOT NULL,
  `CHANGE_FREQ` varchar(255) NOT NULL,
  `LAST_MODIFIED` datetime NOT NULL,
  `LOCATION` varchar(255) NOT NULL,
  `PRIORITY` varchar(255) NOT NULL,
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`URL_ENTRY_ID`),
  KEY `FKE2004FED36AFE1EE` (`GEN_CONFIG_ID`),
  CONSTRAINT `FKE2004FED36AFE1EE` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `blc_cust_site_map_gen_cfg` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_site_map_url_entry` */

insert  into `blc_site_map_url_entry`(`URL_ENTRY_ID`,`CHANGE_FREQ`,`LAST_MODIFIED`,`LOCATION`,`PRIORITY`,`GEN_CONFIG_ID`) values (-8,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/8','0.5',-1),(-7,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/7','0.5',-1),(-6,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/6','0.5',-1),(-5,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/5','0.5',-1),(-4,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/4','0.5',-1),(-3,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/3','0.5',-1),(-2,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/2','0.5',-1),(-1,'HOURLY','2016-04-06 15:28:26','http://www.heatclinic.com/1','0.5',-1);

/*Table structure for table `blc_sku` */

DROP TABLE IF EXISTS `blc_sku`;

CREATE TABLE `blc_sku` (
  `SKU_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `AVAILABLE_FLAG` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTAINER_SHAPE` varchar(255) DEFAULT NULL,
  `DEPTH` decimal(19,2) DEFAULT NULL,
  `DIMENSION_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `GIRTH` decimal(19,2) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `CONTAINER_SIZE` varchar(255) DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `DISCOUNTABLE_FLAG` char(1) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `IS_MACHINE_SORTABLE` tinyint(1) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `TAXABLE_FLAG` char(1) DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `DEFAULT_PRODUCT_ID` bigint(20) DEFAULT NULL,
  `QUANTITY_AVAILABLE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `SKU_ACTIVE_END_INDEX` (`ACTIVE_END_DATE`),
  KEY `SKU_ACTIVE_START_INDEX` (`ACTIVE_START_DATE`),
  KEY `SKU_AVAILABLE_INDEX` (`AVAILABLE_FLAG`),
  KEY `SKU_DISCOUNTABLE_INDEX` (`DISCOUNTABLE_FLAG`),
  KEY `SKU_NAME_INDEX` (`NAME`),
  KEY `SKU_TAXABLE_INDEX` (`TAXABLE_FLAG`),
  KEY `FK28E82CF73E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK28E82CF77E555D75` (`DEFAULT_PRODUCT_ID`),
  CONSTRAINT `FK28E82CF73E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK28E82CF77E555D75` FOREIGN KEY (`DEFAULT_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku` */

insert  into `blc_sku`(`SKU_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`AVAILABLE_FLAG`,`DESCRIPTION`,`CONTAINER_SHAPE`,`DEPTH`,`DIMENSION_UNIT_OF_MEASURE`,`GIRTH`,`HEIGHT`,`CONTAINER_SIZE`,`WIDTH`,`DISCOUNTABLE_FLAG`,`FULFILLMENT_TYPE`,`INVENTORY_TYPE`,`IS_MACHINE_SORTABLE`,`LONG_DESCRIPTION`,`NAME`,`RETAIL_PRICE`,`SALE_PRICE`,`TAX_CODE`,`TAXABLE_FLAG`,`WEIGHT`,`WEIGHT_UNIT_OF_MEASURE`,`CURRENCY_CODE`,`DEFAULT_PRODUCT_ID`,`QUANTITY_AVAILABLE`) values (111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'5ml','800.00000','600.00000',NULL,NULL,NULL,NULL,NULL,NULL,19),(10002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'10ml','1600.00000','1200.00000',NULL,NULL,NULL,NULL,NULL,NULL,10),(10100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'fda','fdafa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20),(10201,NULL,'2016-04-13 16:23:30',NULL,'测试产品简介',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'测试产品','699.00000','499.00000',NULL,NULL,NULL,NULL,NULL,10101,3),(10202,NULL,'2016-04-13 16:29:01',NULL,'测试产品2简介',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,'测试产品2图文信息<br><p><img src=\"/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg\"></p>','测试产品2','899.00000','699.00000',NULL,NULL,NULL,NULL,NULL,10102,NULL),(10203,NULL,'2016-04-13 16:40:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'测试产品3','899.00000','199.00000',NULL,NULL,NULL,NULL,NULL,10103,NULL);

/*Table structure for table `blc_sku_attribute` */

DROP TABLE IF EXISTS `blc_sku_attribute`;

CREATE TABLE `blc_sku_attribute` (
  `SKU_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ATTR_ID`),
  KEY `SKUATTR_NAME_INDEX` (`NAME`),
  KEY `SKUATTR_SKU_INDEX` (`SKU_ID`),
  KEY `FK6C6A5934B78C9977` (`SKU_ID`),
  CONSTRAINT `FK6C6A5934B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_attribute` */

insert  into `blc_sku_attribute`(`SKU_ATTR_ID`,`NAME`,`SEARCHABLE`,`VALUE`,`SKU_ID`) values (1,'销售量',0,'10',10001);

/*Table structure for table `blc_sku_availability` */

DROP TABLE IF EXISTS `blc_sku_availability`;

CREATE TABLE `blc_sku_availability` (
  `SKU_AVAILABILITY_ID` bigint(20) NOT NULL,
  `AVAILABILITY_DATE` datetime DEFAULT NULL,
  `AVAILABILITY_STATUS` varchar(255) DEFAULT NULL,
  `LOCATION_ID` bigint(20) DEFAULT NULL,
  `QTY_ON_HAND` int(11) DEFAULT NULL,
  `RESERVE_QTY` int(11) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_AVAILABILITY_ID`),
  KEY `SKUAVAIL_STATUS_INDEX` (`AVAILABILITY_STATUS`),
  KEY `SKUAVAIL_LOCATION_INDEX` (`LOCATION_ID`),
  KEY `SKUAVAIL_SKU_INDEX` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_availability` */

/*Table structure for table `blc_sku_bundle_item` */

DROP TABLE IF EXISTS `blc_sku_bundle_item`;

CREATE TABLE `blc_sku_bundle_item` (
  `SKU_BUNDLE_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKD55968CCF29B96` (`PRODUCT_BUNDLE_ID`),
  KEY `FKD55968B78C9977` (`SKU_ID`),
  CONSTRAINT `FKD55968B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FKD55968CCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_bundle_item` */

/*Table structure for table `blc_sku_fee` */

DROP TABLE IF EXISTS `blc_sku_fee`;

CREATE TABLE `blc_sku_fee` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXPRESSION` longtext,
  `FEE_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TAXABLE` tinyint(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SKU_FEE_ID`),
  KEY `FKEEB7181E3E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FKEEB7181E3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_fee` */

/*Table structure for table `blc_sku_fee_xref` */

DROP TABLE IF EXISTS `blc_sku_fee_xref`;

CREATE TABLE `blc_sku_fee_xref` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  KEY `FKD88D409CB78C9977` (`SKU_ID`),
  KEY `FKD88D409CCF4C9A82` (`SKU_FEE_ID`),
  CONSTRAINT `FKD88D409CB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FKD88D409CCF4C9A82` FOREIGN KEY (`SKU_FEE_ID`) REFERENCES `blc_sku_fee` (`SKU_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_fee_xref` */

/*Table structure for table `blc_sku_fulfillment_excluded` */

DROP TABLE IF EXISTS `blc_sku_fulfillment_excluded`;

CREATE TABLE `blc_sku_fulfillment_excluded` (
  `SKU_ID` bigint(20) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  KEY `FK84162D7381F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FK84162D73B78C9977` (`SKU_ID`),
  CONSTRAINT `FK84162D7381F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK84162D73B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_fulfillment_excluded` */

/*Table structure for table `blc_sku_fulfillment_flat_rates` */

DROP TABLE IF EXISTS `blc_sku_fulfillment_flat_rates`;

CREATE TABLE `blc_sku_fulfillment_flat_rates` (
  `SKU_ID` bigint(20) NOT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C9681F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C96B78C9977` (`SKU_ID`),
  CONSTRAINT `FKC1988C9681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC1988C96B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_fulfillment_flat_rates` */

/*Table structure for table `blc_sku_media_map` */

DROP TABLE IF EXISTS `blc_sku_media_map`;

CREATE TABLE `blc_sku_media_map` (
  `BLC_SKU_SKU_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SKU_SKU_ID`,`MAP_KEY`),
  KEY `FKEB4AECF96E4720E0` (`MEDIA_ID`),
  KEY `FKEB4AECF9D93D857F` (`BLC_SKU_SKU_ID`),
  CONSTRAINT `FKEB4AECF96E4720E0` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`),
  CONSTRAINT `FKEB4AECF9D93D857F` FOREIGN KEY (`BLC_SKU_SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_media_map` */

insert  into `blc_sku_media_map`(`BLC_SKU_SKU_ID`,`MEDIA_ID`,`MAP_KEY`) values (10100,100200,'primary'),(10201,100301,'primary'),(10202,100302,'primary'),(10203,100303,'primary');

/*Table structure for table `blc_sku_option_value_xref` */

DROP TABLE IF EXISTS `blc_sku_option_value_xref`;

CREATE TABLE `blc_sku_option_value_xref` (
  `SKU_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK7B61DC0BB0C16A73` (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK7B61DC0BB78C9977` (`SKU_ID`),
  CONSTRAINT `FK7B61DC0BB0C16A73` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `blc_product_option_value` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FK7B61DC0BB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_sku_option_value_xref` */

insert  into `blc_sku_option_value_xref`(`SKU_ID`,`PRODUCT_OPTION_VALUE_ID`) values (111,1),(112,1),(113,1),(114,1),(211,1),(212,1),(213,1),(214,1),(311,1),(312,1),(313,1),(314,1),(411,1),(412,1),(413,1),(414,1),(511,1),(512,1),(513,1),(514,1),(611,1),(612,1),(613,1),(614,1),(121,2),(122,2),(123,2),(124,2),(221,2),(222,2),(223,2),(224,2),(321,2),(322,2),(323,2),(324,2),(421,2),(422,2),(423,2),(424,2),(521,2),(522,2),(523,2),(524,2),(621,2),(622,2),(623,2),(624,2),(131,3),(132,3),(133,3),(134,3),(231,3),(232,3),(233,3),(234,3),(331,3),(332,3),(333,3),(334,3),(431,3),(432,3),(433,3),(434,3),(531,3),(532,3),(533,3),(534,3),(631,3),(632,3),(633,3),(634,3),(111,11),(121,11),(131,11),(211,11),(221,11),(231,11),(311,11),(321,11),(331,11),(411,11),(421,11),(431,11),(511,11),(521,11),(531,11),(611,11),(621,11),(631,11),(112,12),(122,12),(132,12),(212,12),(222,12),(232,12),(312,12),(322,12),(332,12),(412,12),(422,12),(432,12),(512,12),(522,12),(532,12),(612,12),(622,12),(632,12),(113,13),(123,13),(133,13),(213,13),(223,13),(233,13),(313,13),(323,13),(333,13),(413,13),(423,13),(433,13),(513,13),(523,13),(533,13),(613,13),(623,13),(633,13),(114,14),(124,14),(134,14),(214,14),(224,14),(234,14),(314,14),(324,14),(334,14),(414,14),(424,14),(434,14),(514,14),(524,14),(534,14),(614,14),(624,14),(634,14),(10001,950),(10100,950),(10002,951);

/*Table structure for table `blc_state` */

DROP TABLE IF EXISTS `blc_state`;

CREATE TABLE `blc_state` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `STATE_NAME_INDEX` (`NAME`),
  KEY `FK8F94A1EBA46E16CF` (`COUNTRY`),
  CONSTRAINT `FK8F94A1EBA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_state` */

insert  into `blc_state`(`ABBREVIATION`,`NAME`,`COUNTRY`) values ('AA','ARMED FORCES AMERICA','US'),('AB','ALBERTA','CA'),('AE','ARMED FORCES','US'),('AK','ALASKA','US'),('AL','ALABAMA','US'),('AP','ARMED FORCES PACIFIC','US'),('AR','ARKANSAS','US'),('AS','AMERICAN SAMOA','US'),('AZ','ARIZONA','US'),('BC','BRITISH COLUMBIA','CA'),('CA','CALIFORNIA','US'),('CO','COLORADO','US'),('CT','CONNECTICUT','US'),('DC','DISTRICT OF COLUMBIA','US'),('DE','DELAWARE','US'),('FL','FLORIDA','US'),('FM','FEDERATED STATES OF MICRONESIA','US'),('GA','GEORGIA','US'),('GU','GUAM','US'),('HI','HAWAII','US'),('IA','IOWA','US'),('ID','IDAHO','US'),('IL','ILLINOIS','US'),('IN','INDIANA','US'),('KS','KANSAS','US'),('KY','KENTUCKY','US'),('LA','LOUISIANA','US'),('MA','MASSACHUSETTS','US'),('MB','MANITOBA','CA'),('MD','MARYLAND','US'),('ME','MAINE','US'),('MH','MARSHALL ISLANDS','US'),('MI','MICHIGAN','US'),('MN','MINNESOTA','US'),('MO','MISSOURI','US'),('MP','NORTHERN MARIANA ISLANDS','US'),('MS','MISSISSIPPI','US'),('MT','MONTANA','US'),('NB','NEW BRUNSWICK','CA'),('NC','NORTH CAROLINA','US'),('ND','NORTH DAKOTA','US'),('NE','NEBRASKA','US'),('NH','NEW HAMPSHIRE','US'),('NJ','NEW JERSEY','US'),('NL','NEWFOUNDLAND','CA'),('NM','NEW MEXICO','US'),('NS','NOVA SCOTIA','CA'),('NT','NORTHWEST TERRITORIES','CA'),('NU','NUNAVUT','CA'),('NV','NEVADA','US'),('NY','NEW YORK','US'),('OH','OHIO','US'),('OK','OKLAHOMA','US'),('ON','ONTARIO','CA'),('OR','OREGON','US'),('PA','PENNSYLVANIA','US'),('PE','PRINCE EDWARD ISLAND','CA'),('PR','PUERTO RICO','US'),('PW','PALAU','US'),('QC','QUEBEC','CA'),('RI','RHODE ISLAND','US'),('SC','SOUTH CAROLINA','US'),('SD','SOUTH DAKOTA','US'),('SK','SASKATCHEWAN','CA'),('TN','TENNESSEE','US'),('TX','TEXAS','US'),('UT','UTAH','US'),('VA','VIRGINIA','US'),('VI','VIRGIN ISLANDS','US'),('VT','VERMONT','US'),('WA','WASHINGTON','US'),('WI','WISCONSIN','US'),('WV','WEST VIRGINIA','US'),('WY','WYOMING','US'),('YT','YUKON','CA');

/*Table structure for table `blc_static_asset` */

DROP TABLE IF EXISTS `blc_static_asset`;

CREATE TABLE `blc_static_asset` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FILE_EXTENSION` varchar(255) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FULL_URL` varchar(255) NOT NULL,
  `MIME_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `STORAGE_TYPE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `ASST_FULL_URL_INDX` (`FULL_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_static_asset` */

insert  into `blc_static_asset`(`STATIC_ASSET_ID`,`ALT_TEXT`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`FILE_EXTENSION`,`FILE_SIZE`,`FULL_URL`,`MIME_TYPE`,`NAME`,`STORAGE_TYPE`,`TITLE`) values (101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sudden-Death-Sauce-Bottle.jpg','image/jpg','Sudden Death Sauce Bottle','FILESYSTEM',NULL),(102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sudden-Death-Sauce-Close.jpg','image/jpg','Sudden Death Sauce Close-up','FILESYSTEM',NULL),(201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Bottle.jpg','image/jpg','Sweet Death Sauce Bottle','FILESYSTEM',NULL),(202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Close.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL),(203,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Skull.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL),(204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Tile.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL),(205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Grass.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL),(206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Logo.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL),(301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg','image/jpg','Hoppin Hot Sauce Bottle','FILESYSTEM',NULL),(302,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hoppin-Hot-Sauce-Close.jpg','image/jpg','Hoppin Hot Sauce Close-up','FILESYSTEM',NULL),(401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg','image/jpg','Day of the Dead Chipotle Hot Sauce Bottle','FILESYSTEM',NULL),(402,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg','image/jpg','Day of the Dead Chipotle Hot Sauce Close-up','FILESYSTEM',NULL),(501,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg','image/jpg','Day of the Dead Habanero Hot Sauce Bottle','FILESYSTEM',NULL),(502,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg','image/jpg','Day of the Dead Habanero Hot Sauce Close-up','FILESYSTEM',NULL),(601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg','image/jpg','Day of the Dead Scotch Bonnet Hot Sauce Bottle','FILESYSTEM',NULL),(602,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg','image/jpg','Day of the Dead Scotch Bonnet Hot Sauce Close-up','FILESYSTEM',NULL),(701,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Green-Ghost-Bottle.jpg','image/jpg','Green Ghost Bottle','FILESYSTEM',NULL),(702,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Green-Ghost-Close.jpg','image/jpg','Green Ghost Close-up','FILESYSTEM',NULL),(801,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg','image/jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','FILESYSTEM',NULL),(802,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg','image/jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','FILESYSTEM',NULL),(901,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg','image/jpg','Armageddon The Hot Sauce To End All Bottle','FILESYSTEM',NULL),(902,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg','image/jpg','Armageddon The Hot Sauce To End All Close-up','FILESYSTEM',NULL),(1001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg','image/jpg','Dr. Chilemeisters Insane Hot Sauce Bottle','FILESYSTEM',NULL),(1002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg','image/jpg','Dr. Chilemeisters Insane Hot Sauce Close-up','FILESYSTEM',NULL),(1101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg','image/jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','FILESYSTEM',NULL),(1102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg','image/jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','FILESYSTEM',NULL),(1201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg','image/jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','FILESYSTEM',NULL),(1202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg','image/jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','FILESYSTEM',NULL),(1301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg','image/jpg','Bull Snort Smokin Toncils Hot Sauce Bottle','FILESYSTEM',NULL),(1302,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg','image/jpg','Bull Snort Smokin Toncils Hot Sauce Close-up','FILESYSTEM',NULL),(1401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg','image/jpg','Cool Cayenne Pepper Hot Sauce Bottle','FILESYSTEM',NULL),(1402,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg','image/jpg','Cool Cayenne Pepper Hot Sauce Close-up','FILESYSTEM',NULL),(1501,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg','image/jpg','Roasted Garlic Hot Sauce Bottle','FILESYSTEM',NULL),(1502,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg','image/jpg','Roasted Garlic Hot Sauce Close-up','FILESYSTEM',NULL),(1601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg','image/jpg','Scotch Bonnet Hot Sauce Bottle','FILESYSTEM',NULL),(1602,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg','image/jpg','Scotch Bonnet Hot Sauce Close-up','FILESYSTEM',NULL),(1701,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Insanity-Sauce-Bottle.jpg','image/jpg','Insanity Sauce Bottle','FILESYSTEM',NULL),(1702,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Insanity-Sauce-Close.jpg','image/jpg','Insanity Sauce Close-up','FILESYSTEM',NULL),(1801,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg','image/jpg','Hurtin Jalepeno Hot Sauce Bottle','FILESYSTEM',NULL),(1802,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg','image/jpg','Hurtin Jalepeno Hot Sauce Close-up','FILESYSTEM',NULL),(1901,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg','image/jpg','Roasted Red Pepper and Chipotle Hot Sauce Bottle','FILESYSTEM',NULL),(1902,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg','image/jpg','Roasted Red Pepper and Chipotle Hot Sauce Close-up','FILESYSTEM',NULL),(10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_mens_black.jpg','image/jpg','Hawt Like a Habanero Men\'s Black','FILESYSTEM',NULL),(10002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_mens_red.jpg','image/jpg','Hawt Like a Habanero Men\'s Red','FILESYSTEM',NULL),(10003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_mens_silver.jpg','image/jpg','Hawt Like a Habanero Men\'s Silver','FILESYSTEM',NULL),(20001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_womens_black.jpg','image/jpg','Hawt Like a Habanero Women\'s Black','FILESYSTEM',NULL),(20002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_womens_red.jpg','image/jpg','Hawt Like a Habanero Women\'s Red','FILESYSTEM',NULL),(20003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_womens_silver.jpg','image/jpg','Hawt Like a Habanero Women\'s Silver','FILESYSTEM',NULL),(30001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_black.jpg','image/jpg','Heat Clinic Hand-Drawn Men\'s Black','FILESYSTEM',NULL),(30002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_red.jpg','image/jpg','Heat Clinic Hand-Drawn Men\'s Red','FILESYSTEM',NULL),(30003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_silver.jpg','image/jpg','Heat Clinic Hand-Drawn Men\'s Silver','FILESYSTEM',NULL),(40001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_black.jpg','image/jpg','Heat Clinic Hand-Drawn Women\'s Black','FILESYSTEM',NULL),(40002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_red.jpg','image/jpg','Heat Clinic Hand-Drawn Women\'s Red','FILESYSTEM',NULL),(40003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_silver.jpg','image/jpg','Heat Clinic Hand-Drawn Women\'s Silver','FILESYSTEM',NULL),(50001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_black.jpg','image/jpg','Heat Clinic Mascot Men\'s Black','FILESYSTEM',NULL),(50002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_red.jpg','image/jpg','Heat Clinic Mascot Men\'s Red','FILESYSTEM',NULL),(50003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_silver.jpg','image/jpg','Heat Clinic Mascot Men\'s Silver','FILESYSTEM',NULL),(60001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_black.jpg','image/jpg','Heat Clinic Mascot Women\'s Black','FILESYSTEM',NULL),(60002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_red.jpg','image/jpg','Heat Clinic Mascot Women\'s Red','FILESYSTEM',NULL),(60003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_silver.jpg','image/jpg','Heat Clinic Mascot Women\'s Silver','FILESYSTEM',NULL),(99950,NULL,-1,'2016-04-11 10:50:05','2016-04-11 10:50:05',NULL,'png',1520,'/product/9950/vpLogo.png','image/png','vpLogo.png','FILESYSTEM',NULL),(99951,NULL,-1,'2016-04-11 10:50:29','2016-04-11 10:50:29',NULL,'png',1520,'/product/9950/vpLogo-1.png','image/png','vpLogo.png','FILESYSTEM',NULL),(99952,'tesco hint',-1,'2016-04-11 12:32:31','2016-04-11 12:32:44',-1,'png',53678,'/tescocrvlogo.png','image/png','tescocrvlogo.png','FILESYSTEM','tesco'),(100000,NULL,-1,'2016-04-12 11:08:47','2016-04-12 11:08:47',NULL,'png',32808,'/product/9950/苏果logo.png','image/png','苏果logo.png','FILESYSTEM',NULL),(100001,NULL,-1,'2016-04-12 11:09:22','2016-04-12 11:09:22',NULL,'png',1520,'/product/9950/vpLogo-2.png','image/png','vpLogo.png','FILESYSTEM',NULL),(100002,NULL,-1,'2016-04-12 13:52:12','2016-04-12 13:52:12',NULL,'png',14981,'/category/2002/in_21.png','image/png','in_21.png','FILESYSTEM',NULL),(100003,NULL,-1,'2016-04-12 13:53:06','2016-04-12 13:53:06',NULL,'png',15969,'/category/2003/in_21-09.png','image/png','in_21-09.png','FILESYSTEM',NULL),(100004,NULL,-1,'2016-04-12 13:53:52','2016-04-12 13:53:52',NULL,'png',17527,'/category/2004/in_21-10.png','image/png','in_21-10.png','FILESYSTEM',NULL),(100005,NULL,-1,'2016-04-12 13:54:14','2016-04-12 13:54:14',NULL,'png',14946,'/category/99951/in_21-11.png','image/png','in_21-11.png','FILESYSTEM',NULL),(100006,NULL,-1,'2016-04-12 13:54:39','2016-04-12 13:54:39',NULL,'png',20764,'/category/10000/in_21-12.png','image/png','in_21-12.png','FILESYSTEM',NULL),(100007,NULL,-1,'2016-04-12 15:07:38','2016-04-12 15:07:38',NULL,'png',126257,'/product/9950/ii_11.png','image/png','ii_11.png','FILESYSTEM',NULL);

/*Table structure for table `blc_static_asset_desc` */

DROP TABLE IF EXISTS `blc_static_asset_desc`;

CREATE TABLE `blc_static_asset_desc` (
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_static_asset_desc` */

/*Table structure for table `blc_static_asset_strg` */

DROP TABLE IF EXISTS `blc_static_asset_strg`;

CREATE TABLE `blc_static_asset_strg` (
  `STATIC_ASSET_STRG_ID` bigint(20) NOT NULL,
  `FILE_DATA` longblob,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_STRG_ID`),
  KEY `STATIC_ASSET_ID_INDEX` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_static_asset_strg` */

/*Table structure for table `blc_store` */

DROP TABLE IF EXISTS `blc_store`;

CREATE TABLE `blc_store` (
  `STORE_ID` bigint(20) NOT NULL,
  `ADDRESS_1` varchar(255) DEFAULT NULL,
  `ADDRESS_2` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(255) DEFAULT NULL,
  `STORE_COUNTRY` varchar(255) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STORE_NAME` varchar(255) NOT NULL,
  `STORE_PHONE` varchar(255) DEFAULT NULL,
  `STORE_STATE` varchar(255) DEFAULT NULL,
  `STORE_ZIP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_store` */

/*Table structure for table `blc_system_property` */

DROP TABLE IF EXISTS `blc_system_property`;

CREATE TABLE `blc_system_property` (
  `BLC_SYSTEM_PROPERTY_ID` bigint(20) NOT NULL,
  `FRIENDLY_GROUP` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `FRIENDLY_TAB` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `PROPERTY_TYPE` varchar(255) DEFAULT NULL,
  `PROPERTY_VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SYSTEM_PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_system_property` */

insert  into `blc_system_property`(`BLC_SYSTEM_PROPERTY_ID`,`FRIENDLY_GROUP`,`FRIENDLY_NAME`,`FRIENDLY_TAB`,`PROPERTY_NAME`,`PROPERTY_TYPE`,`PROPERTY_VALUE`) values (1,'测试组','测试属性显示值','测试标签','testP','STRING','测试属性值');

/*Table structure for table `blc_tar_crit_offer_xref` */

DROP TABLE IF EXISTS `blc_tar_crit_offer_xref`;

CREATE TABLE `blc_tar_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_125F5803E7AB0252` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F58033615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F5803D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK125F58033615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK125F5803D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_tar_crit_offer_xref` */

insert  into `blc_tar_crit_offer_xref`(`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`) values (1,1);

/*Table structure for table `blc_tax_detail` */

DROP TABLE IF EXISTS `blc_tax_detail`;

CREATE TABLE `blc_tax_detail` (
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `TAX_COUNTRY` varchar(255) DEFAULT NULL,
  `JURISDICTION_NAME` varchar(255) DEFAULT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `TAX_REGION` varchar(255) DEFAULT NULL,
  `TAX_NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TAX_DETAIL_ID`),
  KEY `FKEABE4A4B3E2FC4F9` (`CURRENCY_CODE`),
  KEY `FKEABE4A4BC50D449` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FKEABE4A4B3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FKEABE4A4BC50D449` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_module_configuration` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_tax_detail` */

/*Table structure for table `blc_trans_additnl_fields` */

DROP TABLE IF EXISTS `blc_trans_additnl_fields`;

CREATE TABLE `blc_trans_additnl_fields` (
  `PAYMENT_TRANSACTION_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` longtext,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_TRANSACTION_ID`,`FIELD_NAME`),
  KEY `FK376DDE4B9E955B1D` (`PAYMENT_TRANSACTION_ID`),
  CONSTRAINT `FK376DDE4B9E955B1D` FOREIGN KEY (`PAYMENT_TRANSACTION_ID`) REFERENCES `blc_order_payment_transaction` (`PAYMENT_TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_trans_additnl_fields` */

/*Table structure for table `blc_translation` */

DROP TABLE IF EXISTS `blc_translation`;

CREATE TABLE `blc_translation` (
  `TRANSLATION_ID` bigint(20) NOT NULL,
  `ENTITY_ID` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  `TRANSLATED_VALUE` longtext,
  PRIMARY KEY (`TRANSLATION_ID`),
  KEY `TRANSLATION_INDEX` (`ENTITY_TYPE`,`ENTITY_ID`,`FIELD_NAME`,`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_translation` */

/*Table structure for table `blc_url_handler` */

DROP TABLE IF EXISTS `blc_url_handler`;

CREATE TABLE `blc_url_handler` (
  `URL_HANDLER_ID` bigint(20) NOT NULL,
  `INCOMING_URL` varchar(255) NOT NULL,
  `NEW_URL` varchar(255) NOT NULL,
  `URL_REDIRECT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`URL_HANDLER_ID`),
  KEY `INCOMING_URL_INDEX` (`INCOMING_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_url_handler` */

insert  into `blc_url_handler`(`URL_HANDLER_ID`,`INCOMING_URL`,`NEW_URL`,`URL_REDIRECT_TYPE`) values (1,'/googlePerm','http://www.google.com','REDIRECT_PERM'),(2,'/googleTemp','http://www.google.com','REDIRECT_TEMP'),(3,'/insanity','/hot-sauces/insanity_sauce','FORWARD'),(4,'/jalepeno','/hot-sauces/hurtin_jalepeno_hot_sauce','REDIRECT_TEMP');

/*Table structure for table `blc_userconnection` */

DROP TABLE IF EXISTS `blc_userconnection`;

CREATE TABLE `blc_userconnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_userconnection` */

/*Table structure for table `blc_zip_code` */

DROP TABLE IF EXISTS `blc_zip_code`;

CREATE TABLE `blc_zip_code` (
  `ZIP_CODE_ID` varchar(255) NOT NULL,
  `ZIP_CITY` varchar(255) DEFAULT NULL,
  `ZIP_LATITUDE` double DEFAULT NULL,
  `ZIP_LONGITUDE` double DEFAULT NULL,
  `ZIP_STATE` varchar(255) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE_ID`),
  KEY `ZIPCODE_CITY_INDEX` (`ZIP_CITY`),
  KEY `ZIPCODE_LATITUDE_INDEX` (`ZIP_LATITUDE`),
  KEY `ZIPCODE_LONGITUDE_INDEX` (`ZIP_LONGITUDE`),
  KEY `ZIPCODE_STATE_INDEX` (`ZIP_STATE`),
  KEY `ZIPCODE_ZIP_INDEX` (`ZIPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blc_zip_code` */

/*Table structure for table `customaddressimpl` */

DROP TABLE IF EXISTS `customaddressimpl`;

CREATE TABLE `customaddressimpl` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `FKACEFD3E3C13085DD` (`ADDRESS_ID`),
  CONSTRAINT `FKACEFD3E3C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customaddressimpl` */

insert  into `customaddressimpl`(`ADDRESS_ID`) values (252),(301),(302),(303),(304),(305),(306),(307),(308),(309),(310),(311),(351),(401),(402),(403),(404),(451),(501);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (1);

/*Table structure for table `product_extend` */

DROP TABLE IF EXISTS `product_extend`;

CREATE TABLE `product_extend` (
  `PRODUCT_EXTEND_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(200) DEFAULT NULL,
  `SALES` bigint(20) DEFAULT '0' COMMENT '销售量',
  PRIMARY KEY (`PRODUCT_EXTEND_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `product_extend_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `product_extend` */

insert  into `product_extend`(`PRODUCT_EXTEND_ID`,`PRODUCT_ID`,`PROMOTION_MESSAGE`,`SALES`) values (2,10101,'测试产品促销信息',13),(3,10102,'测试产品2促销信息',0),(4,10103,NULL,0);

/*Table structure for table `qrcode` */

DROP TABLE IF EXISTS `qrcode`;

CREATE TABLE `qrcode` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `code` char(13) NOT NULL COMMENT '13位条码',
  `usedate` datetime DEFAULT NULL COMMENT '条码使用时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '使用状态 0未使用，1已使用',
  `usedby` bigint(20) DEFAULT NULL COMMENT '使用者ID',
  PRIMARY KEY (`id`),
  KEY `FK8EDBB78EAC3B73EF` (`usedby`),
  CONSTRAINT `FK8EDBB78EAC3B73EF` FOREIGN KEY (`usedby`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `qrcode` */

insert  into `qrcode`(`id`,`code`,`usedate`,`status`,`usedby`) values (1,'1234567891245',NULL,0,NULL),(2,'7400045945206',NULL,1,NULL);

/*Table structure for table `sequence_generator` */

DROP TABLE IF EXISTS `sequence_generator`;

CREATE TABLE `sequence_generator` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sequence_generator` */

insert  into `sequence_generator`(`ID_NAME`,`ID_VAL`) values ('AddressImpl',601),('AdminRoleImpl',101),('AdminUserImpl',101),('CategoryExcludedSearchFacetImpl',1000),('CategoryImpl',10100),('CategoryProductImpl',1000),('CategoryProductXrefImpl',1400),('CategorySearchFacetImpl',1050),('CategoryXrefImpl',1100),('ChallengeQuestionImpl',1000),('CrossSaleProductImpl',101),('CustomerAddressImpl',301),('CustomerAttributeImpl',251),('CustomerRoleImpl',301),('EmailTrackingImpl',451),('FeaturedProductImpl',1050),('FieldDefinitionImpl',1000),('FieldEnumerationImpl',1000),('FieldEnumerationItemImpl',1000),('FieldGroupImpl',1000),('FieldImpl',1000),('FulfillmentGroupImpl',1251),('FulfillmentGroupItemImpl',1401),('FulfillmentOptionImpl',1000),('MediaImpl',100400),('OfferCodeImpl',1050),('OfferImpl',1000),('OfferItemCriteriaImpl',1000),('OrderAttributeImpl',101),('OrderImpl',1351),('OrderItemAttributeImpl',301),('OrderItemImpl',1401),('OrderItemPriceDetailImpl',1401),('OrderPaymentImpl',251),('PageFieldImpl',1000),('PageImpl',1000),('PageTemplateImpl',1000),('PaymentTransactionImpl',251),('PersonalMessageImpl',151),('PhoneImpl',551),('ProductAttributeImpl',1200),('ProductImpl',10200),('ProductOptionImpl',1050),('ProductOptionValueImpl',1050),('ProductOptionXrefImpl',1150),('RoleImpl',1000),('SandBoxImpl',151),('SandBoxManagementImpl',151),('SearchFacetImpl',1000),('SearchFacetRangeImpl',1000),('SearchInterceptImpl',1000),('SkuAttributeImpl',101),('SkuImpl',10300),('StaticAssetImpl',100100),('StructuredContentFieldImpl',1000),('StructuredContentImpl',1000),('StructuredContentRuleImpl',1000),('StructuredContentTypeImpl',1000),('SystemPropertyImpl',101),('UpSaleProductImpl',101),('URLHandlerImpl',1000);

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `area` char(3) NOT NULL,
  `code` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

insert  into `shop`(`id`,`area`,`code`,`province`,`city`,`name`,`address`) values (1,'南区','097','广东','佛山','乐从店','佛山市顺德区乐从镇乐从大道南星光广场'),(2,'南区','103','广东','佛山','怡丰城店','佛山南海区平洲佛平四路与石龙路交界'),(3,'南区','084','广东','汕头','金平店','汕头市汕樟路41号'),(4,'南区','015','广东','汕头','汕头店','汕头市长平东路丰泽庄卜蜂莲花商城');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

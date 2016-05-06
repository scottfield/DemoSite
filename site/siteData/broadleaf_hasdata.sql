/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.23-log : Database - broadleaf
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BA2288126710A69` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

/*Data for the table `address_shop` */

insert  into `address_shop`(`id`,`shop_id`,`address_id`) values (34,3,951),(35,4,1001),(36,3,1051),(37,52,1101),(38,50,1102),(39,49,1151),(40,47,1201),(41,59,1251),(42,57,1303),(43,45,1351),(44,43,1401),(45,55,1451),(46,42,1501),(47,63,1551),(48,60,1601),(49,39,1651),(50,37,1701),(51,37,1702),(52,37,1703),(53,55,1751),(54,37,1801),(55,37,1851),(56,55,1901),(57,55,1902),(58,55,1903),(59,64,1904),(60,64,1905),(61,64,1906),(62,64,1907),(63,64,1908),(64,64,1909),(65,64,1910),(66,56,1951),(67,64,1952),(68,56,1953),(69,56,1954),(70,56,1955),(71,56,1956),(72,37,2001),(73,37,2002),(74,37,2003),(75,37,2004),(76,45,2005),(77,57,2006),(78,37,2007),(79,37,2008),(80,37,2051),(81,57,2052),(82,45,2053),(83,45,2101),(84,37,2151),(85,37,2152),(86,59,2153),(87,57,2154),(88,37,2155),(89,37,2201),(90,37,2202),(91,37,2203),(92,37,2204),(93,37,2205),(94,56,2206),(95,37,2251),(96,37,2252),(97,37,2301),(98,37,2302),(99,56,2303),(100,56,2304),(101,49,2305),(102,49,2306),(103,37,2351),(104,57,2352),(105,64,2353),(106,37,2354),(107,37,2355),(108,57,2356),(109,39,2357),(110,39,2358),(111,37,2359),(112,37,2360),(113,64,2361),(114,64,2362),(115,64,2401),(116,37,2402),(117,37,2403),(118,37,2404),(119,37,2405),(120,37,2406),(121,39,2407),(122,39,2408),(123,37,2451),(124,37,2452),(125,64,2453),(126,39,2454),(127,41,2455),(128,39,2456),(129,41,2457),(130,66,2458),(131,66,2459),(132,41,2460),(133,40,2461),(134,40,2462),(135,37,2463),(136,37,2464),(137,37,2501),(138,37,2502),(139,66,2551),(140,40,2552),(141,37,2553),(142,37,2554),(143,37,2555),(144,37,2556),(145,37,2557),(146,65,2558),(147,53,2559),(148,53,2560),(149,37,2561),(150,37,2601),(151,37,2602);

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

insert  into `blc_admin_role`(`ADMIN_ROLE_ID`,`DESCRIPTION`,`NAME`) values (-6,'CMS Approver','ROLE_CONTENT_APPROVER'),(-5,'CMS Editor','ROLE_CONTENT_EDITOR'),(-4,'CSR','ROLE_CUSTOMER_SERVICE_REP'),(-3,'Promotion Manager','ROLE_PROMOTION_MANAGER'),(-2,'Merchandiser','ROLE_MERCHANDISE_MANAGER'),(-1,'Admin Master Access','ROLE_ADMIN'),(1,'测试角色','测试'),(51,'只用于浏览订单查询订单和一般数据的查询','服务台');

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

insert  into `blc_admin_role_permission_xref`(`ADMIN_ROLE_ID`,`ADMIN_PERMISSION_ID`) values (-1,-141),(-5,-131),(-3,-131),(-2,-131),(-1,-131),(-1,-127),(-1,-123),(-1,-121),(-4,-119),(-1,-119),(-4,-117),(-1,-117),(1,-116),(51,-116),(-1,-115),(-5,-113),(-1,-113),(-6,-111),(-5,-111),(-2,-111),(-1,-111),(-6,-109),(-5,-109),(-1,-109),(-3,-107),(-1,-107),(-2,-105),(-1,-105),(-2,-103),(-1,-103),(-2,-101),(-1,-101);

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

insert  into `blc_admin_user`(`ADMIN_USER_ID`,`ACTIVE_STATUS_FLAG`,`EMAIL`,`LOGIN`,`NAME`,`PASSWORD`,`PHONE_NUMBER`) values (-6,1,'cms_approver@yourdomain.com','cmsApprover','CMS Approver','admin{-6}',NULL),(-5,1,'cms_edit@yourdomain.com','cmsEditor','CMS Editor','admin{-5}',NULL),(-4,1,'csr@yourdomain.com','csr','CSR','admin{-4}',NULL),(-3,1,'promo@yourdomain.com','promo','Promotion Manager','admin{-3}',NULL),(-2,1,'merchandise@yourdomain.com','merchandise','Merchandise Manager','admin{-2}',NULL),(-1,1,'admin@yourdomain.com','admin','管理员','admin{-1}',NULL),(51,1,'scottfield@qq.com','reception','服务台','123456{51}',NULL);

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

insert  into `blc_admin_user_role_xref`(`ADMIN_USER_ID`,`ADMIN_ROLE_ID`) values (-6,-6),(-5,-5),(-4,-4),(-3,-3),(-2,-2),(-1,-1),(51,51);

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

insert  into `blc_category`(`CATEGORY_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`ARCHIVED`,`DESCRIPTION`,`DISPLAY_TEMPLATE`,`FULFILLMENT_TYPE`,`INVENTORY_TYPE`,`LONG_DESCRIPTION`,`NAME`,`TAX_CODE`,`URL`,`URL_KEY`,`DEFAULT_PARENT_CATEGORY_ID`) values (1,NULL,'2016-04-06 15:28:24',NULL,'Root',NULL,NULL,NULL,NULL,'根',NULL,NULL,NULL,NULL),(2,NULL,'2016-04-06 15:28:24',NULL,'Primary Nav',NULL,NULL,NULL,NULL,'主导航',NULL,NULL,NULL,1),(2001,NULL,'2016-04-06 15:28:24',NULL,'Home','layout/home',NULL,NULL,NULL,'首页',NULL,'/index',NULL,NULL),(2002,NULL,'2016-04-06 15:28:24',NULL,'Hot Sauces',NULL,NULL,NULL,NULL,'撒欢儿吃',NULL,'/dining',NULL,2),(2003,NULL,'2016-04-06 15:28:24',NULL,'Merchandise',NULL,NULL,NULL,NULL,'可劲儿喝',NULL,'/drinking',NULL,2),(2004,NULL,'2016-04-06 15:28:24',NULL,'Clearance',NULL,NULL,NULL,NULL,'放开玩儿',NULL,'/playing',NULL,2),(2005,NULL,'2016-04-06 15:28:24','Y','New to Hot Sauce?',NULL,NULL,'CHECK_QUANTITY',NULL,'New to Hot Sauce?',NULL,'/new-to-hot-sauce',NULL,2),(2006,NULL,'2016-04-06 15:28:24','Y','FAQs',NULL,NULL,NULL,NULL,'FAQs',NULL,'/faq',NULL,2),(9950,NULL,'2016-04-07 10:02:34','N',NULL,NULL,NULL,NULL,'<p>happy乐</p>','Happy乐',NULL,'/fun',NULL,2),(10000,NULL,'2016-04-12 14:33:27','Y',NULL,NULL,NULL,NULL,'优惠卡券','优惠卡券',NULL,'/promotion',NULL,2),(10050,NULL,'2016-05-04 16:55:34','N',NULL,NULL,NULL,NULL,NULL,'五折卡爆品轮播',NULL,NULL,NULL,1),(10100,NULL,'2016-05-04 22:12:49','N',NULL,NULL,NULL,NULL,NULL,'首页轮播',NULL,NULL,NULL,1),(10101,NULL,'2016-05-04 22:14:16','N',NULL,NULL,NULL,NULL,NULL,'五折卡线下商品',NULL,NULL,NULL,1);

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

insert  into `blc_category_media_map`(`BLC_CATEGORY_CATEGORY_ID`,`MEDIA_ID`,`MAP_KEY`) values (9950,99951,'primary'),(2002,100150,'primary'),(2003,100151,'primary'),(2004,100152,'primary');

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

insert  into `blc_category_product_xref`(`CATEGORY_PRODUCT_ID`,`DISPLAY_ORDER`,`CATEGORY_ID`,`PRODUCT_ID`) values (1451,'1.000000',2002,10251),(1453,'2.000000',2002,10252),(1454,'3.000000',2002,10253),(1455,'4.000000',2002,10254),(1456,'5.000000',2002,10255),(1457,'6.000000',2002,10256),(1458,'7.000000',2002,10257),(1459,'8.000000',2002,10258),(1460,'9.000000',2002,10259),(1461,'10.000000',2002,10260),(1462,'11.000000',2002,10261),(1463,'0.000000',10050,10251),(1464,'1.000000',10050,10252),(1465,'2.000000',10050,10253),(1466,'3.000000',10050,10254),(1467,'4.000000',10050,10255),(1468,'12.000000',2002,10262),(1469,'13.000000',2002,10263),(1470,'14.000000',2002,10264),(1471,'15.000000',2002,10265),(1472,'16.000000',2002,10266),(1500,'17.000000',2002,10300),(1501,'18.000000',2002,10301),(1502,'19.000000',2002,10302),(1503,'20.000000',2002,10303),(1504,'21.000000',2002,10304),(1509,'1.000000',2003,10305),(1510,'6.000000',2003,10306),(1513,'9.000000',2003,10309),(1602,'10.000000',9950,10307),(1603,'1.000000',9950,10308),(1604,'2.000000',9950,10310),(1605,'3.000000',9950,10311),(1606,'4.000000',9950,10350),(1607,'11.000000',9950,10351),(1608,'12.000000',9950,10352),(1609,'13.000000',9950,10353),(1610,'14.000000',9950,10354),(1611,'15.000000',9950,10355),(1612,'5.000000',9950,10356),(1613,'6.000000',9950,10357),(1614,'7.000000',9950,10358),(1615,'8.000000',9950,10400),(1616,'9.000000',9950,10401),(1617,'3.000000',2004,10402),(1620,'10.000000',2003,10404),(1621,'4.000000',2003,10405),(1622,'2.000000',2003,10406),(1623,'3.000000',2003,10407),(1624,'5.000000',2003,10408),(1625,'7.000000',2003,10409),(1626,'8.000000',2003,10410),(1628,'5.000000',2004,10411),(1629,'4.000000',2004,10412),(1630,'6.000000',2004,10413),(1631,'1.000000',2004,10414),(1632,'2.000000',2004,10415),(1633,'7.000000',2004,10416),(1634,'8.000000',2004,10417),(1635,'12.000000',2004,10418),(1636,'13.000000',2004,10419),(1637,'15.000000',2004,10420),(1638,'16.000000',2004,10421),(1639,NULL,10101,10422),(1640,'17.000000',2004,10423),(1641,'18.000000',2004,10424),(1644,'19.000000',2004,10425),(1645,'9.000000',2004,10426),(1646,'10.000000',2004,10427),(1647,'11.000000',2004,10428),(1648,NULL,10101,10429),(1649,NULL,10101,10430),(1650,NULL,10101,10431),(1651,NULL,10101,10432),(1652,NULL,10101,10433),(1653,NULL,10101,10434),(1654,NULL,10101,10435),(1655,NULL,10101,10436),(1656,NULL,10101,10437),(1657,NULL,10101,10438),(1658,NULL,10101,10439),(1659,NULL,10101,10440),(1660,NULL,10101,10441),(1661,NULL,10101,10442),(1662,NULL,10101,10443),(1663,NULL,10101,10444),(1664,NULL,10101,10445),(1665,NULL,10101,10446),(1666,NULL,10101,10447),(1667,NULL,10101,10448),(1668,NULL,10101,10449),(1669,NULL,10101,10450),(1670,NULL,10101,10451),(1671,NULL,10101,10452),(1672,NULL,10101,10453),(1673,NULL,10101,10454),(1674,NULL,10101,10455),(1675,NULL,10101,10456),(1676,NULL,10101,10457),(1677,NULL,10101,10458),(1678,NULL,10101,10459),(1679,NULL,10101,10460),(1680,NULL,10101,10461),(1681,NULL,10101,10462),(1682,NULL,10101,10463),(1683,NULL,10101,10464),(1684,NULL,10101,10465),(1685,NULL,10101,10466),(1686,NULL,10101,10467),(1687,NULL,10101,10468),(1688,NULL,10101,10469),(1689,NULL,10101,10470),(1690,NULL,10101,10471),(1691,NULL,10101,10472),(1692,NULL,10101,10473),(1693,NULL,10101,10474),(1694,NULL,10101,10475),(1695,NULL,10101,10476),(1696,NULL,10101,10477),(1697,NULL,10101,10478),(1698,NULL,10101,10479),(1699,NULL,10101,10480),(1700,NULL,10101,10481),(1701,NULL,10101,10482),(1702,NULL,10101,10483),(1703,NULL,10101,10484),(1704,NULL,10101,10485),(1705,NULL,10101,10486),(1706,NULL,10101,10487),(1707,NULL,10101,10488),(1708,NULL,10101,10489),(1709,NULL,10101,10490),(1710,NULL,10101,10491),(1711,NULL,10101,10492),(1712,NULL,10101,10493),(1713,NULL,10101,10494),(1714,NULL,10101,10495),(1715,NULL,10101,10496),(1716,NULL,10101,10497),(1717,NULL,10101,10498),(1718,NULL,10101,10499),(1719,NULL,10101,10500),(1720,NULL,10101,10501),(1721,NULL,10101,10502),(1722,NULL,10101,10503),(1723,NULL,10101,10504),(1724,NULL,10101,10505),(1725,NULL,10101,10506),(1726,NULL,10101,10507),(1727,NULL,10101,10508),(1728,NULL,10101,10509),(1729,NULL,10101,10510),(1730,NULL,10101,10511),(1731,NULL,10101,10512),(1732,NULL,10101,10513),(1733,NULL,10101,10514),(1734,NULL,10101,10515),(1735,NULL,10101,10516),(1736,NULL,10101,10517),(1737,NULL,10101,10518),(1738,NULL,10101,10519),(1739,NULL,10101,10520),(1740,NULL,10101,10521),(1741,NULL,10101,10522),(1742,NULL,10101,10523),(1743,NULL,10101,10524),(1744,NULL,10101,10525),(1745,NULL,10101,10526),(1746,NULL,10101,10527),(1747,NULL,10101,10528),(1751,'1.000000',2001,10251),(1752,'3.000000',2001,10252),(1753,'5.000000',2001,10253),(1754,'2.000000',2001,10308),(1755,'4.000000',2001,10310),(1756,'6.000000',2001,10311),(1757,'7.000000',2001,10254),(1758,'8.000000',2001,10255),(1759,'9.000000',2001,10256),(1760,'10.000000',2001,10356),(1761,'11.000000',2001,10357),(1762,'12.000000',2001,10358),(1763,'13.000000',2001,10400),(1764,'14.000000',2001,10401),(1765,'15.000000',2001,10305),(1766,'16.000000',2001,10414),(1767,'17.000000',2001,10406),(1768,'18.000000',2001,10415),(1769,'19.000000',2001,10407),(1770,'20.000000',2001,10402),(1771,'21.000000',2001,10405),(1772,'22.000000',2001,10412),(1773,'23.000000',2001,10350),(1774,'24.000000',2001,10408),(1775,'25.000000',2001,10411),(1776,'26.000000',2001,10306),(1777,'27.000000',2001,10413),(1778,'28.000000',2001,10257),(1779,'29.000000',2001,10416),(1780,'30.000000',2001,10409),(1781,'31.000000',2001,10258),(1782,'32.000000',2001,10417),(1783,'33.000000',2001,10410),(1784,'34.000000',2001,10259),(1785,'35.000000',2001,10309),(1786,'36.000000',2001,10426),(1787,'37.000000',2001,10260),(1788,'38.000000',2001,10404),(1789,'39.000000',2001,10307),(1790,'40.000000',2001,10427),(1791,'41.000000',2001,10261),(1792,'42.000000',2001,10351),(1793,'43.000000',2001,10428),(1794,'44.000000',2001,10262),(1795,'45.000000',2001,10352),(1796,'46.000000',2001,10418),(1797,'47.000000',2001,10263),(1798,'48.000000',2001,10419),(1799,'49.000000',2001,10353),(1800,'50.000000',2001,10354),(1801,'51.000000',2001,10264),(1802,'52.000000',2001,10265),(1803,'53.000000',2001,10420),(1804,'54.000000',2001,10355),(1805,'55.000000',2001,10266),(1806,'56.000000',2001,10421),(1807,'57.000000',2001,10458),(1808,'58.000000',2001,10423),(1809,'59.000000',2001,10424),(1810,'60.000000',2001,10425),(1811,'61.000000',2001,10301),(1812,'62.000000',2001,10302),(1813,'63.000000',2001,10303),(1814,'64.000000',2001,10445),(1851,'14.000000',2004,10530),(1901,'65.000000',2001,10530),(1902,'5.000000',10050,10256),(1903,'6.000000',10050,10308),(1904,'7.000000',10050,10310),(1905,'8.000000',10050,10311);

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

insert  into `blc_customer`(`CUSTOMER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`CHALLENGE_ANSWER`,`DEACTIVATED`,`EMAIL_ADDRESS`,`FIRST_NAME`,`LAST_NAME`,`PASSWORD`,`PASSWORD_CHANGE_REQUIRED`,`IS_PREVIEW`,`RECEIVE_EMAIL`,`IS_REGISTERED`,`TAX_EXEMPTION_CODE`,`USER_NAME`,`CHALLENGE_QUESTION_ID`,`LOCALE_CODE`) values (9000,0,'2016-05-06 19:16:28',NULL,NULL,NULL,0,'default','jackie','o1Py0tx91UJXWdtT_gD9xMdI5Rdo','o1Py0tx91UJXWdtT_gD9xMdI5Rdo{9000}',0,NULL,1,1,NULL,'o1Py0tx91UJXWdtT_gD9xMdI5Rdo',NULL,NULL);

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

insert  into `blc_customer_attribute`(`CUSTOMER_ATTR_ID`,`NAME`,`VALUE`,`CUSTOMER_ID`) values (6801,'country','中国',9000),(6802,'unionid','ocaz-sguoC7Z2I2wRPu-b3uojmhE',9000),(6803,'subscribe','1',9000),(6804,'city','成都',9000),(6805,'openid','o1Py0tx91UJXWdtT_gD9xMdI5Rdo',9000),(6806,'sex','1',9000),(6807,'groupid','0',9000),(6808,'language','zh_CN',9000),(6809,'remark','',9000),(6810,'subscribe_time','1462443541',9000),(6811,'province','四川',9000),(6812,'P2PData',NULL,9000),(6813,'nickname','jackie',9000),(6814,'headimgurl','http://wx.qlogo.cn/mmopen/RRTrAq8sOqGRPnjva2YQCSmT2OM9EUSsXicMx1EKWLxaibgOhVDuOQX3lKgiaOJrgf2lbXUtj9DdKpwCR60gpW9TBXWdSv2sFnq/0',9000);

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

insert  into `blc_customer_role`(`CUSTOMER_ROLE_ID`,`CUSTOMER_ID`,`ROLE_ID`) values (2901,9000,1);

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

insert  into `blc_email_tracking`(`EMAIL_TRACKING_ID`,`DATE_SENT`,`EMAIL_ADDRESS`,`TYPE`) values (1,'2016-04-07 10:43:32','scottfield@qq.com',NULL),(2,'2016-04-07 10:44:14','scottfield@qq.com',NULL),(51,'2016-04-11 11:00:30','scottfield@qq.com',NULL),(52,'2016-04-11 11:03:03','scottfield@qq.com',NULL),(101,'2016-04-11 13:29:49','scottfield@qq.com',NULL),(102,'2016-04-11 14:16:45','scottfield@qq.com',NULL),(151,'2016-04-12 10:13:15','scottfield@qq.com',NULL),(207,'2016-04-22 12:52:55','default',NULL),(251,'2016-04-22 14:36:22','default',NULL),(301,'2016-04-22 15:57:48','default',NULL),(302,'2016-04-22 15:59:55','default',NULL),(351,'2016-04-22 16:29:38','default',NULL),(352,'2016-04-22 18:17:42','default',NULL),(353,'2016-04-23 03:02:25','default',NULL),(354,'2016-04-23 09:07:10','default',NULL),(401,'2016-04-23 19:44:57','default',NULL),(451,'2016-04-23 20:13:35','default',NULL),(452,'2016-04-23 20:17:11','default',NULL),(501,'2016-04-24 17:43:42','default',NULL),(551,'2016-04-24 18:28:58','default',NULL),(552,'2016-04-24 18:37:19','default',NULL),(601,'2016-04-24 20:00:50','default',NULL),(651,'2016-04-25 15:15:11','default',NULL),(701,'2016-04-25 16:43:49','default',NULL),(751,'2016-04-26 15:17:21','default',NULL),(752,'2016-04-26 15:29:53','default',NULL),(801,'2016-04-26 18:32:41','default',NULL),(851,'2016-04-27 11:45:43','default',NULL),(901,'2016-04-27 17:28:23','default',NULL),(951,'2016-04-28 10:09:46','default',NULL),(1001,'2016-04-28 10:41:31','default',NULL),(1051,'2016-04-28 11:33:12','default',NULL),(1101,'2016-04-28 13:50:30','default',NULL),(1151,'2016-04-28 14:09:17','default',NULL),(1201,'2016-04-29 09:53:46','default',NULL),(1202,'2016-04-29 09:53:48','default',NULL),(1203,'2016-04-29 09:57:12','default',NULL),(1204,'2016-04-29 09:58:16','default',NULL),(1205,'2016-04-29 10:08:42','default',NULL),(1206,'2016-04-29 10:12:45','default',NULL),(1207,'2016-04-29 10:15:12','default',NULL),(1251,'2016-04-29 10:37:13','default',NULL),(1301,'2016-04-29 10:58:36','default',NULL),(1351,'2016-04-29 11:00:28','default',NULL),(1401,'2016-04-29 13:26:30','default',NULL),(1451,'2016-05-01 12:38:51','default',NULL),(1501,'2016-05-01 21:10:03','default',NULL),(1502,'2016-05-01 21:14:25','default',NULL),(1551,'2016-05-01 21:21:09','default',NULL),(1601,'2016-05-02 11:01:46','default',NULL),(1651,'2016-05-03 13:48:20','default',NULL),(1901,'2016-05-03 16:30:24','default',NULL),(1951,'2016-05-03 16:32:13','default',NULL),(1952,'2016-05-03 16:43:28','default',NULL),(1953,'2016-05-03 17:27:49','default',NULL),(2001,'2016-05-03 18:06:19','default',NULL),(2051,'2016-05-03 20:42:43','default',NULL),(2052,'2016-05-03 21:17:56','default',NULL),(2053,'2016-05-03 21:37:43','default',NULL),(2054,'2016-05-03 22:19:46','default',NULL),(2055,'2016-05-04 05:32:04','default',NULL),(2056,'2016-05-04 06:48:57','default',NULL),(2101,'2016-05-04 10:35:56','default',NULL),(2102,'2016-05-04 10:42:53','default',NULL),(2151,'2016-05-04 11:34:12','default',NULL),(2152,'2016-05-04 11:36:05','default',NULL),(2201,'2016-05-04 11:41:46','default',NULL),(2202,'2016-05-04 11:52:30','default',NULL),(2251,'2016-05-04 14:25:07','default',NULL),(2301,'2016-05-04 14:51:28','default',NULL),(2302,'2016-05-04 14:51:31','default',NULL),(2303,'2016-05-04 14:51:46','default',NULL),(2304,'2016-05-04 14:51:49','default',NULL),(2305,'2016-05-04 14:51:54','default',NULL),(2306,'2016-05-04 14:51:57','default',NULL),(2307,'2016-05-04 14:52:02','default',NULL),(2308,'2016-05-04 14:52:08','default',NULL),(2309,'2016-05-04 14:52:12','default',NULL),(2310,'2016-05-04 14:52:15','default',NULL),(2311,'2016-05-04 14:52:17','default',NULL),(2312,'2016-05-04 14:53:04','default',NULL),(2313,'2016-05-04 14:53:07','default',NULL),(2314,'2016-05-04 14:53:09','default',NULL),(2351,'2016-05-04 16:48:48','default',NULL),(2352,'2016-05-04 17:38:47','default',NULL),(2353,'2016-05-04 21:47:03','default',NULL),(2354,'2016-05-05 00:07:42','default',NULL),(2355,'2016-05-05 08:57:55','default',NULL),(2356,'2016-05-05 09:03:14','default',NULL),(2357,'2016-05-05 09:58:04','default',NULL),(2401,'2016-05-05 10:52:43','default',NULL),(2402,'2016-05-05 10:53:30','default',NULL),(2403,'2016-05-05 11:01:21','default',NULL),(2404,'2016-05-05 11:03:51','default',NULL),(2405,'2016-05-05 11:07:16','default',NULL),(2406,'2016-05-05 11:07:19','default',NULL),(2407,'2016-05-05 11:11:10','default',NULL),(2408,'2016-05-05 11:12:18','default',NULL),(2409,'2016-05-05 11:15:00','default',NULL),(2410,'2016-05-05 11:16:28','default',NULL),(2411,'2016-05-05 11:19:08','default',NULL),(2451,'2016-05-05 13:08:16','default',NULL),(2452,'2016-05-05 13:14:40','default',NULL),(2453,'2016-05-05 13:25:16','default',NULL),(2454,'2016-05-05 13:26:20','default',NULL),(2455,'2016-05-05 13:28:01','default',NULL),(2456,'2016-05-05 13:29:35','default',NULL),(2457,'2016-05-05 13:29:38','default',NULL),(2458,'2016-05-05 13:32:34','default',NULL),(2459,'2016-05-05 13:34:10','default',NULL),(2460,'2016-05-05 13:38:14','default',NULL),(2461,'2016-05-05 13:41:52','default',NULL),(2501,'2016-05-05 13:50:48','default',NULL),(2551,'2016-05-05 14:13:56','default',NULL),(2552,'2016-05-05 14:13:59','default',NULL),(2553,'2016-05-05 14:16:15','default',NULL),(2554,'2016-05-05 14:17:09','default',NULL),(2555,'2016-05-05 14:21:50','default',NULL),(2556,'2016-05-05 14:26:57','default',NULL),(2601,'2016-05-05 14:34:35','default',NULL),(2602,'2016-05-05 14:35:06','default',NULL),(2603,'2016-05-05 14:36:38','default',NULL),(2604,'2016-05-05 14:39:17','default',NULL),(2605,'2016-05-05 14:52:12','default',NULL),(2606,'2016-05-05 15:00:15','default',NULL),(2607,'2016-05-05 15:02:28','default',NULL),(2608,'2016-05-05 15:16:05','default',NULL),(2609,'2016-05-05 15:18:23','default',NULL),(2610,'2016-05-05 15:18:44','default',NULL),(2611,'2016-05-05 15:18:46','default',NULL),(2612,'2016-05-05 15:19:59','default',NULL),(2613,'2016-05-05 15:30:01','default',NULL),(2614,'2016-05-05 15:34:08','default',NULL),(2615,'2016-05-05 15:37:28','default',NULL),(2616,'2016-05-05 15:37:45','default',NULL),(2617,'2016-05-05 15:39:07','default',NULL),(2618,'2016-05-05 15:40:10','default',NULL),(2619,'2016-05-05 15:40:29','default',NULL),(2620,'2016-05-05 15:44:42','default',NULL),(2621,'2016-05-05 15:51:18','default',NULL),(2622,'2016-05-05 15:52:49','default',NULL),(2623,'2016-05-05 15:57:37','default',NULL),(2624,'2016-05-05 15:58:22','default',NULL),(2625,'2016-05-05 16:01:28','default',NULL),(2626,'2016-05-05 16:01:35','default',NULL),(2627,'2016-05-05 16:05:43','default',NULL),(2628,'2016-05-05 16:09:42','default',NULL),(2629,'2016-05-05 16:15:53','default',NULL),(2630,'2016-05-05 16:16:47','default',NULL),(2631,'2016-05-05 16:22:27','default',NULL),(2632,'2016-05-05 16:22:52','default',NULL),(2651,'2016-05-05 16:27:11','default',NULL),(2652,'2016-05-05 16:28:20','default',NULL),(2653,'2016-05-05 16:33:52','default',NULL),(2654,'2016-05-05 16:35:24','default',NULL),(2655,'2016-05-05 16:38:14','default',NULL),(2656,'2016-05-05 16:43:59','default',NULL),(2657,'2016-05-05 16:44:53','default',NULL),(2658,'2016-05-05 16:54:47','default',NULL),(2659,'2016-05-05 17:02:37','default',NULL),(2660,'2016-05-05 17:05:18','default',NULL),(2661,'2016-05-05 17:07:19','default',NULL),(2662,'2016-05-05 17:07:50','default',NULL),(2663,'2016-05-05 17:16:32','default',NULL),(2664,'2016-05-05 17:20:36','default',NULL),(2665,'2016-05-05 17:21:19','default',NULL),(2666,'2016-05-05 17:24:23','default',NULL),(2667,'2016-05-05 17:26:26','default',NULL),(2668,'2016-05-05 17:26:40','default',NULL),(2669,'2016-05-05 17:33:11','default',NULL),(2670,'2016-05-05 17:33:44','default',NULL),(2671,'2016-05-05 17:42:04','default',NULL),(2672,'2016-05-05 17:44:15','default',NULL),(2673,'2016-05-05 17:53:17','default',NULL),(2674,'2016-05-05 17:56:33','default',NULL),(2675,'2016-05-05 18:00:08','default',NULL),(2676,'2016-05-05 18:01:26','default',NULL),(2677,'2016-05-05 18:01:51','default',NULL),(2678,'2016-05-05 18:02:06','default',NULL),(2679,'2016-05-05 18:10:45','default',NULL),(2680,'2016-05-05 18:12:27','default',NULL),(2681,'2016-05-05 18:17:33','default',NULL),(2682,'2016-05-05 18:18:34','default',NULL),(2683,'2016-05-05 18:18:51','default',NULL),(2701,'2016-05-05 18:21:43','default',NULL),(2702,'2016-05-05 18:22:32','default',NULL),(2703,'2016-05-05 18:24:38','default',NULL),(2704,'2016-05-05 18:32:03','default',NULL),(2705,'2016-05-05 18:32:33','default',NULL),(2706,'2016-05-05 18:33:07','default',NULL),(2707,'2016-05-05 18:35:34','default',NULL),(2708,'2016-05-05 18:38:12','default',NULL),(2709,'2016-05-05 18:42:19','default',NULL),(2710,'2016-05-05 18:43:17','default',NULL),(2711,'2016-05-05 18:43:41','default',NULL),(2712,'2016-05-05 18:55:27','default',NULL),(2713,'2016-05-05 19:00:09','default',NULL),(2714,'2016-05-05 19:04:18','default',NULL),(2715,'2016-05-05 19:04:30','default',NULL),(2716,'2016-05-05 19:09:52','default',NULL),(2717,'2016-05-05 19:13:42','default',NULL),(2718,'2016-05-05 19:16:09','default',NULL),(2719,'2016-05-05 19:18:17','default',NULL),(2720,'2016-05-05 19:19:42','default',NULL),(2721,'2016-05-05 19:21:20','default',NULL),(2722,'2016-05-05 19:24:58','default',NULL),(2723,'2016-05-05 19:37:33','default',NULL),(2724,'2016-05-05 19:44:26','default',NULL),(2725,'2016-05-05 19:55:48','default',NULL),(2726,'2016-05-05 19:59:51','default',NULL),(2727,'2016-05-05 20:00:45','default',NULL),(2728,'2016-05-05 20:01:28','default',NULL),(2729,'2016-05-05 20:02:06','default',NULL),(2730,'2016-05-05 20:05:32','default',NULL),(2731,'2016-05-05 20:13:13','default',NULL),(2732,'2016-05-05 20:13:53','default',NULL),(2733,'2016-05-05 20:17:55','default',NULL),(2734,'2016-05-05 20:21:46','default',NULL),(2735,'2016-05-05 20:23:40','default',NULL),(2736,'2016-05-05 20:27:11','default',NULL),(2737,'2016-05-05 20:28:32','default',NULL),(2738,'2016-05-05 20:33:15','default',NULL),(2739,'2016-05-05 20:37:18','default',NULL),(2740,'2016-05-05 20:42:18','default',NULL),(2741,'2016-05-05 20:42:24','default',NULL),(2742,'2016-05-05 20:44:08','default',NULL),(2743,'2016-05-05 21:01:43','default',NULL),(2744,'2016-05-05 21:09:04','default',NULL),(2745,'2016-05-05 21:11:53','default',NULL),(2746,'2016-05-05 21:12:40','default',NULL),(2747,'2016-05-05 21:22:28','default',NULL),(2748,'2016-05-05 21:24:35','default',NULL),(2749,'2016-05-05 21:28:54','default',NULL),(2750,'2016-05-05 21:31:49','default',NULL),(2751,'2016-05-05 21:40:49','default',NULL),(2752,'2016-05-05 21:42:57','default',NULL),(2753,'2016-05-05 21:43:49','default',NULL),(2754,'2016-05-05 21:50:07','default',NULL),(2755,'2016-05-05 21:56:35','default',NULL),(2756,'2016-05-05 21:57:06','default',NULL),(2757,'2016-05-05 22:21:50','default',NULL),(2758,'2016-05-05 22:24:54','default',NULL),(2759,'2016-05-05 22:26:55','default',NULL),(2760,'2016-05-05 22:27:45','default',NULL),(2761,'2016-05-05 22:28:18','default',NULL),(2762,'2016-05-05 22:28:33','default',NULL),(2763,'2016-05-05 22:32:27','default',NULL),(2764,'2016-05-05 22:37:02','default',NULL),(2765,'2016-05-05 22:38:46','default',NULL),(2766,'2016-05-05 22:42:35','default',NULL),(2767,'2016-05-05 22:46:39','default',NULL),(2768,'2016-05-05 22:48:24','default',NULL),(2769,'2016-05-05 22:49:52','default',NULL),(2770,'2016-05-05 23:02:38','default',NULL),(2771,'2016-05-05 23:02:57','default',NULL),(2772,'2016-05-05 23:07:02','default',NULL),(2773,'2016-05-05 23:09:56','default',NULL),(2774,'2016-05-05 23:19:57','default',NULL),(2775,'2016-05-05 23:22:59','default',NULL),(2776,'2016-05-05 23:25:06','default',NULL),(2777,'2016-05-05 23:30:30','default',NULL),(2778,'2016-05-05 23:31:17','default',NULL),(2779,'2016-05-05 23:31:25','default',NULL),(2780,'2016-05-05 23:43:52','default',NULL),(2781,'2016-05-05 23:50:09','default',NULL),(2782,'2016-05-06 00:01:57','default',NULL),(2783,'2016-05-06 00:06:17','default',NULL),(2784,'2016-05-06 00:28:25','default',NULL),(2785,'2016-05-06 00:35:46','default',NULL),(2786,'2016-05-06 00:54:12','default',NULL),(2787,'2016-05-06 00:55:55','default',NULL),(2788,'2016-05-06 01:10:28','default',NULL),(2789,'2016-05-06 01:59:33','default',NULL),(2790,'2016-05-06 02:27:18','default',NULL),(2791,'2016-05-06 02:29:18','default',NULL),(2792,'2016-05-06 05:14:56','default',NULL),(2793,'2016-05-06 05:24:24','default',NULL),(2794,'2016-05-06 05:51:47','default',NULL),(2795,'2016-05-06 06:05:44','default',NULL),(2796,'2016-05-06 06:42:00','default',NULL),(2797,'2016-05-06 06:49:02','default',NULL),(2798,'2016-05-06 07:05:27','default',NULL),(2799,'2016-05-06 07:12:28','default',NULL),(2800,'2016-05-06 07:15:23','default',NULL),(2801,'2016-05-06 07:50:46','default',NULL),(2802,'2016-05-06 07:59:46','default',NULL),(2803,'2016-05-06 08:11:55','default',NULL),(2851,'2016-05-06 08:36:05','default',NULL),(2852,'2016-05-06 08:40:34','default',NULL),(2853,'2016-05-06 09:07:58','default',NULL),(2854,'2016-05-06 09:18:35','default',NULL),(2855,'2016-05-06 09:19:32','default',NULL),(2856,'2016-05-06 09:34:39','default',NULL),(2857,'2016-05-06 09:55:46','default',NULL),(2858,'2016-05-06 09:56:22','default',NULL),(2859,'2016-05-06 09:58:32','default',NULL),(2860,'2016-05-06 10:07:46','default',NULL),(2901,'2016-05-06 10:10:44','default',NULL),(2902,'2016-05-06 10:11:26','default',NULL),(2903,'2016-05-06 10:13:48','default',NULL),(2904,'2016-05-06 10:14:39','default',NULL),(2905,'2016-05-06 10:19:03','default',NULL),(2906,'2016-05-06 10:19:31','default',NULL),(2907,'2016-05-06 10:23:30','default',NULL),(2908,'2016-05-06 10:25:48','default',NULL),(2909,'2016-05-06 10:27:19','default',NULL),(2910,'2016-05-06 10:46:36','default',NULL),(2911,'2016-05-06 10:49:25','default',NULL),(2912,'2016-05-06 11:07:49','default',NULL),(2913,'2016-05-06 11:20:08','default',NULL),(2914,'2016-05-06 11:37:35','default',NULL),(2915,'2016-05-06 11:38:37','default',NULL),(2916,'2016-05-06 11:39:23','default',NULL),(2917,'2016-05-06 11:50:15','default',NULL),(2918,'2016-05-06 12:02:52','default',NULL),(2919,'2016-05-06 12:03:28','default',NULL),(2920,'2016-05-06 12:15:39','default',NULL),(2921,'2016-05-06 12:21:11','default',NULL),(2922,'2016-05-06 12:23:44','default',NULL),(2923,'2016-05-06 12:32:31','default',NULL),(2924,'2016-05-06 12:35:58','default',NULL),(2925,'2016-05-06 12:36:25','default',NULL),(2926,'2016-05-06 12:37:17','default',NULL),(2927,'2016-05-06 12:38:08','default',NULL),(2928,'2016-05-06 12:38:37','default',NULL),(2929,'2016-05-06 12:38:38','default',NULL),(2930,'2016-05-06 12:38:55','default',NULL),(2931,'2016-05-06 12:39:29','default',NULL),(2932,'2016-05-06 12:46:25','default',NULL),(2933,'2016-05-06 12:53:40','default',NULL),(2934,'2016-05-06 13:04:58','default',NULL),(2935,'2016-05-06 13:08:39','default',NULL),(2936,'2016-05-06 13:12:32','default',NULL),(2937,'2016-05-06 13:15:33','default',NULL),(2938,'2016-05-06 13:21:31','default',NULL),(2939,'2016-05-06 13:37:09','default',NULL),(2940,'2016-05-06 13:40:36','default',NULL),(2941,'2016-05-06 13:42:35','default',NULL),(2942,'2016-05-06 13:46:54','default',NULL),(2943,'2016-05-06 13:47:19','default',NULL),(2944,'2016-05-06 13:48:38','default',NULL),(2945,'2016-05-06 14:00:18','default',NULL),(2946,'2016-05-06 14:02:07','default',NULL),(2947,'2016-05-06 14:15:24','default',NULL),(2948,'2016-05-06 14:15:33','default',NULL),(2949,'2016-05-06 14:22:39','default',NULL),(2950,'2016-05-06 14:24:54','default',NULL),(2951,'2016-05-06 14:26:05','default',NULL),(2952,'2016-05-06 14:45:28','default',NULL),(2953,'2016-05-06 15:00:42','default',NULL),(2954,'2016-05-06 15:04:42','default',NULL),(2955,'2016-05-06 15:08:28','default',NULL),(2956,'2016-05-06 15:15:23','default',NULL),(2957,'2016-05-06 15:18:21','default',NULL),(2958,'2016-05-06 15:25:53','default',NULL),(2959,'2016-05-06 15:27:00','default',NULL),(2960,'2016-05-06 15:34:19','default',NULL),(2961,'2016-05-06 15:46:15','default',NULL),(2962,'2016-05-06 15:48:05','default',NULL),(2963,'2016-05-06 15:52:13','default',NULL),(2964,'2016-05-06 16:04:35','default',NULL),(2965,'2016-05-06 16:04:44','default',NULL),(2966,'2016-05-06 16:04:59','default',NULL),(2967,'2016-05-06 16:17:53','default',NULL),(2968,'2016-05-06 16:21:12','default',NULL),(2969,'2016-05-06 16:42:01','default',NULL),(2970,'2016-05-06 16:51:22','default',NULL),(2971,'2016-05-06 16:54:52','default',NULL),(2972,'2016-05-06 16:58:23','default',NULL),(2973,'2016-05-06 17:00:53','default',NULL),(2974,'2016-05-06 17:09:10','default',NULL),(2975,'2016-05-06 17:19:24','default',NULL),(2976,'2016-05-06 17:21:19','default',NULL),(2977,'2016-05-06 17:21:44','default',NULL),(2978,'2016-05-06 17:25:13','default',NULL),(2979,'2016-05-06 17:26:22','default',NULL),(2980,'2016-05-06 17:30:33','default',NULL),(2981,'2016-05-06 17:33:03','default',NULL),(2982,'2016-05-06 17:42:12','default',NULL),(2983,'2016-05-06 17:46:50','default',NULL),(2984,'2016-05-06 17:53:22','default',NULL),(2985,'2016-05-06 17:58:39','default',NULL),(2986,'2016-05-06 17:59:42','default',NULL),(3001,'2016-05-06 18:09:30','default',NULL),(3002,'2016-05-06 18:10:46','default',NULL),(3003,'2016-05-06 18:13:01','default',NULL),(3004,'2016-05-06 18:34:53','default',NULL),(3005,'2016-05-06 18:46:25','default',NULL),(3006,'2016-05-06 18:47:15','default',NULL),(3007,'2016-05-06 18:49:18','default',NULL),(3008,'2016-05-06 18:49:50','default',NULL),(3051,'2016-05-06 19:16:28','default',NULL);

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

insert  into `blc_id_generation`(`ID_TYPE`,`BATCH_SIZE`,`BATCH_START`,`ID_MIN`,`ID_MAX`,`version`) values ('org.broadleafcommerce.profile.core.domain.Customer',100,9100,NULL,NULL,91);

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

insert  into `blc_img_static_asset`(`HEIGHT`,`WIDTH`,`STATIC_ASSET_ID`) values (174,134,100103),(174,134,100104),(174,134,100105),(174,134,100106),(640,640,100107),(632,900,100108),(467,900,100109),(955,900,100110),(2308,900,100111),(640,640,100112),(783,900,100113),(783,900,100114),(905,900,100115),(905,900,100116),(713,900,100117),(1208,900,100118),(541,900,100119),(570,900,100120),(640,640,100121),(1014,900,100122),(974,900,100123),(1031,900,100124),(1112,900,100125),(1320,900,100126),(977,900,100127),(640,640,100128),(817,900,100129),(832,900,100130),(783,900,100131),(640,640,100132),(778,900,100133),(458,900,100134),(555,900,100135),(450,900,100136),(439,900,100137),(535,900,100138),(640,640,100139),(669,900,100140),(958,900,100141),(914,900,100142),(1562,900,100143),(640,640,100144),(1014,900,100145),(1000,900,100146),(1003,900,100147),(1588,900,100148),(985,900,100149),(842,900,100150),(640,640,100151),(649,900,100152),(382,900,100153),(487,900,100154),(552,900,100155),(765,900,100156),(676,900,100157),(672,900,100158),(680,900,100159),(660,900,100160),(873,900,100161),(640,640,100162),(673,900,100163),(486,900,100164),(580,900,100165),(507,900,100166),(506,900,100167),(640,640,100168),(627,900,100169),(674,900,100170),(1196,900,100171),(640,640,100172),(2055,900,100173),(1823,900,100174),(680,900,100175),(666,900,100176),(640,640,100177),(601,900,100178),(601,900,100179),(1740,900,100180),(640,640,100181),(606,900,100182),(444,900,100183),(475,900,100184),(599,900,100185),(593,900,100186),(640,640,100187),(1044,900,100188),(1018,900,100189),(600,900,100190),(526,900,100191),(775,900,100192),(1238,900,100193),(640,640,100194),(909,900,100195),(1738,900,100196),(1749,900,100197),(875,900,100198),(640,640,100199),(909,900,100200),(1738,900,100201),(1749,900,100202),(875,900,100203),(640,640,100250),(494,900,100251),(480,900,100252),(480,900,100253),(480,900,100254),(480,900,100255),(480,900,100256),(480,900,100257),(480,900,100258),(480,900,100259),(480,900,100260),(480,900,100261),(480,900,100262),(480,900,100263),(480,900,100264),(640,640,100265),(417,900,100266),(513,900,100267),(535,900,100268),(964,900,100269),(642,900,100270),(342,900,100271),(640,640,100272),(600,900,100273),(600,900,100274),(600,900,100275),(600,900,100276),(640,640,100277),(640,640,100278),(640,640,100279),(615,900,100280),(550,900,100281),(467,900,100282),(936,900,100283),(609,900,100284),(640,640,100285),(553,900,100286),(598,900,100287),(440,900,100288),(539,900,100289),(517,900,100290),(640,640,100291),(640,640,100292),(640,640,100293),(2413,900,100294),(2413,900,100295),(1080,900,100296),(670,900,100297),(670,900,100298),(640,640,100299),(2406,900,100300),(496,900,100301),(496,900,100302),(2374,900,100303),(2708,900,100304),(865,900,100305),(2708,900,100306),(640,640,100307),(494,900,100308),(1057,900,100309),(890,900,100310),(697,900,100311),(728,900,100312),(1161,900,100313),(640,640,100350),(502,900,100351),(1057,900,100352),(890,900,100353),(697,900,100354),(728,900,100355),(697,900,100356),(728,900,100357),(1161,900,100358),(640,640,100359),(859,900,100360),(861,900,100361),(861,900,100362),(861,900,100363),(900,900,100364),(861,900,100365),(640,640,100366),(2153,900,100367),(2109,900,100368),(2841,900,100369),(640,640,100370),(802,900,100371),(2290,900,100372),(439,900,100373),(446,900,100374),(724,900,100375),(640,640,100376),(802,900,100377),(802,900,100378),(640,640,100379),(853,900,100380),(515,900,100381),(594,900,100382),(1098,900,100383),(718,900,100384),(1067,900,100385),(640,640,100386),(436,900,100387),(280,900,100388),(420,900,100389),(460,900,100390),(280,900,100391),(420,900,100392),(407,900,100393),(412,900,100394),(468,900,100395),(450,900,100396),(343,900,100397),(640,640,100398),(1140,900,100399),(559,900,100400),(769,900,100401),(916,900,100402),(1056,900,100403),(800,800,100404),(431,732,100405),(627,732,100406),(522,732,100407),(454,732,100408),(546,732,100409),(829,732,100410),(532,800,100411),(532,800,100412),(640,640,100450),(800,800,100451),(640,640,100452),(851,900,100453),(540,900,100454),(661,900,100455),(419,380,100456),(779,750,100457),(725,750,100458),(791,750,100459),(384,750,100460),(781,750,100461),(640,640,100462),(731,900,100463),(714,900,100464),(551,900,100465),(858,900,100466),(844,900,100467),(710,900,100468),(640,640,100469),(823,900,100470),(1086,900,100471),(923,900,100472),(1163,900,100473),(751,900,100474),(640,640,100475),(823,900,100476),(1086,900,100477),(923,900,100478),(1163,900,100479),(640,640,100480),(659,900,100481),(659,900,100482),(659,900,100483),(660,900,100484),(659,900,100485),(659,900,100486),(659,900,100487),(659,900,100488),(506,900,100489),(640,640,100490),(640,640,100491),(361,900,100492),(640,640,100493),(281,900,100494),(375,900,100495),(463,900,100496),(286,900,100497),(370,900,100498),(466,900,100499),(297,900,100500),(504,900,100501),(263,900,100502),(373,900,100503),(361,900,100504),(317,900,100505),(334,900,100506),(344,900,100507),(320,900,100508),(567,900,100509),(557,900,100510),(640,640,100511),(281,900,100512),(375,900,100513),(463,900,100514),(297,900,100515),(506,900,100516),(306,900,100517),(395,900,100518),(336,900,100519),(288,900,100520),(369,900,100521),(344,900,100522),(317,900,100523),(566,900,100524),(556,900,100525),(640,640,100526),(1034,900,100527),(679,900,100528),(691,900,100529),(691,900,100530),(691,900,100531),(660,900,100532),(565,900,100533),(640,640,100534),(742,900,100535),(518,900,100536),(518,900,100537),(518,900,100538),(518,900,100539),(590,900,100540),(607,900,100541),(844,900,100542),(769,900,100543),(640,640,100544),(1813,900,100545),(1482,900,100546),(488,900,100547),(366,900,100548),(640,640,100549),(4504,900,100550),(3331,900,100551),(640,640,100552),(480,900,100553),(663,900,100554),(676,900,100555),(788,900,100556),(674,900,100557),(753,900,100558),(665,900,100559),(409,900,100560),(640,640,100561),(385,900,100562),(1039,900,100563),(572,900,100564),(1281,900,100565),(1142,900,100566),(573,900,100567),(611,900,100568),(876,900,100569),(605,900,100570),(458,900,100571),(645,900,100572),(640,640,100573),(640,640,100574),(720,900,100575),(2645,900,100576),(2123,900,100577),(640,640,100578),(1470,900,100579),(4600,900,100580),(811,900,100581),(873,900,100582),(640,640,100583),(1350,900,100584),(977,900,100585),(596,900,100586),(1350,900,100587),(640,640,100588),(1556,900,100589),(600,900,100590),(600,900,100591),(1350,900,100592),(640,640,100593),(640,640,100594),(2078,900,100595),(794,900,100596),(640,640,100597),(609,900,100598),(799,900,100599),(216,900,100600),(656,900,100601),(600,900,100602),(640,640,100603),(876,900,100604),(612,900,100605),(2880,900,100606),(640,640,100607),(640,640,100608),(640,640,100609),(640,640,100610),(640,640,100611),(640,640,100612),(640,640,100613),(640,640,100614),(640,640,100615),(640,640,100616),(640,640,100617),(640,640,100618),(640,640,100619),(640,640,100620),(640,640,100621),(640,640,100622),(640,640,100623),(640,640,100624),(640,640,100625),(640,640,100626),(640,640,100627),(640,640,100628),(640,640,100629),(640,640,100630),(640,640,100631),(640,640,100632),(640,640,100633),(640,640,100634),(640,640,100635),(640,640,100636),(640,640,100637),(640,640,100638),(640,640,100639),(640,640,100640),(640,640,100641),(640,640,100642),(640,640,100643),(640,640,100644),(640,640,100645),(640,640,100646),(640,640,100647),(640,640,100648),(640,640,100649),(640,640,100650),(640,640,100651),(640,640,100652),(640,640,100653),(640,640,100654),(640,640,100655),(640,640,100656),(640,640,100657),(640,640,100658),(640,640,100659),(640,640,100660),(640,640,100661),(640,640,100662),(640,640,100663),(640,640,100664),(640,640,100665),(640,640,100666),(640,640,100667),(640,640,100668),(640,640,100669),(640,640,100670),(640,640,100671),(640,640,100672),(640,640,100673),(640,640,100674),(640,640,100675),(640,640,100676),(640,640,100677),(640,640,100678),(640,640,100679),(640,640,100680),(640,640,100681),(640,640,100682),(640,640,100683),(640,640,100684),(640,640,100685),(640,640,100686),(640,640,100687),(640,640,100688),(640,640,100689),(640,640,100690),(640,640,100691),(640,640,100692),(640,640,100693),(640,640,100694),(640,640,100695),(640,640,100696),(640,640,100697),(640,640,100698),(640,640,100699),(640,640,100700),(640,640,100701),(640,640,100702),(800,800,100703),(640,640,100704),(640,640,100705),(640,640,100706),(640,640,100750),(640,640,100800),(1307,900,100801),(1644,900,100802),(1704,900,100803),(477,900,100804),(361,360,100805),(361,360,100806),(361,360,100807);

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

insert  into `blc_media`(`MEDIA_ID`,`ALT_TEXT`,`TAGS`,`TITLE`,`URL`) values (99951,'happy乐','happy乐','happy乐','/cmsstatic/category/99951/in_21-11.png'),(100150,'撒欢儿吃','撒欢儿吃','撒欢儿吃','/cmsstatic/category/100150/in_21.png'),(100151,'可劲儿喝','可劲儿喝','可劲儿喝','/cmsstatic/category/100151/in_21-09.png'),(100152,'放开玩儿','放开玩儿','放开玩儿','/cmsstatic/category/100152/in_21-10.png'),(100200,NULL,NULL,NULL,'/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg'),(100452,NULL,NULL,NULL,'/cmsstatic/product/10200/23122333.jpg'),(100453,NULL,NULL,NULL,'/cmsstatic/product/22796773.jpg'),(100454,NULL,NULL,NULL,'/cmsstatic/product/22826219.jpg'),(100455,NULL,NULL,NULL,'/cmsstatic/product/21587251.jpg'),(100456,NULL,NULL,NULL,'/cmsstatic/product/22599862.jpg'),(100457,NULL,NULL,NULL,'/cmsstatic/product/23337906.jpg'),(100458,NULL,NULL,NULL,'/cmsstatic/product/00289961.jpg'),(100459,NULL,NULL,NULL,'/cmsstatic/product/23155257.jpg'),(100460,NULL,NULL,NULL,'/cmsstatic/product/01884931.jpg'),(100461,NULL,NULL,NULL,'/cmsstatic/product/23325130.jpg'),(100462,NULL,NULL,NULL,'/cmsstatic/product/02380206.jpg'),(100463,NULL,NULL,NULL,'/cmsstatic/product/23194637.jpg'),(100464,NULL,NULL,NULL,'/cmsstatic/product/23194635.jpg'),(100465,NULL,NULL,NULL,'/cmsstatic/product/23333020.jpg'),(100466,NULL,NULL,NULL,'/cmsstatic/product/23133423.jpg'),(100467,NULL,NULL,NULL,'/cmsstatic/product/23133421.jpg'),(100500,NULL,NULL,NULL,'/cmsstatic/product/23332889.jpg'),(100501,NULL,NULL,NULL,'/cmsstatic/product/23301430.jpg'),(100502,NULL,NULL,NULL,'/cmsstatic/product/22919047.jpg'),(100503,NULL,NULL,NULL,'/cmsstatic/product/22700513.jpg'),(100504,NULL,NULL,NULL,'/cmsstatic/product/22700517.jpg'),(100505,NULL,NULL,NULL,'/cmsstatic/product/23303377.jpg'),(100506,NULL,NULL,NULL,'/cmsstatic/product/22651289.jpg'),(100507,NULL,NULL,NULL,'/cmsstatic/product/23317022.jpg'),(100508,NULL,NULL,NULL,'/cmsstatic/product/23309510.jpg'),(100510,NULL,NULL,NULL,'/cmsstatic/product/23158864.jpg'),(100511,NULL,NULL,NULL,'/cmsstatic/product/23309514.jpg'),(100512,NULL,NULL,NULL,'/cmsstatic/product/23331807.jpg'),(100551,NULL,NULL,NULL,'/cmsstatic/product/23331809.jpg'),(100552,NULL,NULL,NULL,'/cmsstatic/product/23335394.jpg'),(100553,NULL,NULL,NULL,'/cmsstatic/product/23330111.jpg'),(100554,NULL,NULL,NULL,'/cmsstatic/product/23110972.jpg'),(100555,NULL,NULL,NULL,'/cmsstatic/product/23110974.jpg'),(100556,NULL,NULL,NULL,'/cmsstatic/product/10355/23305868.jpg'),(100557,NULL,NULL,NULL,'/cmsstatic/product/10356/5.jpg'),(100558,NULL,NULL,NULL,'/cmsstatic/product/10356/6.jpg'),(100559,NULL,NULL,NULL,'/cmsstatic/product/10356/20997727.jpg'),(100560,NULL,NULL,NULL,'/cmsstatic/product/10357/3.png'),(100561,NULL,NULL,NULL,'/cmsstatic/product/10357/4.png'),(100562,NULL,NULL,NULL,'/cmsstatic/product/10357/20997703.jpg'),(100563,NULL,NULL,NULL,'/cmsstatic/product/10358/a2.jpg'),(100564,NULL,NULL,NULL,'/cmsstatic/product/10358/a3.jpg'),(100565,NULL,NULL,NULL,'/cmsstatic/product/10358/a1.jpg'),(100600,NULL,NULL,NULL,'/cmsstatic/product/10400/23262597.jpg'),(100601,NULL,NULL,NULL,'/cmsstatic/product/10401/TB1tj73GpXXXXaDaXXXXXXXXXXX_!!0-item_pic.jpg'),(100602,NULL,NULL,NULL,'/cmsstatic/product/10402/23335561.jpg'),(100604,NULL,NULL,NULL,'/cmsstatic/product/10404/12332.jpg'),(100605,NULL,NULL,NULL,'/cmsstatic/product/10405/23335196.jpg'),(100606,NULL,NULL,NULL,'/cmsstatic/product/10406/23214035.jpg'),(100607,NULL,NULL,NULL,'/cmsstatic/product/10407/23214037.jpg'),(100608,NULL,NULL,NULL,'/cmsstatic/product/10408/20184256.jpg'),(100609,NULL,NULL,NULL,'/cmsstatic/product/10409/Jersey-脱脂成人奶粉1000克-1.jpg'),(100610,NULL,NULL,NULL,'/cmsstatic/product/10410/Jersey-脱脂成人奶粉1000克.jpg'),(100611,NULL,NULL,NULL,'/cmsstatic/product/10411/23335304.jpg'),(100612,NULL,NULL,NULL,'/cmsstatic/product/10412/23337964.jpg'),(100613,NULL,NULL,NULL,'/cmsstatic/product/10413/22083955.jpg'),(100614,NULL,NULL,NULL,'/cmsstatic/product/10414/22894783.jpg'),(100615,NULL,NULL,NULL,'/cmsstatic/product/10415/22903205.jpg'),(100616,NULL,NULL,NULL,'/cmsstatic/product/10416/23337638.jpg'),(100617,NULL,NULL,NULL,'/cmsstatic/product/10417/23333399.jpg'),(100618,NULL,NULL,NULL,'/cmsstatic/product/10418/23331685.jpg'),(100619,NULL,NULL,NULL,'/cmsstatic/product/10419/23331689.jpg'),(100620,NULL,NULL,NULL,'/cmsstatic/product/10420/23331703.jpg'),(100621,NULL,NULL,NULL,'/cmsstatic/product/10421/23331705.jpg'),(100622,NULL,NULL,NULL,'/cmsstatic/product/10422/22434104.jpg'),(100623,NULL,NULL,NULL,'/cmsstatic/product/10423/23331711.jpg'),(100624,NULL,NULL,NULL,'/cmsstatic/product/10424/23331713.jpg'),(100625,NULL,NULL,NULL,'/cmsstatic/product/10425/23331695.jpg'),(100626,NULL,NULL,NULL,'/cmsstatic/product/10426/23329845.jpg'),(100627,NULL,NULL,NULL,'/cmsstatic/product/10427/23329843.jpg'),(100628,NULL,NULL,NULL,'/cmsstatic/product/10428/23329841.jpg'),(100630,NULL,NULL,NULL,'/cmsstatic/product/10429/20374167.jpg'),(100631,NULL,NULL,NULL,'/cmsstatic/product/10430/23325130.jpg'),(100632,NULL,NULL,NULL,'/cmsstatic/product/10431/23108478.jpg'),(100633,NULL,NULL,NULL,'/cmsstatic/product/10528/23329841.jpg'),(100634,NULL,NULL,NULL,'/cmsstatic/product/10527/23329843.jpg'),(100635,NULL,NULL,NULL,'/cmsstatic/product/10526/23329845.jpg'),(100636,NULL,NULL,NULL,'/cmsstatic/product/10512/23331809.jpg'),(100637,NULL,NULL,NULL,'/cmsstatic/product/10511/23331807.jpg'),(100638,NULL,NULL,NULL,'/cmsstatic/product/10510/23262595.jpg'),(100639,NULL,NULL,NULL,'/cmsstatic/product/10509/23262597.jpg'),(100640,NULL,NULL,NULL,'/cmsstatic/product/10507/20997703.jpg'),(100641,NULL,NULL,NULL,'/cmsstatic/product/10506/20997727.jpg'),(100642,NULL,NULL,NULL,'/cmsstatic/product/10505/23309514.jpg'),(100643,NULL,NULL,NULL,'/cmsstatic/product/10504/23309510.jpg'),(100644,NULL,NULL,NULL,'/cmsstatic/product/10503/23317022.jpg'),(100645,NULL,NULL,NULL,'/cmsstatic/product/10500/23337638.jpg'),(100646,NULL,NULL,NULL,'/cmsstatic/product/10499/22903205.jpg'),(100647,NULL,NULL,NULL,'/cmsstatic/product/10498/22894783.jpg'),(100648,NULL,NULL,NULL,'/cmsstatic/product/10497/23079232.jpg'),(100649,NULL,NULL,NULL,'/cmsstatic/product/10496/23225382.jpg'),(100650,NULL,NULL,NULL,'/cmsstatic/product/10495/23330568.jpg'),(100651,NULL,NULL,NULL,'/cmsstatic/product/10494/22894403.jpg'),(100652,NULL,NULL,NULL,'/cmsstatic/product/10493/23136512.jpg'),(100653,NULL,NULL,NULL,'/cmsstatic/product/10492/23275456.jpg'),(100654,NULL,NULL,NULL,'/cmsstatic/product/10491/22083955.jpg'),(100655,NULL,NULL,NULL,'/cmsstatic/product/10485/23305868.jpg'),(100656,NULL,NULL,NULL,'/cmsstatic/product/10483/23110974.jpg'),(100657,NULL,NULL,NULL,'/cmsstatic/product/10482/23110972.jpg'),(100658,NULL,NULL,NULL,'/cmsstatic/product/10481/23331695.jpg'),(100659,NULL,NULL,NULL,'/cmsstatic/product/10480/23331713.jpg'),(100660,NULL,NULL,NULL,'/cmsstatic/product/10479/23331711.jpg'),(100661,NULL,NULL,NULL,'/cmsstatic/product/10478/23331705.jpg'),(100662,NULL,NULL,NULL,'/cmsstatic/product/10477/23331703.jpg'),(100663,NULL,NULL,NULL,'/cmsstatic/product/10476/23331697.jpg'),(100664,NULL,NULL,NULL,'/cmsstatic/product/10475/23331689.jpg'),(100665,NULL,NULL,NULL,'/cmsstatic/product/10474/23331685.jpg'),(100666,NULL,NULL,NULL,'/cmsstatic/product/10473/23330111.jpg'),(100667,NULL,NULL,NULL,'/cmsstatic/product/10472/23337964.jpg'),(100668,NULL,NULL,NULL,'/cmsstatic/product/10432/23108468.jpg'),(100669,NULL,NULL,NULL,'/cmsstatic/product/10471/23335394.jpg'),(100670,NULL,NULL,NULL,'/cmsstatic/product/10470/23333399.jpg'),(100671,NULL,NULL,NULL,'/cmsstatic/product/10469/23335304.jpg'),(100672,NULL,NULL,NULL,'/cmsstatic/product/10433/扇贝肉.jpg'),(100673,NULL,NULL,NULL,'/cmsstatic/product/10468/23335561.jpg'),(100674,NULL,NULL,NULL,'/cmsstatic/product/10467/20184256.jpg'),(100675,NULL,NULL,NULL,'/cmsstatic/product/10434/23133395.jpg'),(100676,NULL,NULL,NULL,'/cmsstatic/product/10466/23214037.jpg'),(100677,NULL,NULL,NULL,'/cmsstatic/product/10465/23214035.jpg'),(100678,NULL,NULL,NULL,'/cmsstatic/product/10435/23113384.jpg'),(100679,NULL,NULL,NULL,'/cmsstatic/product/10464/23335196.jpg'),(100680,NULL,NULL,NULL,'/cmsstatic/product/10436/23303377.jpg'),(100681,NULL,NULL,NULL,'/cmsstatic/product/10462/23158864.jpg'),(100682,NULL,NULL,NULL,'/cmsstatic/product/10437/22651289.jpg'),(100683,NULL,NULL,NULL,'/cmsstatic/product/10438/21587251.jpg'),(100684,NULL,NULL,NULL,'/cmsstatic/product/10439/22209508.jpg'),(100685,NULL,NULL,NULL,'/cmsstatic/product/10459/23301430.jpg'),(100686,NULL,NULL,NULL,'/cmsstatic/product/10458/23332889.jpg'),(100687,NULL,NULL,NULL,'/cmsstatic/product/10457/22599862.jpg'),(100688,NULL,NULL,NULL,'/cmsstatic/product/10440/23334224.jpg'),(100689,NULL,NULL,NULL,'/cmsstatic/product/10456/23133423.jpg'),(100690,NULL,NULL,NULL,'/cmsstatic/product/10455/23133421.jpg'),(100691,NULL,NULL,NULL,'/cmsstatic/product/10454/23333020.jpg'),(100692,NULL,NULL,NULL,'/cmsstatic/product/10453/23194635.jpg'),(100693,NULL,NULL,NULL,'/cmsstatic/product/10441/23122333.jpg'),(100694,NULL,NULL,NULL,'/cmsstatic/product/10452/23194637.jpg'),(100695,NULL,NULL,NULL,'/cmsstatic/product/10442/01884931.jpg'),(100696,NULL,NULL,NULL,'/cmsstatic/product/10451/23155257.jpg'),(100697,NULL,NULL,NULL,'/cmsstatic/product/10450/00289961.jpg'),(100698,NULL,NULL,NULL,'/cmsstatic/product/10443/22919047.jpg'),(100699,NULL,NULL,NULL,'/cmsstatic/product/10449/22826219.jpg'),(100700,NULL,NULL,NULL,'/cmsstatic/product/10444/22700513.jpg'),(100701,NULL,NULL,NULL,'/cmsstatic/product/10448/22796773.jpg'),(100702,NULL,NULL,NULL,'/cmsstatic/product/10445/22700517.jpg'),(100703,NULL,NULL,NULL,'/cmsstatic/product/10447/02380206.jpg'),(100704,NULL,NULL,NULL,'/cmsstatic/product/10446/23337906.jpg'),(100705,NULL,NULL,NULL,'/cmsstatic/product/10501/阿巴町三代儿童智能手表.jpg'),(100706,NULL,NULL,NULL,'/cmsstatic/product/10484/纯棉空调被200230.jpg'),(100707,NULL,NULL,NULL,'/cmsstatic/product/10508/花姿青花尚品卷筒纸160g10.jpg'),(100708,NULL,NULL,NULL,'/cmsstatic/product/10502/华为畅享5S.jpg'),(100709,NULL,NULL,NULL,'/cmsstatic/product/10490/锦骏1比12遥控车.jpg'),(100710,NULL,NULL,NULL,'/cmsstatic/product/10513/亲子装（T恤）男装.jpg'),(100711,NULL,NULL,NULL,'/cmsstatic/product/10514/亲子装（T恤）男装.jpg'),(100712,NULL,NULL,NULL,'/cmsstatic/product/10515/亲子装（T恤）男装.jpg'),(100713,NULL,NULL,NULL,'/cmsstatic/product/10517/亲子装（T恤）女装.jpg'),(100714,NULL,NULL,NULL,'/cmsstatic/product/10518/亲子装（T恤）女装.jpg'),(100715,NULL,NULL,NULL,'/cmsstatic/product/10519/亲子装（T恤）女装.jpg'),(100716,NULL,NULL,NULL,'/cmsstatic/product/10522/亲子装（T恤）童装.jpg'),(100717,NULL,NULL,NULL,'/cmsstatic/product/10523/亲子装（T恤）童装.jpg'),(100718,NULL,NULL,NULL,'/cmsstatic/product/10486/维洁牛皮席150x195.jpg'),(100719,NULL,NULL,NULL,'/cmsstatic/product/10487/维洁牛皮席180x200.jpg'),(100720,NULL,NULL,NULL,'/cmsstatic/product/10488/14寸小龙哈彼自行车(男款).jpg'),(100721,NULL,NULL,NULL,'/cmsstatic/product/10489/14寸小龙哈彼自行车(女款).jpg'),(100722,NULL,NULL,NULL,'/cmsstatic/product/10463/ptj.jpg'),(100723,NULL,NULL,NULL,'/cmsstatic/product/10460/Jersey-脱脂成人奶粉1000克.jpg'),(100724,NULL,NULL,NULL,'/cmsstatic/product/10461/Jersey-全脂成人奶粉1000克.jpg'),(100725,NULL,NULL,NULL,'/cmsstatic/product/10521/亲子装（T恤）童装.jpg'),(100850,NULL,NULL,NULL,'/cmsstatic/product/10530/23331697-1.jpg'),(100851,NULL,NULL,NULL,'/cmsstatic/product/10520/花1家成女.jpg'),(100852,NULL,NULL,NULL,'/cmsstatic/product/10525/花1家小男.jpg'),(100853,NULL,NULL,NULL,'/cmsstatic/product/10524/花1家小女.jpg');

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

insert  into `blc_product`(`PRODUCT_ID`,`ARCHIVED`,`CAN_SELL_WITHOUT_OPTIONS`,`DISPLAY_TEMPLATE`,`IS_FEATURED_PRODUCT`,`MANUFACTURE`,`MODEL`,`URL`,`URL_KEY`,`DEFAULT_CATEGORY_ID`,`DEFAULT_SKU_ID`) values (1,'Y',NULL,NULL,1,'Blair\'s',NULL,'/hot-sauces/sudden_death_sauce',NULL,2002,NULL),(2,'Y',NULL,NULL,0,'Blair\'s',NULL,'/hot-sauces/sweet_death_sauce',NULL,2002,NULL),(3,'Y',NULL,NULL,0,'Salsa Express',NULL,'/hot-sauces/hoppin_hot_sauce',NULL,2002,NULL),(4,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,2002,NULL),(5,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,2002,NULL),(6,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,2002,NULL),(7,'Y',NULL,NULL,0,'Garden Row',NULL,'/hot-sauces/green_ghost',NULL,2002,NULL),(8,'Y',NULL,NULL,0,'D. L. Jardine\'s',NULL,'/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,2002,NULL),(9,'Y',NULL,NULL,1,'Figueroa Brothers',NULL,'/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,2002,NULL),(10,'Y',NULL,NULL,0,'Figueroa Brothers',NULL,'/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,2002,NULL),(11,'Y',NULL,NULL,0,'Brazos Legends',NULL,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,2002,NULL),(12,'Y',NULL,NULL,0,'Garden Row',NULL,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,2002,NULL),(13,'Y',NULL,NULL,1,'Brazos Legends',NULL,'/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,2002,NULL),(14,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,2002,NULL),(15,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_garlic_hot_sauce',NULL,2002,NULL),(16,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/scotch_bonnet_hot_sauce',NULL,2002,NULL),(17,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/insanity_sauce',NULL,2002,NULL),(18,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,2002,NULL),(19,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,2002,NULL),(100,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,2003,NULL),(200,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,2003,NULL),(300,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,2003,NULL),(400,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,2003,NULL),(500,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_mens',NULL,2003,NULL),(600,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_womens',NULL,2003,NULL),(992,'Y',0,NULL,0,NULL,NULL,'/bundle1',NULL,NULL,NULL),(993,'Y',0,NULL,0,NULL,NULL,'/bundle2',NULL,NULL,NULL),(9950,'Y',0,NULL,1,'香奈儿',NULL,'/chanel',NULL,9950,NULL),(10000,'Y',0,NULL,0,'美即',NULL,'/product-meiji-facialmask',NULL,2001,NULL),(10001,'Y',0,NULL,0,NULL,NULL,'/product-cleanclear-mask',NULL,2001,NULL),(10002,'Y',0,NULL,0,NULL,NULL,'/product-facial-mask',NULL,2001,NULL),(10050,'Y',0,NULL,0,NULL,NULL,'/product-custom',NULL,2001,NULL),(10100,'Y',0,NULL,0,NULL,NULL,'/dfddd',NULL,2001,NULL),(10101,'Y',0,NULL,0,NULL,NULL,'/test',NULL,2001,NULL),(10102,'Y',0,NULL,0,NULL,NULL,'/test2',NULL,2001,NULL),(10103,'Y',0,NULL,0,NULL,NULL,'/test3',NULL,2001,NULL),(10150,'Y',0,NULL,1,'美即面膜',NULL,'/test',NULL,2001,NULL),(10151,'Y',0,NULL,0,'hot saurce',NULL,'/test2',NULL,2001,NULL),(10152,'Y',0,NULL,1,'hot sauce',NULL,'/test3',NULL,2001,NULL),(10200,'Y',0,NULL,1,NULL,NULL,'/eat/huashenyou',NULL,2002,NULL),(10201,'Y',0,NULL,1,NULL,NULL,'/eat/luhuajiangyou',NULL,2002,NULL),(10202,'Y',0,NULL,1,NULL,NULL,'/eat/jiandamilkcoco',NULL,2002,NULL),(10250,'Y',0,NULL,1,NULL,NULL,'/eat/sfff',NULL,2002,NULL),(10251,'N',0,NULL,1,NULL,NULL,'/eat/luhuahuashengyou',NULL,2002,10351),(10252,'N',0,NULL,1,NULL,NULL,'/eat/luhuajiangyou',NULL,2002,10352),(10253,'N',0,NULL,1,NULL,NULL,'/eat/yidajxllcoco',NULL,2002,10353),(10254,'N',0,NULL,1,NULL,NULL,'/eat/dqyaxegg',NULL,2002,10354),(10255,'N',0,NULL,1,NULL,NULL,'/eat/zdxlysdbg',NULL,2002,10355),(10256,'N',0,NULL,1,NULL,NULL,'/eat/tqtgmlxm',NULL,2002,10356),(10257,'N',0,NULL,0,NULL,NULL,'/eat/jdbfl43',NULL,2002,10357),(10258,'N',0,NULL,0,NULL,NULL,'/eat/xfjdhsxm',NULL,2002,10358),(10259,'N',0,NULL,0,NULL,NULL,'/eat/whhgylzbbz',NULL,2002,10359),(10260,'N',0,NULL,0,NULL,NULL,'/eat/xxlnrl',NULL,2002,10360),(10261,'N',0,NULL,0,NULL,NULL,'/eat/tqtgrm',NULL,2002,10361),(10262,'N',0,NULL,0,NULL,NULL,'/eat/zzdewcmw',NULL,2002,10362),(10263,'N',0,NULL,0,NULL,NULL,'/eat/zzdewlylmbg',NULL,2002,10363),(10264,'N',0,NULL,0,NULL,NULL,'/eat/zzdewxtlyyrbg',NULL,2002,10364),(10265,'N',0,NULL,0,NULL,NULL,'/eat/hamuzyzc',NULL,2002,10365),(10266,'N',0,NULL,0,NULL,NULL,'/eat/hamumlzc20',NULL,2002,10366),(10300,'N',0,NULL,0,NULL,NULL,'/eat/derjsjsz',NULL,2002,10400),(10301,'N',0,NULL,0,NULL,NULL,'/eat/zzmywymp',NULL,2002,10401),(10302,'N',0,NULL,0,NULL,NULL,'/eat/jshmxgjmf',NULL,2002,10402),(10303,'N',0,NULL,0,NULL,NULL,'/eat/stpdxm',NULL,2002,10403),(10304,'N',0,NULL,0,NULL,NULL,'/eat/stprslm',NULL,2002,10404),(10305,'N',0,NULL,0,NULL,NULL,'/drink/xtmysnl',NULL,2003,10405),(10306,'N',0,NULL,0,NULL,NULL,'/drink/dmxqznnlhz',NULL,2003,10406),(10307,'N',0,NULL,0,NULL,NULL,'/player/wqhkletcmwyg',NULL,9950,10407),(10308,'N',0,NULL,1,NULL,NULL,'/player/lssxylm',NULL,9950,10408),(10309,'N',0,NULL,0,NULL,NULL,'/drink/bfbfjylsszslzhptj',NULL,2003,10409),(10310,'N',0,NULL,1,NULL,NULL,'/player/lssxxfyma',NULL,9950,10410),(10311,'N',0,NULL,1,NULL,NULL,'/player/amjlqscjjxye',NULL,9950,10411),(10350,'N',0,NULL,0,NULL,NULL,'/player/amjlqxsq',NULL,9950,10450),(10351,'N',0,NULL,0,NULL,NULL,'/player/bl100ssb',NULL,9950,10451),(10352,'N',0,NULL,0,NULL,NULL,'/player/xyohdsbxm',NULL,9950,10452),(10353,'N',0,NULL,0,NULL,NULL,'/player/jlqlzj150195',NULL,9950,10453),(10354,'N',0,NULL,0,NULL,NULL,'/player/jlxlzx180200',NULL,9950,10454),(10355,'N',0,NULL,0,NULL,NULL,'/player/ymsdtssjt',NULL,9950,10455),(10356,'N',0,NULL,1,NULL,NULL,'/player/sxxflqyrs',NULL,9950,10456),(10357,'N',0,NULL,1,NULL,NULL,'/player/ssxfsyxfl',NULL,9950,10457),(10358,'N',0,NULL,1,NULL,NULL,'/player/wzqwspjtz',NULL,9950,10458),(10400,'N',0,NULL,1,NULL,NULL,'/player/wcqwspcqsmjz',NULL,9950,10500),(10401,'N',0,NULL,1,NULL,NULL,'/player/zqhskmisbz',NULL,9950,10501),(10402,'N',0,NULL,0,NULL,NULL,'/happy/locklockcg',NULL,2004,10502),(10403,'Y',0,NULL,0,NULL,NULL,'/fiveCard/issue',NULL,10100,NULL),(10404,'N',0,NULL,0,NULL,NULL,'/drink/bfjylsszslzhptj',NULL,2003,10504),(10405,'N',0,NULL,0,NULL,NULL,'/drink/zjsdjpxmpj',NULL,2003,10505),(10406,'N',0,NULL,0,NULL,NULL,'/drink/wtnzwygxlzwdbylwghzw',NULL,2003,10506),(10407,'N',0,NULL,0,NULL,NULL,'/drink/wtnzwygxlzwdbylwgymw',NULL,2003,10507),(10408,'N',0,NULL,0,NULL,NULL,'/drink/jnfmyzchg',NULL,2003,10508),(10409,'N',0,NULL,0,NULL,NULL,'/drink/awnsrtznf',NULL,2003,10509),(10410,'N',0,NULL,0,NULL,NULL,'/drink/awnsrqznf',NULL,2003,10510),(10411,'N',0,NULL,0,NULL,NULL,'/happy/mcbxgfdsczg',NULL,2004,10511),(10412,'N',0,NULL,0,NULL,NULL,'/happy/lklkylslsb',NULL,2004,10512),(10413,'N',0,NULL,0,NULL,NULL,'/happy/mf1h5w40',NULL,2004,10513),(10414,'N',0,NULL,0,NULL,NULL,'/happy/mdldszlwyyk',NULL,2004,10514),(10415,'N',0,NULL,0,NULL,NULL,'/happy/sbedfb',NULL,2004,10515),(10416,'N',0,NULL,0,NULL,NULL,'/happy/kysdjcake100',NULL,2004,10516),(10417,'N',0,NULL,0,NULL,NULL,'/happy/dwgsdyslldw8990',NULL,2004,10517),(10418,'N',0,NULL,0,NULL,NULL,'/happy/flottxtamqfma1824',NULL,2004,10518),(10419,'N',0,NULL,0,NULL,NULL,'/happy/flottjdamqfma1818',NULL,2004,10519),(10420,'N',0,NULL,0,NULL,NULL,'/happy/flottssscdamqfma1826',NULL,2004,10520),(10421,'N',0,NULL,0,NULL,NULL,'/happy/flottscyxsbamqfma1822',NULL,2004,10521),(10422,'N',0,NULL,0,NULL,NULL,'/5zxxsp/jxtgll500',NULL,10101,10522),(10423,'N',0,NULL,0,NULL,NULL,'/happy/flottd4dybamqfma1825',NULL,2004,10523),(10424,'N',0,NULL,0,NULL,NULL,'/happy/flottjbamqfma1817',NULL,2004,10524),(10425,'N',0,NULL,0,NULL,NULL,'/happy/flottjbsdxglamdfma1815',NULL,2004,10525),(10426,'N',0,NULL,0,NULL,NULL,'/happy/233298452',NULL,2004,10526),(10427,'N',0,NULL,0,NULL,NULL,'/happy/233298436',NULL,2004,10527),(10428,'N',0,NULL,0,NULL,NULL,'/happy/233298428',NULL,2004,10528),(10429,'N',0,NULL,0,NULL,NULL,'/wzk/203741676',NULL,10101,10529),(10430,'N',0,NULL,0,NULL,NULL,'/wzk/233251308',NULL,10101,10530),(10431,'N',0,NULL,0,NULL,NULL,'/wzk/231084781',NULL,10101,10531),(10432,'N',0,NULL,0,NULL,NULL,'/wzk/231084684',NULL,10101,10532),(10433,'N',0,NULL,0,NULL,NULL,'/wzk/sbr1kgd',NULL,10101,10533),(10434,'N',0,NULL,0,NULL,NULL,'/wzk/231333951',NULL,10101,10534),(10435,'N',0,NULL,0,NULL,NULL,'/wzk/231133847',NULL,10101,10535),(10436,'N',0,NULL,0,NULL,NULL,'/wzk/233033777',NULL,10101,10536),(10437,'N',0,NULL,0,NULL,NULL,'/wzk/226512894',NULL,10101,10537),(10438,'N',0,NULL,0,NULL,NULL,'/wzk/215872517',NULL,10101,10538),(10439,'N',0,NULL,0,NULL,NULL,'/wzk/222095083',NULL,10101,10539),(10440,'N',0,NULL,0,NULL,NULL,'/wzk/233342249',NULL,10101,10540),(10441,'N',0,NULL,0,NULL,NULL,'/wzk/231223331',NULL,10101,10541),(10442,'N',0,NULL,0,NULL,NULL,'/wzk/18849318',NULL,10101,10542),(10443,'N',0,NULL,0,NULL,NULL,'/wzk/229190472',NULL,10101,10543),(10444,'N',0,NULL,0,NULL,NULL,'/wzk/227005139',NULL,10101,10544),(10445,'N',0,NULL,0,NULL,NULL,'/wzk/227005171',NULL,10101,10545),(10446,'N',0,NULL,0,NULL,NULL,'/wzk/233379061',NULL,10101,10546),(10447,'N',0,NULL,0,NULL,NULL,'/wzk/23802065',NULL,10101,10547),(10448,'N',0,NULL,0,NULL,NULL,'/wzk/227967739',NULL,10101,10548),(10449,'N',0,NULL,0,NULL,NULL,'/wzk/228262194',NULL,10101,10549),(10450,'N',0,NULL,0,NULL,NULL,'/wzk/2899612',NULL,10101,10550),(10451,'N',0,NULL,0,NULL,NULL,'/wzk/231552572',NULL,10101,10551),(10452,'N',0,NULL,0,NULL,NULL,'/wzk/231946376',NULL,10101,10552),(10453,'N',0,NULL,0,NULL,NULL,'/wzk/231946368',NULL,10101,10553),(10454,'N',0,NULL,0,NULL,NULL,'/wzk/233330208',NULL,10101,10554),(10455,'N',0,NULL,0,NULL,NULL,'/wzk/231334214',NULL,10101,10555),(10456,'N',0,NULL,0,NULL,NULL,'/wzk/231334230',NULL,10101,10556),(10457,'N',0,NULL,0,NULL,NULL,'/wzk/225998629',NULL,10101,10557),(10458,'N',0,NULL,0,NULL,NULL,'/wzk/233328890',NULL,10101,10558),(10459,'N',0,NULL,0,NULL,NULL,'/wzk/233014306',NULL,10101,10559),(10460,'N',0,NULL,0,NULL,NULL,'/wzk/233394788',NULL,10101,10560),(10461,'N',0,NULL,0,NULL,NULL,'/wzk/233394796',NULL,10101,10561),(10462,'N',0,NULL,0,NULL,NULL,'/wzk/231588658',NULL,10101,10562),(10463,'N',0,NULL,0,NULL,NULL,'/wzk/229580440',NULL,10101,10563),(10464,'N',0,NULL,0,NULL,NULL,'/wzk/233351965',NULL,10101,10564),(10465,'N',0,NULL,0,NULL,NULL,'/wzk/232140359',NULL,10101,10565),(10466,'N',0,NULL,0,NULL,NULL,'/wzk/232140375',NULL,10101,10566),(10467,'N',0,NULL,0,NULL,NULL,'/wzk/201842564',NULL,10101,10567),(10468,'N',0,NULL,0,NULL,NULL,'/wzk/233355618',NULL,10101,10568),(10469,'N',0,NULL,0,NULL,NULL,'/wzk/233353046',NULL,10101,10569),(10470,'N',0,NULL,0,NULL,NULL,'/wzk/233333991',NULL,10101,10570),(10471,'N',0,NULL,0,NULL,NULL,'/wzk/233353941',NULL,10101,10571),(10472,'N',0,NULL,0,NULL,NULL,'/wzk/233379649',NULL,10101,10572),(10473,'N',0,NULL,0,NULL,NULL,'/wzk/233301119',NULL,10101,10573),(10474,'N',0,NULL,0,NULL,NULL,'/wzk/233316868',NULL,10101,10574),(10475,'N',0,NULL,0,NULL,NULL,'/wzk/233316892',NULL,10101,10575),(10476,'N',0,NULL,0,NULL,NULL,'/wzk/233316973',NULL,10101,10576),(10477,'N',0,NULL,0,NULL,NULL,'/wzk/233317031',NULL,10101,10577),(10478,'N',0,NULL,0,NULL,NULL,'/wzk/233317058',NULL,10101,10578),(10479,'N',0,NULL,0,NULL,NULL,'/wzk/233317112',NULL,10101,10579),(10480,'N',0,NULL,0,NULL,NULL,'/wzk/233317139',NULL,10101,10580),(10481,'N',0,NULL,0,NULL,NULL,'/wzk/233316957',NULL,10101,10581),(10482,'N',0,NULL,0,NULL,NULL,'/wzk/231109725',NULL,10101,10582),(10483,'N',0,NULL,0,NULL,NULL,'/wzk/231109741',NULL,10101,10583),(10484,'N',0,NULL,0,NULL,NULL,'/wzk/cmktb200230',NULL,10101,10584),(10485,'N',0,NULL,0,NULL,NULL,'/wzk/233058680',NULL,10101,10585),(10486,'N',0,NULL,0,NULL,NULL,'/wzk/wjnpx150195',NULL,10101,10586),(10487,'N',0,NULL,0,NULL,NULL,'/wzk/wjnpx150200',NULL,10101,10587),(10488,'N',0,NULL,0,NULL,NULL,'/wzk/233392971',NULL,10101,10588),(10489,'N',0,NULL,0,NULL,NULL,'/wzk/233392998',NULL,10101,10589),(10490,'N',0,NULL,0,NULL,NULL,'/wzk/233392939',NULL,10101,10590),(10491,'N',0,NULL,0,NULL,NULL,'/wzk/220839557',NULL,10101,10591),(10492,'N',0,NULL,0,NULL,NULL,'/wzk/232754578',NULL,10101,10592),(10493,'N',0,NULL,0,NULL,NULL,'/wzk/231365128',NULL,10101,10593),(10494,'N',0,NULL,0,NULL,NULL,'/wzk/228944031',NULL,10101,10594),(10495,'N',0,NULL,0,NULL,NULL,'/wzk/233305688',NULL,10101,10595),(10496,'N',0,NULL,0,NULL,NULL,'/wzk/232253838',NULL,10101,10596),(10497,'N',0,NULL,0,NULL,NULL,'/wzk/230792324',NULL,10101,10597),(10498,'N',0,NULL,0,NULL,NULL,'/wzk/228947839',NULL,10101,10598),(10499,'N',0,NULL,0,NULL,NULL,'/wzk/229032052',NULL,10101,10599),(10500,'N',0,NULL,0,NULL,NULL,'/wzk/233376380',NULL,10101,10600),(10501,'N',0,NULL,0,NULL,NULL,'/wzk/abdsdetznsb',NULL,10101,10601),(10502,'N',0,NULL,0,NULL,NULL,'/wzk/hwcx5s',NULL,10101,10602),(10503,'N',0,NULL,0,NULL,NULL,'/wzk/233170227',NULL,10101,10603),(10504,'N',0,NULL,0,NULL,NULL,'/wzk/233095101',NULL,10101,10604),(10505,'N',0,NULL,0,NULL,NULL,'/wzk/233095144',NULL,10101,10605),(10506,'N',0,NULL,0,NULL,NULL,'/wzk/209977272',NULL,10101,10606),(10507,'N',0,NULL,0,NULL,NULL,'/wzk/209977035',NULL,10101,10607),(10508,'N',0,NULL,0,NULL,NULL,'/wzk/hzqhspjtz160',NULL,10101,10608),(10509,'N',0,NULL,0,NULL,NULL,'/wzk/232625972',NULL,10101,10609),(10510,'N',0,NULL,0,NULL,NULL,'/wzk/232625956',NULL,10101,10610),(10511,'N',0,NULL,0,NULL,NULL,'/wzk/233318070',NULL,10101,10611),(10512,'N',0,NULL,0,NULL,NULL,'/wzk/233318097',NULL,10101,10612),(10513,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqnzdxtx1001',NULL,10101,10613),(10514,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqnzdxtx1003',NULL,10101,10614),(10515,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqnzdxtx1002',NULL,10101,10615),(10516,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqahyjnzdxtx16B2016',NULL,10101,10616),(10517,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqnzdxtx16B1001',NULL,10101,10617),(10518,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqnzdxtx16B1003',NULL,10101,10618),(10519,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqnzdxtx16B1002',NULL,10101,10619),(10520,'N',0,NULL,0,NULL,NULL,'/wzk/axahyjnzdxtx16B2016',NULL,10101,10620),(10521,'N',0,NULL,0,NULL,NULL,'/wzk/axtzdxtx16B1003',NULL,10101,10621),(10522,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqtzdxtx16B1001',NULL,10101,10622),(10523,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqtzdxtx16B1002',NULL,10101,10623),(10524,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqahyjntzdxtx16B2016',NULL,10101,10624),(10525,'N',0,NULL,0,NULL,NULL,'/wzk/axyjqahyjntdxtx16B2016',NULL,10101,10625),(10526,'N',0,NULL,0,NULL,NULL,'/wzk/233298452',NULL,10101,10626),(10527,'N',0,NULL,0,NULL,NULL,'/wzk/233298436',NULL,10101,10627),(10528,'N',0,NULL,0,NULL,NULL,'/wzk/233298428',NULL,10101,10628),(10529,'Y',0,NULL,0,'daf',NULL,'/fdafdafda',NULL,2002,NULL),(10530,'N',0,NULL,0,NULL,NULL,'/happy/flott23331697',NULL,2004,10701),(10579,'Y',0,NULL,0,NULL,NULL,'/test/a12345333',NULL,2004,NULL);

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

insert  into `blc_product_attribute`(`PRODUCT_ATTRIBUTE_ID`,`NAME`,`SEARCHABLE`,`VALUE`,`PRODUCT_ID`) values (1200,'规格',0,'2L',10251),(1201,'规格',0,'800ml',10252),(1202,'规格',0,'12枚/盒',10254),(1203,'规格',0,'500g/盒',10255),(1204,'规格',0,'5kg/袋',10256),(1205,'规格',0,'43g',10257),(1206,'规格',0,'469g/包',10258),(1207,'规格',0,'360g*12/箱',10259),(1208,'规格',0,'500g',10260),(1209,'规格',0,'2kg',10261),(1210,'规格',0,'432g',10262),(1211,'规格',0,'432g',10263),(1212,'规格',0,'408g',10264),(1213,'规格',0,'20g',10265),(1214,'规格',0,'20g',10266),(1250,'规格',0,'600g+50g',10300),(1251,'规格',0,'12条装150克',10253),(1252,'规格',0,'1.458千克',10301),(1253,'规格',0,'1kg/袋',10302),(1254,'规格',0,'600g',10303),(1255,'规格',0,'540g',10304),(1256,'规格',0,'200gx12',10305),(1257,'规格',0,'200mlx12',10306),(1258,'规格',0,'75g',10307),(1259,'规格',0,'650ml',10308),(1260,'规格',0,'750ml',10309),(1261,'规格',0,'650ml',10310),(1262,'规格',0,'1KG',10311),(1300,'规格',0,'1KG',10350),(1301,'规格',0,'350ml-1178',10351),(1302,'规格',0,'30cm*50m',10352),(1303,'规格',0,'150x195cm',10353),(1304,'规格',0,'180x200cm',10354),(1305,'规格',0,'245x245cm',10355),(1306,'规格',0,'750ml',10356),(1307,'规格',0,'750ml',10357),(1308,'规格',0,'160g*10卷/提',10358),(1350,'规格',0,'390张x6',10400),(1351,'规格',0,'18包',10401),(1352,'规格',0,'LCA6325D',10402),(1353,'规格',0,'750ml',10404),(1354,'规格',0,'330mlx6',10405),(1355,'规格',0,'250mlx12',10406),(1356,'规格',0,'250mlx12',10407),(1357,'规格',0,'580g',10408),(1358,'规格',0,'1KG',10409),(1359,'规格',0,'1KG',10410),(1360,'规格',0,'MCZ108-30cm',10411),(1361,'规格',0,'HAP505-560ml',10412),(1362,'规格',0,'5W-40',10413),(1363,'规格',0,'FS40-13DR',10414),(1364,'规格',0,'CFXB40FC26-75',10415),(1365,'规格',0,'CAKE 100',10416),(1366,'规格',0,'DW8990',10417),(1367,'规格',0,'FMA-1824',10418),(1368,'规格',0,'FMA-1818',10419),(1369,'规格',0,'FMA-1826',10420),(1370,'规格',0,'FMA-1822',10421),(1371,'规格',0,'FMA-1825',10423),(1372,'规格',0,'FMA-1817',10424),(1373,'规格',0,'FMA-1815',10425),(1374,'规格',0,'2025-31B',10427),(1375,'规格',0,'2025-31A',10426),(1376,'规格',0,'2025-31C',10428),(1400,'规格',0,'FMA-1816',10530);

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

insert  into `blc_sandbox`(`SANDBOX_ID`,`AUTHOR`,`COLOR`,`DESCRIPTION`,`GO_LIVE_DATE`,`SANDBOX_NAME`,`SANDBOX_TYPE`,`PARENT_SANDBOX_ID`) values (1,NULL,'#0B9098',NULL,NULL,'Default','DEFAULT',NULL),(2,-1,NULL,NULL,NULL,'Default','USER',1),(51,1,NULL,NULL,NULL,'Default','USER',1),(101,51,NULL,NULL,NULL,'Default','USER',1);

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

insert  into `blc_sandbox_mgmt`(`SANDBOX_MGMT_ID`,`SANDBOX_ID`) values (1,1),(2,2),(51,51),(101,101);

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

insert  into `blc_sku`(`SKU_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`AVAILABLE_FLAG`,`DESCRIPTION`,`CONTAINER_SHAPE`,`DEPTH`,`DIMENSION_UNIT_OF_MEASURE`,`GIRTH`,`HEIGHT`,`CONTAINER_SIZE`,`WIDTH`,`DISCOUNTABLE_FLAG`,`FULFILLMENT_TYPE`,`INVENTORY_TYPE`,`IS_MACHINE_SORTABLE`,`LONG_DESCRIPTION`,`NAME`,`RETAIL_PRICE`,`SALE_PRICE`,`TAX_CODE`,`TAXABLE_FLAG`,`WEIGHT`,`WEIGHT_UNIT_OF_MEASURE`,`CURRENCY_CODE`,`DEFAULT_PRODUCT_ID`,`QUANTITY_AVAILABLE`) values (111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'5ml','800.00000','600.00000',NULL,NULL,NULL,NULL,NULL,NULL,19),(10002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'10ml','1600.00000','1200.00000',NULL,NULL,NULL,NULL,NULL,NULL,10),(10100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'fda','fdafa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20),(10351,NULL,'2016-05-04 15:45:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10200/1.jpg\"><img src=\"/cmsstatic/product/10200/2.jpg\"><img src=\"/cmsstatic/product/10200/3.jpg\"><img src=\"/cmsstatic/product/10200/4.jpg\">','鲁花压榨葵花仁油','29.90000','59.80000',NULL,NULL,NULL,NULL,NULL,10251,0),(10352,NULL,'2016-05-04 16:00:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/1-1.jpg\"><img src=\"/cmsstatic/product/2-1.jpg\"><img src=\"/cmsstatic/product/3.jpg\"><img src=\"/cmsstatic/product/4.jpg\"><img src=\"/cmsstatic/product/5.jpg\"><img src=\"/cmsstatic/product/6.jpg\">','鲁花自然鲜原香酱油','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10252,1994),(10353,NULL,'2016-05-04 16:02:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/1-2.jpg\"><img src=\"/cmsstatic/product/10253/2.jpg\"><img src=\"/cmsstatic/product/10253/3.jpg\"><img src=\"/cmsstatic/product/10253/4.jpg\"><img src=\"/cmsstatic/product/10253/5.jpg\"><img src=\"/cmsstatic/product/10253/6.jpg\">','健达夹心牛奶巧克力','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10253,1999),(10354,NULL,'2016-05-04 16:05:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10254/TB2zcGnjFXXXXaXXXXXXXXXXXXX_!!2191938031.jpg\"><img src=\"/cmsstatic/product/10254/TB2ZukieVXXXXaHXXXXXXXXXXXX_!!2191938031.jpg\"><img src=\"/cmsstatic/product/10254/TB2N03beVXXXXckXXXXXXXXXXXX_!!2191938031.jpg\">','德青源安心生态鲜鸡蛋','15.60000','7.80000',NULL,NULL,NULL,NULL,NULL,10254,2000),(10355,NULL,'2016-05-04 16:11:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10255/1.jpg\"><img src=\"/cmsstatic/product/10255/2.jpg\"><img src=\"/cmsstatic/product/10255/3.jpg\"><img src=\"/cmsstatic/product/10255/4.jpg\"><img src=\"/cmsstatic/product/10255/5.jpg\"><img src=\"/cmsstatic/product/10255/6.jpg\">','茱蒂丝奶油苏打饼干','38.80000','19.40000',NULL,NULL,NULL,NULL,NULL,10255,2000),(10356,NULL,'2016-05-04 16:14:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10256/1.jpg\"><img src=\"/cmsstatic/product/10256/2.jpg\"><img src=\"/cmsstatic/product/10256/3.jpg\"><img src=\"/cmsstatic/product/10256/4.jpg\">','泰拳泰国茉莉香米(原装进口)','99.80000','49.90000',NULL,NULL,NULL,NULL,NULL,10256,2000),(10357,NULL,'2016-05-04 16:17:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10257/1.jpg\"><img src=\"/cmsstatic/product/10257/2.jpg\"><img src=\"/cmsstatic/product/10257/3.jpg\"><img src=\"/cmsstatic/product/10257/4.jpg\"><img src=\"/cmsstatic/product/10257/5.jpg\"><img src=\"/cmsstatic/product/10257/6.jpg\">','健达缤纷乐','7.80000','3.90000',NULL,NULL,NULL,NULL,NULL,10257,2000),(10358,NULL,'2016-05-04 16:26:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10258/1.jpg\"><img src=\"/cmsstatic/product/10258/2.jpg\"><img src=\"/cmsstatic/product/10258/3.jpg\"><img src=\"/cmsstatic/product/10258/4.jpg\"><img src=\"/cmsstatic/product/10258/5.jpg\"><img src=\"/cmsstatic/product/10258/6.jpg\"><img src=\"/cmsstatic/product/10258/7.jpg\"><img src=\"/cmsstatic/product/10258/8.jpg\"><img src=\"/cmsstatic/product/10258/9.jpg\"><img src=\"/cmsstatic/product/10258/10.jpg\">','徐福记600蛋黄沙琪玛','15.80000','7.90000',NULL,NULL,NULL,NULL,NULL,10258,2000),(10359,NULL,'2016-05-04 16:31:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10259/1.jpg\"><img src=\"/cmsstatic/product/10259/2.jpg\"><img src=\"/cmsstatic/product/10259/3.jpg\"><img src=\"/cmsstatic/product/10259/4.jpg\"><img src=\"/cmsstatic/product/10259/5.jpg\">','娃哈哈桂圆莲子八宝粥','45.60000','22.80000',NULL,NULL,NULL,NULL,NULL,10259,1000),(10360,NULL,'2016-05-04 16:34:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10260/1.jpg\"><img src=\"/cmsstatic/product/10260/2.jpg\"><img src=\"/cmsstatic/product/10260/3.jpg\">','新西兰牛肉粒','59.60000','29.80000',NULL,NULL,NULL,NULL,NULL,10260,1000),(10361,NULL,'2016-05-04 16:49:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10261/1.jpg\"><img src=\"/cmsstatic/product/10261/2.jpg\"><img src=\"/cmsstatic/product/10261/3.jpg\"><img src=\"/cmsstatic/product/10261/4.jpg\">','泰拳泰国糯米','31.80000','15.90000',NULL,NULL,NULL,NULL,NULL,10261,1000),(10362,NULL,'2016-05-04 17:02:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10262/1.jpg\"><img src=\"/cmsstatic/product/10262/2.jpg\"><img src=\"/cmsstatic/product/10262/3.jpg\">','珍珍Dewberry奶油夹心饼干(草莓味)','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10262,500),(10363,NULL,'2016-05-04 17:13:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10263/1.jpg\"><img src=\"/cmsstatic/product/10263/2.jpg\"><img src=\"/cmsstatic/product/10263/3.jpg\"><img src=\"/cmsstatic/product/10263/4.jpg\"><img src=\"/cmsstatic/product/10263/5.jpg\">','珍珍Dewberry奶油夹心饼干(蓝莓味)','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10263,500),(10364,NULL,'2016-05-04 17:22:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10264/1.jpg\"><img src=\"/cmsstatic/product/10264/2.jpg\"><img src=\"/cmsstatic/product/10264/3.jpg\"><img src=\"/cmsstatic/product/10264/4.jpg\"><img src=\"/cmsstatic/product/10264/5.jpg\"><img src=\"/cmsstatic/product/10264/6.jpg\">','珍珍Dewberry雪挞奶油椰蓉夹心饼干','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10264,500),(10365,NULL,'2016-05-04 17:34:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10265/1.jpg\"><img src=\"/cmsstatic/product/10265/2.jpg\"><img src=\"/cmsstatic/product/10265/3.jpg\"><img src=\"/cmsstatic/product/10265/4.jpg\">','HAMU竹盐紫菜','12.40000','6.20000',NULL,NULL,NULL,NULL,NULL,10265,500),(10366,NULL,'2016-05-04 17:37:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10266/1.jpg\"><img src=\"/cmsstatic/product/10266/2.jpg\"><img src=\"/cmsstatic/product/10266/3.jpg\"><img src=\"/cmsstatic/product/10266/4.jpg\">','HAMU迷你紫菜','12.40000','6.20000',NULL,NULL,NULL,NULL,NULL,10266,500),(10400,NULL,'2016-05-04 18:44:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10300/1.jpg\"><img src=\"/cmsstatic/product/10300/2.png\"><img src=\"/cmsstatic/product/10300/3.png\"><img src=\"/cmsstatic/product/10300/4.png\"><img src=\"/cmsstatic/product/10300/5.png\"><img src=\"/cmsstatic/product/10300/6.png\"><img src=\"/cmsstatic/product/10300/7.png\"><img src=\"/cmsstatic/product/10300/8.png\"><img src=\"/cmsstatic/product/10300/9.png\"><img src=\"/cmsstatic/product/10300/10.png\"><img src=\"/cmsstatic/product/10300/11.png\"><img src=\"/cmsstatic/product/10300/12.png\"><img src=\"/cmsstatic/product/10300/13.png\"><img src=\"/cmsstatic/product/10300/14.png\">','东阿人家什锦山楂','31.80000','15.90000',NULL,NULL,NULL,NULL,NULL,10300,1000),(10401,NULL,'2016-05-04 18:52:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10301/a1_01.png\"><img src=\"/cmsstatic/product/10301/a1_02.png\"><img src=\"/cmsstatic/product/10301/a1_03.png\"><img src=\"/cmsstatic/product/10301/a1_04.png\"><img src=\"/cmsstatic/product/10301/a1_05.png\"><img src=\"/cmsstatic/product/10301/a1_06.jpg\">','早早麦原味燕麦片','33.80000','16.90000',NULL,NULL,NULL,NULL,NULL,10301,2000),(10402,NULL,'2016-05-04 19:02:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10302/1.jpg\"><img src=\"/cmsstatic/product/10302/2.jpg\"><img src=\"/cmsstatic/product/10302/3.jpg\"><img src=\"/cmsstatic/product/10302/4.jpg\">','金沙河麦芯高筋小麦粉','9.80000','4.90000',NULL,NULL,NULL,NULL,NULL,10302,2000),(10403,NULL,'2016-05-04 19:06:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'寿桃牌刀削面3人前','11.80000','5.90000',NULL,NULL,NULL,NULL,NULL,10303,2000),(10404,NULL,'2016-05-04 19:09:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'寿桃牌日式拉面3人前','11.80000','5.90000',NULL,NULL,NULL,NULL,NULL,10304,2000),(10405,NULL,'2016-05-05 09:42:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10305/1.jpg\"><img src=\"/cmsstatic/product/10305/2.jpg\"><img src=\"/cmsstatic/product/10305/3.jpg\"><img src=\"/cmsstatic/product/10305/4.jpg\"><img src=\"/cmsstatic/product/10305/5.jpg\">','现代牧业酸牛奶','59.80000','29.90000',NULL,NULL,NULL,NULL,NULL,10305,1000),(10406,NULL,'2016-05-05 09:51:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10306/1.jpg\"><img src=\"/cmsstatic/product/10306/2.jpg\"><img src=\"/cmsstatic/product/10306/3.jpg\"><img src=\"/cmsstatic/product/10306/4.jpg\"><img src=\"/cmsstatic/product/10306/5.jpg\"><a href=\"http://discount.lzzyad.com:8081/product/10306#\"></a>','多美鲜全脂牛奶礼盒装','51.60000','25.80000',NULL,NULL,NULL,NULL,NULL,10306,1000),(10407,NULL,'2016-05-05 09:56:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'芜琼花快乐儿童草莓味牙膏（套装）','44.80000','22.40000',NULL,NULL,NULL,NULL,NULL,10307,500),(10408,NULL,'2016-05-05 10:00:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10308/1.jpg\"><img src=\"/cmsstatic/product/10308/2.jpg\"><img src=\"/cmsstatic/product/10308/3.jpg\">','力士奢选香氛沐浴乳恒永浪漫','49.00000','24.50000',NULL,NULL,NULL,NULL,NULL,10308,500),(10409,NULL,'2016-05-05 09:59:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/1-4.jpg\"><img src=\"/cmsstatic/product/2-2.jpg\"><img src=\"/cmsstatic/product/3-1.jpg\"><img src=\"/cmsstatic/product/4-1.jpg\">','奔富洛神山庄梅洛红葡萄酒','79.80000','39.90000',NULL,NULL,NULL,NULL,NULL,10309,200),(10410,NULL,'2016-05-05 10:04:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10310/3.jpg\"><img src=\"/cmsstatic/product/2-3.jpg\">','力士奢选香氛沐浴乳恒永慕爱','49.00000','24.50000',NULL,NULL,NULL,NULL,NULL,10310,500),(10411,NULL,'2016-05-05 10:08:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10311/1.jpg\"><img src=\"/cmsstatic/product/10311/2.jpg\"><img src=\"/cmsstatic/product/10311/3.jpg\"><img src=\"/cmsstatic/product/10311/4.jpg\"><img src=\"/cmsstatic/product/10311/5.jpg\"><img src=\"/cmsstatic/product/10311/6.jpg\">','奥妙净蓝全效深层洁净洗衣液立袋壶嘴装','19.90000','8.80000',NULL,NULL,NULL,NULL,NULL,10311,2000),(10450,NULL,'2016-05-05 10:16:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/1-6.jpg\"><img src=\"/cmsstatic/product/2-4.jpg\"><img src=\"/cmsstatic/product/3-3.jpg\"><img src=\"/cmsstatic/product/10350/4.jpg\"><img src=\"/cmsstatic/product/10350/5.jpg\"><img src=\"/cmsstatic/product/10350/6.jpg\">','奥妙净蓝全效水清莲香深层洁净洗衣液立袋壶嘴装','19.90000','8.80000',NULL,NULL,NULL,NULL,NULL,10350,2000),(10451,NULL,'2016-05-05 10:20:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10351/TB2QAxSlXXXXXXpXXXXXXXXXXXX_!!2534458023.jpg\"><img src=\"/cmsstatic/product/10351/TB2jiBhlXXXXXbCXpXXXXXXXXXX_!!2534458023.jpg\"><img src=\"/cmsstatic/product/10351/TB2ATNklXXXXXbbXpXXXXXXXXXX_!!2534458023.jpg\"><img src=\"/cmsstatic/product/10351/TB27J8wlXXXXXXbXpXXXXXXXXXX_!!2534458023.jpg\"><img src=\"/cmsstatic/product/10351/TB2aodClXXXXXb3XXXXXXXXXXXX_!!2534458023.jpg\">','便利100随身杯','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10351,500),(10452,NULL,'2016-05-05 10:28:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/1-7.jpg\"><img src=\"/cmsstatic/product/2-5.jpg\"><img src=\"/cmsstatic/product/3-4.jpg\">','希艺欧滑刀式保鲜膜CEO-6726','23.80000','11.90000',NULL,NULL,NULL,NULL,NULL,10352,1000),(10453,NULL,'2016-05-05 10:32:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/1 .jpg\"><img src=\"/cmsstatic/product/2-6.jpg\"><img src=\"/cmsstatic/product/3..jpg\"><img src=\"/cmsstatic/product/4-3.jpg\"><img src=\"/cmsstatic/product/5-2.jpg\">','简丽清凉竹席150x195cm','198.00000','99.00000',NULL,NULL,NULL,NULL,NULL,10353,200),(10454,NULL,'2016-05-05 10:35:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<p><img src=\"/cmsstatic/product/1 .jpg\"><img src=\"/cmsstatic/product/2-6.jpg\"><img src=\"/cmsstatic/product/3..jpg\"><img src=\"/cmsstatic/product/4-3.jpg\"><img src=\"/cmsstatic/product/5-2.jpg\"><br></p>','简丽清凉竹席180x200cm','258.00000','129.00000',NULL,NULL,NULL,NULL,NULL,10354,100),(10455,NULL,'2016-05-05 10:39:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10355/1.jpg\"><img src=\"/cmsstatic/product/10355/2.jpg\"><img src=\"/cmsstatic/product/10355/3.jpg\"><img src=\"/cmsstatic/product/10355/4.jpg\"><img src=\"/cmsstatic/product/10355/5.jpg\"><img src=\"/cmsstatic/product/10355/6.jpg\">','远梦柔缎天丝四件套','538.00000','269.00000',NULL,NULL,NULL,NULL,NULL,10355,100),(10456,NULL,'2016-05-05 10:42:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10356/1.jpg\"><img src=\"/cmsstatic/product/10356/2-1.jpg\"><img src=\"/cmsstatic/product/10356/3-1.jpg\"><img src=\"/cmsstatic/product/10356/8.jpg\"><img src=\"/cmsstatic/product/10356/9.jpg\"><img src=\"/cmsstatic/product/10356/10.jpg\">','沙宣洗发露清盈顺柔','99.80000','53.80000',NULL,NULL,NULL,NULL,NULL,10356,500),(10457,NULL,'2016-05-05 10:51:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10357/1.jpg\"><img src=\"/cmsstatic/product/10357/2.jpg\"><img src=\"/cmsstatic/product/10357/3.png\"><img src=\"/cmsstatic/product/10357/4.png\"><img src=\"/cmsstatic/product/10357/5.jpg\">','沙宣修护水养洗发露','99.80000','53.80000',NULL,NULL,NULL,NULL,NULL,10357,500),(10458,NULL,'2016-05-05 10:55:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10358/b1_02.png\"><img src=\"/cmsstatic/product/10358/b1_04.png\"><img src=\"/cmsstatic/product/10358/b1_05.png\"><img src=\"/cmsstatic/product/10358/b1_07.jpg\">','花姿青花尚品卷筒纸','59.80000','16.80000',NULL,NULL,NULL,NULL,NULL,10358,2000),(10500,NULL,'2016-05-05 12:03:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'花姿青花尚品抽取式面巾纸','25.80000','12.90000',NULL,NULL,NULL,NULL,NULL,10400,2000),(10501,NULL,'2016-05-05 12:10:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'花姿青花尚品迷你手帕纸','9.80000','4.90000',NULL,NULL,NULL,NULL,NULL,10401,2000),(10502,NULL,'2016-05-05 12:23:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10402/1.jpg\"><img src=\"/cmsstatic/product/10402/2.jpg\"><img src=\"/cmsstatic/product/10402/3.jpg\">','LOCK&LOCKStone32cm炒锅','458.00000','229.00000',NULL,NULL,NULL,NULL,NULL,10402,100),(10504,NULL,'2016-05-05 14:10:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10404/b1.jpg\"><img src=\"/cmsstatic/product/10404/b3.jpg\"><img src=\"/cmsstatic/product/10404/b4.jpg\"><img src=\"/cmsstatic/product/10404/b5.jpg\"><img src=\"/cmsstatic/product/10404/b6.jpg\">','奔富酒园洛神山庄设拉子红葡萄酒','79.80000','39.90000',NULL,NULL,NULL,NULL,NULL,10404,200),(10505,NULL,'2016-05-05 14:40:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10405/1.jpg\"><img src=\"/cmsstatic/product/10405/2.jpg\"><img src=\"/cmsstatic/product/10405/3.jpg\"><img src=\"/cmsstatic/product/10405/4.jpg\"><img src=\"/cmsstatic/product/10405/5.jpg\"><img src=\"/cmsstatic/product/10405/6.jpg\">','珠江10°精品小麦啤酒','15.60000','7.80000',NULL,NULL,NULL,NULL,NULL,10405,2000),(10506,NULL,'2016-05-05 14:46:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<hr><p><img src=\"/cmsstatic/product/10406/1.gif\"><img src=\"/cmsstatic/product/10406/2.gif\"><img src=\"/cmsstatic/product/10406/3.gif\"><img src=\"/cmsstatic/product/10406/4.gif\"><img src=\"/cmsstatic/product/10406/5.jpg\"><br></p>','维他奶植物阳光系列植物蛋白饮料（五谷红枣味）','48.00000','23.90000',NULL,NULL,NULL,NULL,NULL,10406,1000),(10507,NULL,'2016-05-05 14:50:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10407/1.gif\"><img src=\"/cmsstatic/product/10407/2.gif\"><img src=\"/cmsstatic/product/10407/3.gif\"><img src=\"/cmsstatic/product/10407/4.gif\">','维他奶植物阳光系列植物蛋白饮料（五谷燕麦味）','48.00000','23.90000',NULL,NULL,NULL,NULL,NULL,10407,1000),(10508,NULL,'2016-05-05 15:01:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10408/1.jpg\"><img src=\"/cmsstatic/product/10408/2.jpg\"><img src=\"/cmsstatic/product/10408/3.jpg\"><img src=\"/cmsstatic/product/10408/4.jpg\"><img src=\"/cmsstatic/product/10408/5.jpg\"><img src=\"/cmsstatic/product/10408/6.jpg\"><img src=\"/cmsstatic/product/10408/7.jpg\"><img src=\"/cmsstatic/product/10408/8.jpg\">','全南蜂蜜柚子茶韩国','51.80000','25.90000',NULL,NULL,NULL,NULL,NULL,10408,200),(10509,NULL,'2016-05-05 15:10:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<p><img src=\"/cmsstatic/product/10409/1-1.jpg\"><img src=\"/cmsstatic/product/10409/2-1.jpg\"><img src=\"/cmsstatic/product/10409/3-1.jpg\"><img src=\"/cmsstatic/product/10409/4.jpg\"><img src=\"/cmsstatic/product/10409/5-1.jpg\"><img src=\"/cmsstatic/product/10409/6.jpg\"><img src=\"/cmsstatic/product/10409/7.jpg\"><img src=\"/cmsstatic/product/10409/8-1.jpg\"><img src=\"/cmsstatic/product/10409/9.jpg\"><img src=\"/cmsstatic/product/10409/10.jpg\"><img src=\"/cmsstatic/product/10409/11.jpg\"><img src=\"/cmsstatic/product/10409/12.jpg\"><img src=\"/cmsstatic/product/10409/13.jpg\"><img src=\"/cmsstatic/product/10409/14.jpg\"><br></p>','爱薇牛速溶脱脂奶粉','118.00000','59.00000',NULL,NULL,NULL,NULL,NULL,10409,1000),(10510,NULL,'2016-05-05 15:31:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10410/1.jpg\"><img src=\"/cmsstatic/product/10410/2.jpg\"><img src=\"/cmsstatic/product/10410/3.jpg\"><img src=\"/cmsstatic/product/10410/4.jpg\"><img src=\"/cmsstatic/product/10410/5.jpg\"><img src=\"/cmsstatic/product/10410/6.jpg\"><img src=\"/cmsstatic/product/10410/7.jpg\"><img src=\"/cmsstatic/product/10410/8.jpg\"><img src=\"/cmsstatic/product/10410/9.jpg\"><img src=\"/cmsstatic/product/10410/10.jpg\"><img src=\"/cmsstatic/product/10410/11.jpg\"><img src=\"/cmsstatic/product/10410/12.jpg\"><img src=\"/cmsstatic/product/10410/13.jpg\"><img src=\"/cmsstatic/product/10410/14.jpg\">','爱薇牛速溶全脂奶粉','118.00000','59.00000',NULL,NULL,NULL,NULL,NULL,10410,1000),(10511,NULL,'2016-05-05 19:02:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10411/1.jpg\"><img src=\"/cmsstatic/product/10411/2.jpg\"><img src=\"/cmsstatic/product/10411/3.jpg\"><img src=\"/cmsstatic/product/10411/4.jpg\"><img src=\"/cmsstatic/product/10411/5.jpg\"><img src=\"/cmsstatic/product/10411/6.jpg\"><img src=\"/cmsstatic/product/10411/7.jpg\">','美厨不锈钢复底三层蒸锅','198.00000','99.00000',NULL,NULL,NULL,NULL,NULL,10411,400),(10512,NULL,'2016-05-05 19:12:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10412/1.png\"><img src=\"/cmsstatic/product/10412/2.png\"><img src=\"/cmsstatic/product/10412/3.png\"><img src=\"/cmsstatic/product/10412/4.png\"><img src=\"/cmsstatic/product/10412/5.png\"><img src=\"/cmsstatic/product/10412/6.png\"><img src=\"/cmsstatic/product/10412/7.png\"><img src=\"/cmsstatic/product/10412/8.png\"><img src=\"/cmsstatic/product/10412/9.png\">','乐扣乐扣哑铃塑料水瓶','59.80000','29.90000',NULL,NULL,NULL,NULL,NULL,10412,400),(10513,NULL,'2016-05-05 19:17:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10413/1.jpg\"><img src=\"/cmsstatic/product/10413/2.png\"><img src=\"/cmsstatic/product/10413/3.jpg\"><img src=\"/cmsstatic/product/10413/4.jpg\">','美孚一号5W-40','576.00000','288.00000',NULL,NULL,NULL,NULL,NULL,10413,100),(10514,NULL,'2016-05-05 19:21:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10414/TB2aMzGnpXXXXXGXXXXXXXXXXXX_!!2185467246.jpg\"><img src=\"/cmsstatic/product/10414/TB23bCWnpXXXXXvXFXXXXXXXXXX_!!2185467246.jpg\">','美的落地扇直流五叶遥控','468.00000','328.00000',NULL,NULL,NULL,NULL,NULL,10414,100),(10515,NULL,'2016-05-05 19:25:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10415/1.jpg\"><img src=\"/cmsstatic/product/10415/2.jpg\"><img src=\"/cmsstatic/product/10415/3.jpg\"><img src=\"/cmsstatic/product/10415/4.jpg\"><img src=\"/cmsstatic/product/10415/5.jpg\"><img src=\"/cmsstatic/product/10415/6.jpg\"><img src=\"/cmsstatic/product/10415/7.jpg\"><img src=\"/cmsstatic/product/10415/8.jpg\">','苏泊尔电饭煲','649.00000','299.00000',NULL,NULL,NULL,NULL,NULL,10415,200),(10516,NULL,'2016-05-05 19:29:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10416/1.jpg\"><img src=\"/cmsstatic/product/10416/2.jpg\"><img src=\"/cmsstatic/product/10416/3.jpg\"><img src=\"/cmsstatic/product/10416/4.jpg\"><img src=\"/cmsstatic/product/10416/5.jpg\"><img src=\"/cmsstatic/product/10416/6.jpg\"><img src=\"/cmsstatic/product/10416/7.jpg\"><img src=\"/cmsstatic/product/10416/8.jpg\"><img src=\"/cmsstatic/product/10416/9.jpg\"><img src=\"/cmsstatic/product/10416/10.jpg\"><img src=\"/cmsstatic/product/10416/11.jpg\">','科语扫地机','1398.00000','699.00000',NULL,NULL,NULL,NULL,NULL,10416,50),(10517,NULL,'2016-05-05 19:32:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<p>扁平U型设计，免钉免钻，多种用途，节省空间 </p><p>适用范围：衣柜、橱柜、冰箱、隔板等</p><p>防锈电镀，承重5KG内，出口德国品质</p><p><img src=\"/cmsstatic/product/10417/23333399.jpg\"><br></p>','东旺挂式多用收纳篮','39.80000','19.90000',NULL,NULL,NULL,NULL,NULL,10417,200),(10518,NULL,'2016-05-05 20:09:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10418/1.jpg\"><img src=\"/cmsstatic/product/10418/2.jpg\"><img src=\"/cmsstatic/product/10418/3.jpg\">','FLOTT小腿按摩器','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10418,200),(10519,NULL,'2016-05-05 20:14:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10419/1.jpg\"><img src=\"/cmsstatic/product/10419/2.jpg\"><img src=\"/cmsstatic/product/10419/3.jpg\"><img src=\"/cmsstatic/product/10419/4.jpg\">','FLOTT脚底按摩器','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10419,200),(10520,NULL,'2016-05-05 20:19:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10420/1.jpg\"><img src=\"/cmsstatic/product/10420/3.jpg\"><img src=\"/cmsstatic/product/10420/4.jpg\"><img src=\"/cmsstatic/product/10420/5.jpg\">','FLOTT伸缩式锤打按摩器','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10420,200),(10521,NULL,'2016-05-05 20:23:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10421/1.jpg\"><img src=\"/cmsstatic/product/10421/2.jpg\"><img src=\"/cmsstatic/product/10421/3.jpg\"><img src=\"/cmsstatic/product/10421/4.jpg\">','FLOTT双层Y型手部按摩器','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10421,200),(10522,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'精选泰国金枕榴莲500g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10422,NULL),(10523,NULL,'2016-05-05 20:33:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10423/1.jpg\"><img src=\"/cmsstatic/product/10423/2.jpg\">','FLOTT第四代腰部按摩器','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10423,200),(10524,NULL,'2016-05-05 20:37:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10424/1.jpg\"><img src=\"/cmsstatic/product/10424/2.jpg\"><img src=\"/cmsstatic/product/10424/3.jpg\"><img src=\"/cmsstatic/product/10424/4.jpg\"><img src=\"/cmsstatic/product/10424/5.jpg\">','FLOTT颈部按摩器','39.80000','19.90000',NULL,NULL,NULL,NULL,NULL,10424,100),(10525,NULL,'2016-05-05 20:41:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10425/1.jpg\"><img src=\"/cmsstatic/product/10425/2.jpg\"><img src=\"/cmsstatic/product/10425/3.jpg\">','FLOTT肩背腰多效滚轮按摩带','39.80000','19.90000',NULL,NULL,NULL,NULL,NULL,10425,100),(10526,NULL,'2016-05-05 20:45:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'火轮休闲时尚洞洞鞋男款2025-31A','火轮休闲时尚洞洞鞋男款','49.80000','24.90000',NULL,NULL,NULL,NULL,NULL,10426,200),(10527,NULL,'2016-05-05 20:47:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'火轮休闲时尚洞洞鞋女款2025-31B<br><p><img src=\"/cmsstatic/product/10427/23329843.jpg\"></p>','火轮休闲时尚洞洞鞋女款','49.80000','24.90000',NULL,NULL,NULL,NULL,NULL,10427,200),(10528,NULL,'2016-05-05 20:50:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'火轮休闲时尚洞洞鞋童款2025-31C<p><img src=\"/cmsstatic/product/10428/23329841.jpg\"></p>','火轮休闲时尚洞洞鞋童款','39.80000','19.90000',NULL,NULL,NULL,NULL,NULL,10428,100),(10529,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'水晶富士80#500g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10429,NULL),(10530,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'新西兰牛肉粒500g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10430,NULL),(10531,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'CP熟带头南美白对虾40/50 500g袋','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10431,NULL),(10532,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'CP生带头南美白对虾40/50 500g袋','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10432,NULL),(10533,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'扇贝肉1kg/袋','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10433,NULL),(10534,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'美丰榴莲果肉雪糕70克x6盒','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10434,NULL),(10535,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'CJ王饺子490g袋','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10435,NULL),(10536,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'现代牧业酸牛奶200gx12','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10436,NULL),(10537,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'多美鲜全脂牛奶礼盒装200mlx12','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10437,NULL),(10538,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'德青源安心生态鲜鸡蛋12枚盒','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10438,NULL),(10539,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'光明植物活力乳酸菌饮料270mlx4组','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10439,NULL),(10540,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'枣夹核桃仁300g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10440,NULL),(10541,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'鲁花压榨葵花仁油2L','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10441,NULL),(10542,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'娃哈哈桂圆莲子八宝粥360g*12/箱','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10442,NULL),(10543,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'金沙河麦芯高筋小麦粉1kg袋','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10443,NULL),(10544,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'寿桃牌刀削面3人前600g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10444,NULL),(10545,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'寿桃牌日式拉面3人前540g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10445,NULL),(10546,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'泰拳泰国茉莉香米(原装进口)5kg袋','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10446,NULL),(10547,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'泰拳泰国糯米2kg','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10447,NULL),(10548,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'鲁花自然鲜原香酱油800ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10448,NULL),(10549,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'健达夹心牛奶巧克力12条装150克','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10449,NULL),(10550,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'健达缤纷乐43g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10450,NULL),(10551,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'徐福记600蛋黄沙琪玛469g包','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10451,NULL),(10552,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'珍珍Dewberry奶油夹心饼干(草莓味)432g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10452,NULL),(10553,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'珍珍Dewberry奶油夹心饼干(蓝莓味)432g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10453,NULL),(10554,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'珍珍Dewberry雪挞奶油椰蓉夹心饼干408g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10454,NULL),(10555,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'HAMU竹盐紫菜20g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10455,NULL),(10556,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'HAMU迷你紫菜20g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10456,NULL),(10557,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'茱蒂丝奶油苏打饼干500g盒','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10457,NULL),(10558,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'东阿人家什锦山楂600g+50g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10458,NULL),(10559,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'早早麦原味燕麦片1.458千克','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10459,NULL),(10560,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'爱薇牛速溶脱脂奶粉1KG','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10460,NULL),(10561,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'爱薇牛速溶全脂奶粉1KG','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10461,NULL),(10562,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奔富洛神山庄梅洛红葡萄酒750ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10462,NULL),(10563,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奔富酒园洛神山庄设拉子红葡萄酒750ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10463,NULL),(10564,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'珠江10°精品小麦啤酒330mlx6','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10464,NULL),(10565,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'维他奶植物阳光系列植物蛋白饮料（五谷红枣味）250mlx12','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10465,NULL),(10566,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'维他奶植物阳光系列植物蛋白饮料（五谷燕麦味）250mlx12','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10466,NULL),(10567,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'全南蜂蜜柚子茶韩国580g瓶','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10467,NULL),(10568,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'LOCK&LOCKStone32cm炒锅LCA6325D','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10468,NULL),(10569,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'美厨不锈钢复底三层蒸锅MCZ108-30cm','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10469,NULL),(10570,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'东旺挂式多用收纳篮DW8990','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10470,NULL),(10571,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'便利100随身杯350ml-1178','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10471,NULL),(10572,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'乐扣乐扣哑铃塑料水瓶HAP505-560ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10472,NULL),(10573,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'希艺欧滑刀式保鲜膜CEO-6726 30cm*50m','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10473,NULL),(10574,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT小腿按摩器FMA-1824','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10474,NULL),(10575,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT脚底按摩器FMA-1818','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10475,NULL),(10576,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT腹部双轮按摩器FMA-1816','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10476,NULL),(10577,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT伸缩式锤打按摩器FMA-1826','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10477,NULL),(10578,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT双层Y型手部按摩器FMA-1822','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10478,NULL),(10579,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT第四代腰部按摩器FMA-1825','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10479,NULL),(10580,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT颈部按摩器FMA-1817','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10480,NULL),(10581,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'FLOTT肩背腰多效滚轮按摩带FMA-1815','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10481,NULL),(10582,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'简丽清凉竹席150x195cm','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10482,NULL),(10583,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'简丽清凉竹席180x200cm','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10483,NULL),(10584,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'纯棉空调被200*230','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10484,NULL),(10585,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'远梦柔缎天丝四件套245x245cm','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10485,NULL),(10586,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'维洁牛皮席150*195','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10486,NULL),(10587,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'维洁牛皮席180*200','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10487,NULL),(10588,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'小龙哈彼自行车LB1439Q(男款)','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10488,NULL),(10589,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'小龙哈彼自行车LG1418Q(女款)','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10489,NULL),(10590,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奇士达1:12遥控玩具车98182','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10490,NULL),(10591,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'美孚一号5W-40支','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10491,NULL),(10592,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'TCL4K电视D55A561U','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10492,NULL),(10593,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'TCL曲面电视L55H8800A-CF台','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10493,NULL),(10594,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奥马冰箱BCD-152BCJ靓雅白台','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10494,NULL),(10595,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奥马冰箱BCD-210EDC','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10495,NULL),(10596,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奥马冰箱BCD-313WDK不锈钢','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10496,NULL),(10597,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奥马冰箱BCD-508WK台','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10497,NULL),(10598,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'美的落地扇直流五叶遥控FS40-13DR','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10498,NULL),(10599,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'苏泊尔电饭煲CFXB40FC26-75','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10499,NULL),(10600,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'科语扫地机CAKE 100','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10500,NULL),(10601,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'阿巴町三代儿童智能手表','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10501,NULL),(10602,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'华为畅享5S','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10502,NULL),(10603,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'芜琼花快乐儿童草莓味牙膏（套装）75g','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10503,NULL),(10604,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'力士奢选香氛沐浴乳恒永浪漫650ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10504,NULL),(10605,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'力士奢选香氛沐浴乳恒永慕爱650ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10505,NULL),(10606,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'沙宣洗发露清盈顺柔750ml','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10506,NULL),(10607,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'沙宣修护水养洗发露750ml瓶','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10507,NULL),(10608,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'花姿青花尚品卷筒纸160g10卷/提','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10508,NULL),(10609,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'花姿青花尚品抽取式面巾纸390张x6','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10509,NULL),(10610,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'姿青花尚品迷尔手帕纸18包','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10510,NULL),(10611,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奥妙净蓝全效深层洁净洗衣液立袋壶嘴装1KG','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10511,NULL),(10612,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'奥妙净蓝全效水清莲香深层洁净洗衣液立袋壶嘴装1KG','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10512,NULL),(10613,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲男装短袖T恤16B-1001','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10513,NULL),(10614,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲男装短袖T恤16B-1003','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10514,NULL),(10615,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲男装短袖T恤16B-1002','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10515,NULL),(10616,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲阿花一家男装短袖T恤16B-2016','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10516,NULL),(10617,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲女装短袖T恤16B-1001','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10517,NULL),(10618,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲女装短袖T恤16B-1003','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10518,NULL),(10619,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲女装短袖T恤16B-1002','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10519,NULL),(10620,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希阿花一家女装短袖T恤16B-2016','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10520,NULL),(10621,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希童装短袖T恤16B-1003','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10521,NULL),(10622,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲童装短袖T恤16B-1001','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10522,NULL),(10623,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲童装短袖T恤16B-1002','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10523,NULL),(10624,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲阿花一家女童装短袖T恤16B-2016件','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10524,NULL),(10625,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'嗳希一家亲阿花一家男童短袖T恤16B-2016件','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10525,NULL),(10626,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'火轮休闲时尚洞洞鞋男款2025-31A','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10526,NULL),(10627,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'火轮休闲时尚洞洞鞋女款2025-31B','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10527,NULL),(10628,NULL,'2016-05-05 20:28:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'火轮休闲时尚洞洞鞋童款2025-31C','17.80000','8.90000',NULL,NULL,NULL,NULL,NULL,10528,NULL),(10701,NULL,'2016-05-06 14:00:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<img src=\"/cmsstatic/product/10530/1.jpg\"><img src=\"/cmsstatic/product/10530/2.jpg\"><img src=\"/cmsstatic/product/10530/3.jpg\"><img src=\"/cmsstatic/product/10530/4.jpg\">','FLOTT腹部双轮按摩器','19.80000','9.90000',NULL,NULL,NULL,NULL,NULL,10530,200);

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

insert  into `blc_sku_media_map`(`BLC_SKU_SKU_ID`,`MEDIA_ID`,`MAP_KEY`) values (10100,100200,'primary'),(10351,100452,'primary'),(10352,100453,'primary'),(10353,100454,'primary'),(10354,100455,'primary'),(10355,100456,'primary'),(10356,100457,'primary'),(10357,100458,'primary'),(10358,100459,'primary'),(10359,100460,'primary'),(10360,100461,'primary'),(10361,100462,'primary'),(10362,100463,'primary'),(10363,100464,'primary'),(10364,100465,'primary'),(10365,100466,'primary'),(10366,100467,'primary'),(10400,100500,'primary'),(10401,100501,'primary'),(10402,100502,'primary'),(10403,100503,'primary'),(10404,100504,'primary'),(10405,100505,'primary'),(10406,100506,'primary'),(10407,100507,'primary'),(10408,100508,'primary'),(10409,100510,'primary'),(10410,100511,'primary'),(10411,100512,'primary'),(10450,100551,'primary'),(10451,100552,'primary'),(10452,100553,'primary'),(10453,100554,'primary'),(10454,100555,'primary'),(10455,100556,'primary'),(10456,100557,'1'),(10456,100558,'2'),(10456,100559,'primary'),(10457,100560,'1'),(10457,100561,'2'),(10457,100562,'primary'),(10458,100563,'1'),(10458,100564,'2'),(10458,100565,'primary'),(10500,100600,'primary'),(10501,100601,'primary'),(10502,100602,'primary'),(10504,100604,'primary'),(10505,100605,'primary'),(10506,100606,'primary'),(10507,100607,'primary'),(10508,100608,'primary'),(10509,100609,'primary'),(10510,100610,'primary'),(10511,100611,'primary'),(10512,100612,'primary'),(10513,100613,'primary'),(10514,100614,'primary'),(10515,100615,'primary'),(10516,100616,'primary'),(10517,100617,'primary'),(10518,100618,'primary'),(10519,100619,'primary'),(10520,100620,'primary'),(10521,100621,'primary'),(10522,100622,'primary'),(10523,100623,'primary'),(10524,100624,'primary'),(10525,100625,'primary'),(10526,100626,'primary'),(10527,100627,'primary'),(10528,100628,'primary'),(10529,100630,'primary'),(10530,100631,'primary'),(10531,100632,'primary'),(10628,100633,'primary'),(10627,100634,'primary'),(10626,100635,'primary'),(10612,100636,'primary'),(10611,100637,'primary'),(10610,100638,'primary'),(10609,100639,'primary'),(10607,100640,'primary'),(10606,100641,'primary'),(10605,100642,'primary'),(10604,100643,'primary'),(10603,100644,'primary'),(10600,100645,'primary'),(10599,100646,'primary'),(10598,100647,'primary'),(10597,100648,'primary'),(10596,100649,'primary'),(10595,100650,'primary'),(10594,100651,'primary'),(10593,100652,'primary'),(10592,100653,'primary'),(10591,100654,'primary'),(10585,100655,'primary'),(10583,100656,'primary'),(10582,100657,'primary'),(10581,100658,'primary'),(10580,100659,'primary'),(10579,100660,'primary'),(10578,100661,'primary'),(10577,100662,'primary'),(10576,100663,'primary'),(10575,100664,'primary'),(10574,100665,'primary'),(10573,100666,'primary'),(10572,100667,'primary'),(10532,100668,'primary'),(10571,100669,'primary'),(10570,100670,'primary'),(10569,100671,'primary'),(10533,100672,'primary'),(10568,100673,'primary'),(10567,100674,'primary'),(10534,100675,'primary'),(10566,100676,'primary'),(10565,100677,'primary'),(10535,100678,'primary'),(10564,100679,'primary'),(10536,100680,'primary'),(10562,100681,'primary'),(10537,100682,'primary'),(10538,100683,'primary'),(10539,100684,'primary'),(10559,100685,'primary'),(10558,100686,'primary'),(10557,100687,'primary'),(10540,100688,'primary'),(10556,100689,'primary'),(10555,100690,'primary'),(10554,100691,'primary'),(10553,100692,'primary'),(10541,100693,'primary'),(10552,100694,'primary'),(10542,100695,'primary'),(10551,100696,'primary'),(10550,100697,'primary'),(10543,100698,'primary'),(10549,100699,'primary'),(10544,100700,'primary'),(10548,100701,'primary'),(10545,100702,'primary'),(10547,100703,'primary'),(10546,100704,'primary'),(10601,100705,'primary'),(10584,100706,'primary'),(10608,100707,'primary'),(10602,100708,'primary'),(10590,100709,'primary'),(10613,100710,'primary'),(10614,100711,'primary'),(10615,100712,'primary'),(10617,100713,'primary'),(10618,100714,'primary'),(10619,100715,'primary'),(10622,100716,'primary'),(10623,100717,'primary'),(10586,100718,'primary'),(10587,100719,'primary'),(10588,100720,'primary'),(10589,100721,'primary'),(10563,100722,'primary'),(10560,100723,'primary'),(10561,100724,'primary'),(10621,100725,'primary'),(10701,100850,'primary'),(10620,100851,'primary'),(10625,100852,'primary'),(10624,100853,'primary');

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

insert  into `blc_static_asset`(`STATIC_ASSET_ID`,`ALT_TEXT`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`FILE_EXTENSION`,`FILE_SIZE`,`FULL_URL`,`MIME_TYPE`,`NAME`,`STORAGE_TYPE`,`TITLE`) values (100103,NULL,-1,'2016-05-04 15:29:13','2016-05-04 15:29:13',NULL,'png',14981,'/category/100150/in_21.png','image/png','in_21.png','FILESYSTEM',NULL),(100104,NULL,-1,'2016-05-04 15:29:31','2016-05-04 15:29:31',NULL,'png',15969,'/category/100151/in_21-09.png','image/png','in_21-09.png','FILESYSTEM',NULL),(100105,NULL,-1,'2016-05-04 15:29:52','2016-05-04 15:29:52',NULL,'png',17527,'/category/100152/in_21-10.png','image/png','in_21-10.png','FILESYSTEM',NULL),(100106,NULL,-1,'2016-05-04 15:30:15','2016-05-04 15:30:15',NULL,'png',14946,'/category/99951/in_21-11.png','image/png','in_21-11.png','FILESYSTEM',NULL),(100107,NULL,-1,'2016-05-04 15:33:20','2016-05-04 15:33:20',NULL,'jpg',162047,'/product/10200/23122333.jpg','image/jpeg','23122333.jpg','FILESYSTEM',NULL),(100108,NULL,-1,'2016-05-04 15:33:36','2016-05-04 15:33:36',NULL,'jpg',331524,'/product/10200/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100109,NULL,-1,'2016-05-04 15:33:42','2016-05-04 15:33:42',NULL,'jpg',193674,'/product/10200/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100110,NULL,-1,'2016-05-04 15:33:47','2016-05-04 15:33:47',NULL,'jpg',194474,'/product/10200/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100111,NULL,-1,'2016-05-04 15:33:52','2016-05-04 15:33:52',NULL,'jpg',220551,'/product/10200/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100112,NULL,-1,'2016-05-04 15:56:20','2016-05-04 15:56:20',NULL,'jpg',140502,'/product/22796773.jpg','image/jpeg','22796773.jpg','FILESYSTEM',NULL),(100113,NULL,-1,'2016-05-04 15:56:28','2016-05-04 15:56:28',NULL,'jpg',333321,'/product/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100114,NULL,-1,'2016-05-04 15:56:48','2016-05-04 15:56:48',NULL,'jpg',333321,'/product/1-1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100115,NULL,-1,'2016-05-04 15:57:00','2016-05-04 15:57:00',NULL,'jpg',540537,'/product/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100116,NULL,-1,'2016-05-04 15:57:25','2016-05-04 15:57:25',NULL,'jpg',540537,'/product/2-1.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100117,NULL,-1,'2016-05-04 15:57:33','2016-05-04 15:57:33',NULL,'jpg',436895,'/product/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100118,NULL,-1,'2016-05-04 15:57:43','2016-05-04 15:57:43',NULL,'jpg',546833,'/product/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100119,NULL,-1,'2016-05-04 15:57:54','2016-05-04 15:57:54',NULL,'jpg',266677,'/product/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100120,NULL,-1,'2016-05-04 15:58:00','2016-05-04 15:58:00',NULL,'jpg',754804,'/product/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100121,NULL,-1,'2016-05-04 16:01:42','2016-05-04 16:01:42',NULL,'jpg',190280,'/product/22826219.jpg','image/jpeg','22826219.jpg','FILESYSTEM',NULL),(100122,NULL,-1,'2016-05-04 16:02:43','2016-05-04 16:02:43',NULL,'jpg',734033,'/product/1-2.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100123,NULL,-1,'2016-05-04 16:02:55','2016-05-04 16:02:55',NULL,'jpg',424703,'/product/10253/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100124,NULL,-1,'2016-05-04 16:03:02','2016-05-04 16:03:02',NULL,'jpg',480714,'/product/10253/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100125,NULL,-1,'2016-05-04 16:03:09','2016-05-04 16:03:09',NULL,'jpg',491898,'/product/10253/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100126,NULL,-1,'2016-05-04 16:03:14','2016-05-04 16:03:14',NULL,'jpg',719576,'/product/10253/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100127,NULL,-1,'2016-05-04 16:03:19','2016-05-04 16:03:19',NULL,'jpg',601655,'/product/10253/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100128,NULL,-1,'2016-05-04 16:05:06','2016-05-04 16:05:06',NULL,'jpg',161807,'/product/21587251.jpg','image/jpeg','21587251.jpg','FILESYSTEM',NULL),(100129,NULL,-1,'2016-05-04 16:07:10','2016-05-04 16:07:10',NULL,'jpg',132921,'/product/10254/TB2zcGnjFXXXXaXXXXXXXXXXXXX_!!2191938031.jpg','image/jpeg','TB2zcGnjFXXXXaXXXXXXXXXXXXX_!!2191938031.jpg','FILESYSTEM',NULL),(100130,NULL,-1,'2016-05-04 16:07:17','2016-05-04 16:07:17',NULL,'jpg',104167,'/product/10254/TB2ZukieVXXXXaHXXXXXXXXXXXX_!!2191938031.jpg','image/jpeg','TB2ZukieVXXXXaHXXXXXXXXXXXX_!!2191938031.jpg','FILESYSTEM',NULL),(100131,NULL,-1,'2016-05-04 16:07:22','2016-05-04 16:07:22',NULL,'jpg',100631,'/product/10254/TB2N03beVXXXXckXXXXXXXXXXXX_!!2191938031.jpg','image/jpeg','TB2N03beVXXXXckXXXXXXXXXXXX_!!2191938031.jpg','FILESYSTEM',NULL),(100132,NULL,-1,'2016-05-04 16:11:19','2016-05-04 16:11:19',NULL,'jpg',313515,'/product/22599862.jpg','image/jpeg','22599862.jpg','FILESYSTEM',NULL),(100133,NULL,-1,'2016-05-04 16:12:39','2016-05-04 16:12:39',NULL,'jpg',579920,'/product/10255/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100134,NULL,-1,'2016-05-04 16:12:45','2016-05-04 16:12:45',NULL,'jpg',275134,'/product/10255/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100135,NULL,-1,'2016-05-04 16:12:50','2016-05-04 16:12:50',NULL,'jpg',310238,'/product/10255/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100136,NULL,-1,'2016-05-04 16:12:55','2016-05-04 16:12:55',NULL,'jpg',298739,'/product/10255/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100137,NULL,-1,'2016-05-04 16:13:01','2016-05-04 16:13:01',NULL,'jpg',368528,'/product/10255/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100138,NULL,-1,'2016-05-04 16:13:06','2016-05-04 16:13:06',NULL,'jpg',277336,'/product/10255/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100139,NULL,-1,'2016-05-04 16:14:18','2016-05-04 16:14:18',NULL,'jpg',237223,'/product/23337906.jpg','image/jpeg','23337906.jpg','FILESYSTEM',NULL),(100140,NULL,-1,'2016-05-04 16:15:12','2016-05-04 16:15:12',NULL,'jpg',503006,'/product/10256/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100141,NULL,-1,'2016-05-04 16:15:20','2016-05-04 16:15:20',NULL,'jpg',405751,'/product/10256/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100142,NULL,-1,'2016-05-04 16:15:26','2016-05-04 16:15:26',NULL,'jpg',671237,'/product/10256/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100143,NULL,-1,'2016-05-04 16:15:33','2016-05-04 16:15:33',NULL,'jpg',823979,'/product/10256/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100144,NULL,-1,'2016-05-04 16:16:48','2016-05-04 16:16:48',NULL,'jpg',160606,'/product/00289961.jpg','image/jpeg','00289961.jpg','FILESYSTEM',NULL),(100145,NULL,-1,'2016-05-04 16:19:46','2016-05-04 16:19:46',NULL,'jpg',687698,'/product/10257/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100146,NULL,-1,'2016-05-04 16:19:53','2016-05-04 16:19:53',NULL,'jpg',468445,'/product/10257/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100147,NULL,-1,'2016-05-04 16:20:00','2016-05-04 16:20:00',NULL,'jpg',505819,'/product/10257/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100148,NULL,-1,'2016-05-04 16:20:07','2016-05-04 16:20:07',NULL,'jpg',954363,'/product/10257/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100149,NULL,-1,'2016-05-04 16:20:14','2016-05-04 16:20:14',NULL,'jpg',606778,'/product/10257/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100150,NULL,-1,'2016-05-04 16:20:28','2016-05-04 16:20:28',NULL,'jpg',478220,'/product/10257/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100151,NULL,-1,'2016-05-04 16:27:39','2016-05-04 16:27:39',NULL,'jpg',326252,'/product/23155257.jpg','image/jpeg','23155257.jpg','FILESYSTEM',NULL),(100152,NULL,-1,'2016-05-04 16:28:09','2016-05-04 16:28:09',NULL,'jpg',491136,'/product/10258/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100153,NULL,-1,'2016-05-04 16:28:16','2016-05-04 16:28:16',NULL,'jpg',303419,'/product/10258/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100154,NULL,-1,'2016-05-04 16:28:23','2016-05-04 16:28:23',NULL,'jpg',379062,'/product/10258/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100155,NULL,-1,'2016-05-04 16:28:29','2016-05-04 16:28:29',NULL,'jpg',303541,'/product/10258/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100156,NULL,-1,'2016-05-04 16:28:36','2016-05-04 16:28:36',NULL,'jpg',632493,'/product/10258/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100157,NULL,-1,'2016-05-04 16:28:50','2016-05-04 16:28:50',NULL,'jpg',521997,'/product/10258/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100158,NULL,-1,'2016-05-04 16:28:56','2016-05-04 16:28:56',NULL,'jpg',658143,'/product/10258/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100159,NULL,-1,'2016-05-04 16:29:03','2016-05-04 16:29:03',NULL,'jpg',603601,'/product/10258/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100160,NULL,-1,'2016-05-04 16:29:09','2016-05-04 16:29:09',NULL,'jpg',600130,'/product/10258/9.jpg','image/jpeg','9.jpg','FILESYSTEM',NULL),(100161,NULL,-1,'2016-05-04 16:29:15','2016-05-04 16:29:15',NULL,'jpg',617953,'/product/10258/10.jpg','image/jpeg','10.jpg','FILESYSTEM',NULL),(100162,NULL,-1,'2016-05-04 16:31:24','2016-05-04 16:31:24',NULL,'jpg',231167,'/product/01884931.jpg','image/jpeg','01884931.jpg','FILESYSTEM',NULL),(100163,NULL,-1,'2016-05-04 16:32:59','2016-05-04 16:32:59',NULL,'jpg',426719,'/product/10259/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100164,NULL,-1,'2016-05-04 16:33:05','2016-05-04 16:33:05',NULL,'jpg',175628,'/product/10259/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100165,NULL,-1,'2016-05-04 16:33:11','2016-05-04 16:33:11',NULL,'jpg',294908,'/product/10259/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100166,NULL,-1,'2016-05-04 16:33:18','2016-05-04 16:33:18',NULL,'jpg',247650,'/product/10259/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100167,NULL,-1,'2016-05-04 16:33:22','2016-05-04 16:33:22',NULL,'jpg',198611,'/product/10259/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100168,NULL,-1,'2016-05-04 16:34:15','2016-05-04 16:34:15',NULL,'jpg',214574,'/product/23325130.jpg','image/jpeg','23325130.jpg','FILESYSTEM',NULL),(100169,NULL,-1,'2016-05-04 16:35:35','2016-05-04 16:35:35',NULL,'jpg',463110,'/product/10260/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100170,NULL,-1,'2016-05-04 16:35:40','2016-05-04 16:35:40',NULL,'jpg',392459,'/product/10260/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100171,NULL,-1,'2016-05-04 16:35:49','2016-05-04 16:35:49',NULL,'jpg',507429,'/product/10260/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100172,NULL,-1,'2016-05-04 16:46:38','2016-05-04 16:46:38',NULL,'jpg',198637,'/product/02380206.jpg','image/jpeg','02380206.jpg','FILESYSTEM',NULL),(100173,NULL,-1,'2016-05-04 16:50:00','2016-05-04 16:50:00',NULL,'jpg',1073148,'/product/10261/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100174,NULL,-1,'2016-05-04 16:50:26','2016-05-04 16:50:26',NULL,'jpg',1618656,'/product/10261/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100175,NULL,-1,'2016-05-04 16:50:35','2016-05-04 16:50:35',NULL,'jpg',591742,'/product/10261/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100176,NULL,-1,'2016-05-04 16:50:41','2016-05-04 16:50:41',NULL,'jpg',354472,'/product/10261/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100177,NULL,-1,'2016-05-04 17:01:50','2016-05-04 17:01:50',NULL,'jpg',218613,'/product/23194637.jpg','image/jpeg','23194637.jpg','FILESYSTEM',NULL),(100178,NULL,-1,'2016-05-04 17:04:07','2016-05-04 17:04:07',NULL,'jpg',374752,'/product/10262/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100179,NULL,-1,'2016-05-04 17:04:13','2016-05-04 17:04:13',NULL,'jpg',354700,'/product/10262/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100180,NULL,-1,'2016-05-04 17:04:19','2016-05-04 17:04:19',NULL,'jpg',940087,'/product/10262/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100181,NULL,-1,'2016-05-04 17:13:09','2016-05-04 17:13:09',NULL,'jpg',211552,'/product/23194635.jpg','image/jpeg','23194635.jpg','FILESYSTEM',NULL),(100182,NULL,-1,'2016-05-04 17:14:26','2016-05-04 17:14:26',NULL,'jpg',388319,'/product/10263/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100183,NULL,-1,'2016-05-04 17:14:34','2016-05-04 17:14:34',NULL,'jpg',337627,'/product/10263/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100184,NULL,-1,'2016-05-04 17:14:41','2016-05-04 17:14:41',NULL,'jpg',357069,'/product/10263/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100185,NULL,-1,'2016-05-04 17:14:46','2016-05-04 17:14:46',NULL,'jpg',398479,'/product/10263/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100186,NULL,-1,'2016-05-04 17:14:55','2016-05-04 17:14:55',NULL,'jpg',414883,'/product/10263/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100187,NULL,-1,'2016-05-04 17:17:41','2016-05-04 17:17:41',NULL,'jpg',233311,'/product/23333020.jpg','image/jpeg','23333020.jpg','FILESYSTEM',NULL),(100188,NULL,-1,'2016-05-04 17:24:27','2016-05-04 17:24:27',NULL,'jpg',735189,'/product/10264/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100189,NULL,-1,'2016-05-04 17:24:34','2016-05-04 17:24:34',NULL,'jpg',492427,'/product/10264/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100190,NULL,-1,'2016-05-04 17:24:42','2016-05-04 17:24:42',NULL,'jpg',318784,'/product/10264/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100191,NULL,-1,'2016-05-04 17:24:48','2016-05-04 17:24:48',NULL,'jpg',339617,'/product/10264/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100192,NULL,-1,'2016-05-04 17:24:55','2016-05-04 17:24:55',NULL,'jpg',305858,'/product/10264/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100193,NULL,-1,'2016-05-04 17:25:02','2016-05-04 17:25:02',NULL,'jpg',867033,'/product/10264/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100194,NULL,-1,'2016-05-04 17:30:56','2016-05-04 17:30:56',NULL,'jpg',310682,'/product/23133423.jpg','image/jpeg','23133423.jpg','FILESYSTEM',NULL),(100195,NULL,-1,'2016-05-04 17:34:50','2016-05-04 17:34:50',NULL,'jpg',537240,'/product/10265/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100196,NULL,-1,'2016-05-04 17:35:00','2016-05-04 17:35:00',NULL,'jpg',964109,'/product/10265/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100197,NULL,-1,'2016-05-04 17:35:08','2016-05-04 17:35:08',NULL,'jpg',1235769,'/product/10265/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100198,NULL,-1,'2016-05-04 17:35:16','2016-05-04 17:35:16',NULL,'jpg',367281,'/product/10265/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100199,NULL,-1,'2016-05-04 17:37:29','2016-05-04 17:37:29',NULL,'jpg',267831,'/product/23133421.jpg','image/jpeg','23133421.jpg','FILESYSTEM',NULL),(100200,NULL,-1,'2016-05-04 17:39:36','2016-05-04 17:39:36',NULL,'jpg',487634,'/product/10266/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100201,NULL,-1,'2016-05-04 17:39:46','2016-05-04 17:39:46',NULL,'jpg',823703,'/product/10266/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100202,NULL,-1,'2016-05-04 17:39:57','2016-05-04 17:39:57',NULL,'jpg',1312529,'/product/10266/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100203,NULL,-1,'2016-05-04 17:40:08','2016-05-04 17:40:08',NULL,'jpg',367281,'/product/10266/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100250,NULL,-1,'2016-05-04 18:44:00','2016-05-04 18:44:00',NULL,'jpg',276908,'/product/23332889.jpg','image/jpeg','23332889.jpg','FILESYSTEM',NULL),(100251,NULL,-1,'2016-05-04 18:45:06','2016-05-04 18:45:06',NULL,'jpg',356882,'/product/10300/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100252,NULL,-1,'2016-05-04 18:45:13','2016-05-04 18:45:13',NULL,'png',435605,'/product/10300/2.png','image/png','2.png','FILESYSTEM',NULL),(100253,NULL,-1,'2016-05-04 18:45:21','2016-05-04 18:45:21',NULL,'png',394078,'/product/10300/3.png','image/png','3.png','FILESYSTEM',NULL),(100254,NULL,-1,'2016-05-04 18:45:26','2016-05-04 18:45:26',NULL,'png',231443,'/product/10300/4.png','image/png','4.png','FILESYSTEM',NULL),(100255,NULL,-1,'2016-05-04 18:45:34','2016-05-04 18:45:34',NULL,'png',310872,'/product/10300/5.png','image/png','5.png','FILESYSTEM',NULL),(100256,NULL,-1,'2016-05-04 18:45:40','2016-05-04 18:45:40',NULL,'png',212367,'/product/10300/6.png','image/png','6.png','FILESYSTEM',NULL),(100257,NULL,-1,'2016-05-04 18:45:51','2016-05-04 18:45:51',NULL,'png',300838,'/product/10300/7.png','image/png','7.png','FILESYSTEM',NULL),(100258,NULL,-1,'2016-05-04 18:45:58','2016-05-04 18:45:58',NULL,'png',452255,'/product/10300/8.png','image/png','8.png','FILESYSTEM',NULL),(100259,NULL,-1,'2016-05-04 18:46:03','2016-05-04 18:46:03',NULL,'png',326375,'/product/10300/9.png','image/png','9.png','FILESYSTEM',NULL),(100260,NULL,-1,'2016-05-04 18:46:09','2016-05-04 18:46:09',NULL,'png',352934,'/product/10300/10.png','image/png','10.png','FILESYSTEM',NULL),(100261,NULL,-1,'2016-05-04 18:46:14','2016-05-04 18:46:14',NULL,'png',381821,'/product/10300/11.png','image/png','11.png','FILESYSTEM',NULL),(100262,NULL,-1,'2016-05-04 18:46:20','2016-05-04 18:46:20',NULL,'png',230097,'/product/10300/12.png','image/png','12.png','FILESYSTEM',NULL),(100263,NULL,-1,'2016-05-04 18:46:26','2016-05-04 18:46:26',NULL,'png',224104,'/product/10300/13.png','image/png','13.png','FILESYSTEM',NULL),(100264,NULL,-1,'2016-05-04 18:46:31','2016-05-04 18:46:31',NULL,'png',412910,'/product/10300/14.png','image/png','14.png','FILESYSTEM',NULL),(100265,NULL,-1,'2016-05-04 18:51:34','2016-05-04 18:51:34',NULL,'jpg',306257,'/product/23301430.jpg','image/jpeg','23301430.jpg','FILESYSTEM',NULL),(100266,NULL,-1,'2016-05-04 18:57:55','2016-05-04 18:57:55',NULL,'png',147117,'/product/10301/a1_01.png','image/png','a1_01.png','FILESYSTEM',NULL),(100267,NULL,-1,'2016-05-04 18:58:04','2016-05-04 18:58:04',NULL,'png',86236,'/product/10301/a1_02.png','image/png','a1_02.png','FILESYSTEM',NULL),(100268,NULL,-1,'2016-05-04 18:58:14','2016-05-04 18:58:14',NULL,'png',183744,'/product/10301/a1_03.png','image/png','a1_03.png','FILESYSTEM',NULL),(100269,NULL,-1,'2016-05-04 18:58:31','2016-05-04 18:58:31',NULL,'png',376127,'/product/10301/a1_04.png','image/png','a1_04.png','FILESYSTEM',NULL),(100270,NULL,-1,'2016-05-04 18:58:58','2016-05-04 18:58:58',NULL,'png',183645,'/product/10301/a1_05.png','image/png','a1_05.png','FILESYSTEM',NULL),(100271,NULL,-1,'2016-05-04 18:59:17','2016-05-04 18:59:17',NULL,'jpg',27875,'/product/10301/a1_06.jpg','image/jpeg','a1_06.jpg','FILESYSTEM',NULL),(100272,NULL,-1,'2016-05-04 19:01:38','2016-05-04 19:01:38',NULL,'jpg',166197,'/product/22919047.jpg','image/jpeg','22919047.jpg','FILESYSTEM',NULL),(100273,NULL,-1,'2016-05-04 19:03:28','2016-05-04 19:03:28',NULL,'jpg',456459,'/product/10302/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100274,NULL,-1,'2016-05-04 19:03:37','2016-05-04 19:03:37',NULL,'jpg',511524,'/product/10302/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100275,NULL,-1,'2016-05-04 19:03:49','2016-05-04 19:03:49',NULL,'jpg',565178,'/product/10302/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100276,NULL,-1,'2016-05-04 19:03:58','2016-05-04 19:03:58',NULL,'jpg',454026,'/product/10302/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100277,NULL,-1,'2016-05-04 19:05:55','2016-05-04 19:05:55',NULL,'jpg',164304,'/product/22700513.jpg','image/jpeg','22700513.jpg','FILESYSTEM',NULL),(100278,NULL,-1,'2016-05-04 19:08:38','2016-05-04 19:08:38',NULL,'jpg',231024,'/product/22700517.jpg','image/jpeg','22700517.jpg','FILESYSTEM',NULL),(100279,NULL,-1,'2016-05-05 09:41:07','2016-05-05 09:41:07',NULL,'jpg',170321,'/product/23303377.jpg','image/jpeg','23303377.jpg','FILESYSTEM',NULL),(100280,NULL,-1,'2016-05-05 09:43:14','2016-05-05 09:43:14',NULL,'jpg',356363,'/product/10305/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100281,NULL,-1,'2016-05-05 09:43:20','2016-05-05 09:43:20',NULL,'jpg',226963,'/product/10305/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100282,NULL,-1,'2016-05-05 09:43:27','2016-05-05 09:43:27',NULL,'jpg',302231,'/product/10305/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100283,NULL,-1,'2016-05-05 09:43:33','2016-05-05 09:43:33',NULL,'jpg',579956,'/product/10305/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100284,NULL,-1,'2016-05-05 09:43:40','2016-05-05 09:43:40',NULL,'jpg',258976,'/product/10305/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100285,NULL,-1,'2016-05-05 09:50:03','2016-05-05 09:50:03',NULL,'jpg',199271,'/product/22651289.jpg','image/jpeg','22651289.jpg','FILESYSTEM',NULL),(100286,NULL,-1,'2016-05-05 09:52:33','2016-05-05 09:52:33',NULL,'jpg',302906,'/product/10306/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100287,NULL,-1,'2016-05-05 09:52:43','2016-05-05 09:52:43',NULL,'jpg',233835,'/product/10306/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100288,NULL,-1,'2016-05-05 09:52:51','2016-05-05 09:52:51',NULL,'jpg',140213,'/product/10306/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100289,NULL,-1,'2016-05-05 09:53:01','2016-05-05 09:53:01',NULL,'jpg',221140,'/product/10306/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100290,NULL,-1,'2016-05-05 09:53:15','2016-05-05 09:53:15',NULL,'jpg',186789,'/product/10306/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100291,NULL,-1,'2016-05-05 09:55:51','2016-05-05 09:55:51',NULL,'jpg',164895,'/product/23158864.jpg','image/jpeg','23158864.jpg','FILESYSTEM',NULL),(100292,NULL,-1,'2016-05-05 09:55:59','2016-05-05 09:55:59',NULL,'jpg',187079,'/product/23317022.jpg','image/jpeg','23317022.jpg','FILESYSTEM',NULL),(100293,NULL,-1,'2016-05-05 09:59:28','2016-05-05 09:59:28',NULL,'jpg',263237,'/product/23309510.jpg','image/jpeg','23309510.jpg','FILESYSTEM',NULL),(100294,NULL,-1,'2016-05-05 10:00:42','2016-05-05 10:00:42',NULL,'jpg',384801,'/product/10308/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100295,NULL,-1,'2016-05-05 10:00:56','2016-05-05 10:00:56',NULL,'jpg',392701,'/product/10308/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100296,NULL,-1,'2016-05-05 10:01:03','2016-05-05 10:01:03',NULL,'jpg',203169,'/product/10308/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100297,NULL,-1,'2016-05-05 10:02:13','2016-05-05 10:02:13',NULL,'jpg',360504,'/product/1-3.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100298,NULL,-1,'2016-05-05 10:02:57','2016-05-05 10:02:57',NULL,'jpg',360504,'/product/1-4.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100299,NULL,-1,'2016-05-05 10:03:54','2016-05-05 10:03:54',NULL,'jpg',263237,'/product/23309514.jpg','image/jpeg','23309514.jpg','FILESYSTEM',NULL),(100300,NULL,-1,'2016-05-05 10:04:04','2016-05-05 10:04:04',NULL,'jpg',384193,'/product/1-5.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100301,NULL,-1,'2016-05-05 10:04:05','2016-05-05 10:04:05',NULL,'jpg',238893,'/product/2-2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100302,NULL,-1,'2016-05-05 10:04:16','2016-05-05 10:04:16',NULL,'jpg',193660,'/product/3-1.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100303,NULL,-1,'2016-05-05 10:04:18','2016-05-05 10:04:18',NULL,'jpg',389881,'/product/2-3.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100304,NULL,-1,'2016-05-05 10:04:24','2016-05-05 10:04:24',NULL,'jpg',372502,'/product/3-2.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100305,NULL,-1,'2016-05-05 10:04:25','2016-05-05 10:04:25',NULL,'jpg',487350,'/product/4-1.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100306,NULL,-1,'2016-05-05 10:05:32','2016-05-05 10:05:32',NULL,'jpg',372502,'/product/10310/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100307,NULL,-1,'2016-05-05 10:08:22','2016-05-05 10:08:22',NULL,'jpg',235150,'/product/23331807.jpg','image/jpeg','23331807.jpg','FILESYSTEM',NULL),(100308,NULL,-1,'2016-05-05 10:09:40','2016-05-05 10:09:40',NULL,'jpg',91074,'/product/10311/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100309,NULL,-1,'2016-05-05 10:09:46','2016-05-05 10:09:46',NULL,'jpg',204152,'/product/10311/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100310,NULL,-1,'2016-05-05 10:09:53','2016-05-05 10:09:53',NULL,'jpg',132571,'/product/10311/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100311,NULL,-1,'2016-05-05 10:09:59','2016-05-05 10:09:59',NULL,'jpg',160042,'/product/10311/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100312,NULL,-1,'2016-05-05 10:10:04','2016-05-05 10:10:04',NULL,'jpg',140330,'/product/10311/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100313,NULL,-1,'2016-05-05 10:10:10','2016-05-05 10:10:10',NULL,'jpg',156997,'/product/10311/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100350,NULL,-1,'2016-05-05 10:13:28','2016-05-05 10:13:28',NULL,'jpg',225941,'/product/23331809.jpg','image/jpeg','23331809.jpg','FILESYSTEM',NULL),(100351,NULL,-1,'2016-05-05 10:13:38','2016-05-05 10:13:38',NULL,'jpg',92899,'/product/1-6.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100352,NULL,-1,'2016-05-05 10:13:45','2016-05-05 10:13:45',NULL,'jpg',204152,'/product/2-4.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100353,NULL,-1,'2016-05-05 10:13:50','2016-05-05 10:13:50',NULL,'jpg',132571,'/product/3-3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100354,NULL,-1,'2016-05-05 10:13:56','2016-05-05 10:13:56',NULL,'jpg',160042,'/product/4-2.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100355,NULL,-1,'2016-05-05 10:14:03','2016-05-05 10:14:03',NULL,'jpg',140330,'/product/5-1.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100356,NULL,-1,'2016-05-05 10:17:26','2016-05-05 10:17:26',NULL,'jpg',160042,'/product/10350/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100357,NULL,-1,'2016-05-05 10:17:37','2016-05-05 10:17:37',NULL,'jpg',140330,'/product/10350/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100358,NULL,-1,'2016-05-05 10:17:48','2016-05-05 10:17:48',NULL,'jpg',167036,'/product/10350/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100359,NULL,-1,'2016-05-05 10:20:03','2016-05-05 10:20:03',NULL,'jpg',192153,'/product/23335394.jpg','image/jpeg','23335394.jpg','FILESYSTEM',NULL),(100360,NULL,-1,'2016-05-05 10:21:37','2016-05-05 10:21:37',NULL,'jpg',367719,'/product/10351/TB2aodClXXXXXb3XXXXXXXXXXXX_!!2534458023.jpg','image/jpeg','TB2aodClXXXXXb3XXXXXXXXXXXX_!!2534458023.jpg','FILESYSTEM',NULL),(100361,NULL,-1,'2016-05-05 10:21:43','2016-05-05 10:21:43',NULL,'jpg',363312,'/product/10351/TB2ATNklXXXXXbbXpXXXXXXXXXX_!!2534458023.jpg','image/jpeg','TB2ATNklXXXXXbbXpXXXXXXXXXX_!!2534458023.jpg','FILESYSTEM',NULL),(100362,NULL,-1,'2016-05-05 10:21:51','2016-05-05 10:21:51',NULL,'jpg',380238,'/product/10351/TB2jiBhlXXXXXbCXpXXXXXXXXXX_!!2534458023.jpg','image/jpeg','TB2jiBhlXXXXXbCXpXXXXXXXXXX_!!2534458023.jpg','FILESYSTEM',NULL),(100363,NULL,-1,'2016-05-05 10:22:00','2016-05-05 10:22:00',NULL,'jpg',380238,'/product/10351/TB2jiBhlXXXXXbCXpXXXXXXXXXX_!!2534458023-1.jpg','image/jpeg','TB2jiBhlXXXXXbCXpXXXXXXXXXX_!!2534458023.jpg','FILESYSTEM',NULL),(100364,NULL,-1,'2016-05-05 10:22:10','2016-05-05 10:22:10',NULL,'jpg',385999,'/product/10351/TB2QAxSlXXXXXXpXXXXXXXXXXXX_!!2534458023.jpg','image/jpeg','TB2QAxSlXXXXXXpXXXXXXXXXXXX_!!2534458023.jpg','FILESYSTEM',NULL),(100365,NULL,-1,'2016-05-05 10:23:37','2016-05-05 10:23:37',NULL,'jpg',382694,'/product/10351/TB27J8wlXXXXXXbXpXXXXXXXXXX_!!2534458023.jpg','image/jpeg','TB27J8wlXXXXXXbXpXXXXXXXXXX_!!2534458023.jpg','FILESYSTEM',NULL),(100366,NULL,-1,'2016-05-05 10:27:11','2016-05-05 10:27:11',NULL,'jpg',106398,'/product/23330111.jpg','image/jpeg','23330111.jpg','FILESYSTEM',NULL),(100367,NULL,-1,'2016-05-05 10:27:23','2016-05-05 10:27:23',NULL,'jpg',1159304,'/product/1-7.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100368,NULL,-1,'2016-05-05 10:27:35','2016-05-05 10:27:35',NULL,'jpg',1306407,'/product/2-5.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100369,NULL,-1,'2016-05-05 10:27:42','2016-05-05 10:27:42',NULL,'jpg',1853956,'/product/3-4.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100370,NULL,-1,'2016-05-05 10:30:07','2016-05-05 10:30:07',NULL,'jpg',211403,'/product/23110972.jpg','image/jpeg','23110972.jpg','FILESYSTEM',NULL),(100371,NULL,-1,'2016-05-05 10:30:42','2016-05-05 10:30:42',NULL,'jpg',396897,'/product/1 .jpg','image/jpeg','1 .jpg','FILESYSTEM',NULL),(100372,NULL,-1,'2016-05-05 10:30:53','2016-05-05 10:30:53',NULL,'jpg',1137908,'/product/2-6.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100373,NULL,-1,'2016-05-05 10:31:03','2016-05-05 10:31:03',NULL,'jpg',166948,'/product/3..jpg','image/jpeg','3..jpg','FILESYSTEM',NULL),(100374,NULL,-1,'2016-05-05 10:31:09','2016-05-05 10:31:09',NULL,'jpg',296046,'/product/4-3.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100375,NULL,-1,'2016-05-05 10:31:19','2016-05-05 10:31:19',NULL,'jpg',497093,'/product/5-2.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100376,NULL,-1,'2016-05-05 10:34:10','2016-05-05 10:34:10',NULL,'jpg',211403,'/product/23110974.jpg','image/jpeg','23110974.jpg','FILESYSTEM',NULL),(100377,NULL,-1,'2016-05-05 10:34:22','2016-05-05 10:34:22',NULL,'jpg',396897,'/product/1  2.jpg','image/jpeg','1  2.jpg','FILESYSTEM',NULL),(100378,NULL,-1,'2016-05-05 10:36:04','2016-05-05 10:36:04',NULL,'jpg',396897,'/product/10354/1  2.jpg','image/jpeg','1  2.jpg','FILESYSTEM',NULL),(100379,NULL,-1,'2016-05-05 10:40:05','2016-05-05 10:40:05',NULL,'jpg',387470,'/product/10355/23305868.jpg','image/jpeg','23305868.jpg','FILESYSTEM',NULL),(100380,NULL,-1,'2016-05-05 10:40:17','2016-05-05 10:40:17',NULL,'jpg',568492,'/product/10355/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100381,NULL,-1,'2016-05-05 10:40:31','2016-05-05 10:40:31',NULL,'jpg',143112,'/product/10355/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100382,NULL,-1,'2016-05-05 10:40:38','2016-05-05 10:40:38',NULL,'jpg',295133,'/product/10355/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100383,NULL,-1,'2016-05-05 10:40:44','2016-05-05 10:40:44',NULL,'jpg',693366,'/product/10355/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100384,NULL,-1,'2016-05-05 10:40:50','2016-05-05 10:40:50',NULL,'jpg',437836,'/product/10355/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100385,NULL,-1,'2016-05-05 10:40:57','2016-05-05 10:40:57',NULL,'jpg',427666,'/product/10355/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100386,NULL,-1,'2016-05-05 10:43:22','2016-05-05 10:43:22',NULL,'jpg',81846,'/product/10356/20997727.jpg','image/jpeg','20997727.jpg','FILESYSTEM',NULL),(100387,NULL,-1,'2016-05-05 10:43:31','2016-05-05 10:43:31',NULL,'jpg',214063,'/product/10356/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100388,NULL,-1,'2016-05-05 10:43:37','2016-05-05 10:43:37',NULL,'jpg',146071,'/product/10356/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100389,NULL,-1,'2016-05-05 10:43:44','2016-05-05 10:43:44',NULL,'jpg',165983,'/product/10356/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100390,NULL,-1,'2016-05-05 10:43:52','2016-05-05 10:43:52',NULL,'jpg',227330,'/product/10356/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100391,NULL,-1,'2016-05-05 10:46:00','2016-05-05 10:46:00',NULL,'jpg',146071,'/product/10356/2-1.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100392,NULL,-1,'2016-05-05 10:46:15','2016-05-05 10:46:15',NULL,'jpg',157958,'/product/10356/3-1.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100393,NULL,-1,'2016-05-05 10:47:10','2016-05-05 10:47:10',NULL,'jpg',167467,'/product/10356/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100394,NULL,-1,'2016-05-05 10:47:16','2016-05-05 10:47:16',NULL,'jpg',138775,'/product/10356/9.jpg','image/jpeg','9.jpg','FILESYSTEM',NULL),(100395,NULL,-1,'2016-05-05 10:47:24','2016-05-05 10:47:24',NULL,'jpg',172640,'/product/10356/10.jpg','image/jpeg','10.jpg','FILESYSTEM',NULL),(100396,NULL,-1,'2016-05-05 10:47:47','2016-05-05 10:47:47',NULL,'jpg',114250,'/product/10356/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100397,NULL,-1,'2016-05-05 10:48:16','2016-05-05 10:48:16',NULL,'jpg',139902,'/product/10356/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100398,NULL,-1,'2016-05-05 10:52:18','2016-05-05 10:52:18',NULL,'jpg',78535,'/product/10357/20997703.jpg','image/jpeg','20997703.jpg','FILESYSTEM',NULL),(100399,NULL,-1,'2016-05-05 10:52:31','2016-05-05 10:52:31',NULL,'jpg',408289,'/product/10357/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100400,NULL,-1,'2016-05-05 10:52:37','2016-05-05 10:52:37',NULL,'jpg',190112,'/product/10357/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100401,NULL,-1,'2016-05-05 10:52:47','2016-05-05 10:52:47',NULL,'png',293327,'/product/10357/3.png','image/png','3.png','FILESYSTEM',NULL),(100402,NULL,-1,'2016-05-05 10:52:52','2016-05-05 10:52:52',NULL,'png',255887,'/product/10357/4.png','image/png','4.png','FILESYSTEM',NULL),(100403,NULL,-1,'2016-05-05 10:52:58','2016-05-05 10:52:58',NULL,'jpg',296623,'/product/10357/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100404,NULL,-1,'2016-05-05 11:07:13','2016-05-05 11:07:13',NULL,'jpg',106964,'/product/10358/a1.jpg','image/jpeg','a1.jpg','FILESYSTEM',NULL),(100405,NULL,-1,'2016-05-05 11:07:26','2016-05-05 11:07:26',NULL,'png',160904,'/product/10358/b1_01.png','image/png','b1_01.png','FILESYSTEM',NULL),(100406,NULL,-1,'2016-05-05 11:07:32','2016-05-05 11:07:32',NULL,'png',165864,'/product/10358/b1_02.png','image/png','b1_02.png','FILESYSTEM',NULL),(100407,NULL,-1,'2016-05-05 11:07:36','2016-05-05 11:07:36',NULL,'png',158908,'/product/10358/b1_04.png','image/png','b1_04.png','FILESYSTEM',NULL),(100408,NULL,-1,'2016-05-05 11:07:41','2016-05-05 11:07:41',NULL,'png',146015,'/product/10358/b1_05.png','image/png','b1_05.png','FILESYSTEM',NULL),(100409,NULL,-1,'2016-05-05 11:07:44','2016-05-05 11:07:44',NULL,'png',238766,'/product/10358/b1_06.png','image/png','b1_06.png','FILESYSTEM',NULL),(100410,NULL,-1,'2016-05-05 11:07:54','2016-05-05 11:07:54',NULL,'jpg',94346,'/product/10358/b1_07.jpg','image/jpeg','b1_07.jpg','FILESYSTEM',NULL),(100411,NULL,-1,'2016-05-05 11:08:29','2016-05-05 11:08:29',NULL,'jpg',215627,'/product/10358/a2.jpg','image/jpeg','a2.jpg','FILESYSTEM',NULL),(100412,NULL,-1,'2016-05-05 11:08:38','2016-05-05 11:08:38',NULL,'jpg',192409,'/product/10358/a3.jpg','image/jpeg','a3.jpg','FILESYSTEM',NULL),(100450,NULL,-1,'2016-05-05 12:04:14','2016-05-05 12:04:14',NULL,'jpg',211013,'/product/10400/23262597.jpg','image/jpeg','23262597.jpg','FILESYSTEM',NULL),(100451,NULL,-1,'2016-05-05 12:12:44','2016-05-05 12:12:44',NULL,'jpg',601674,'/product/10401/TB1tj73GpXXXXaDaXXXXXXXXXXX_!!0-item_pic.jpg','image/jpeg','TB1tj73GpXXXXaDaXXXXXXXXXXX_!!0-item_pic.jpg','FILESYSTEM',NULL),(100452,NULL,-1,'2016-05-05 12:23:30','2016-05-05 12:23:30',NULL,'jpg',98695,'/product/10402/23335561.jpg','image/jpeg','23335561.jpg','FILESYSTEM',NULL),(100453,NULL,-1,'2016-05-05 12:23:48','2016-05-05 12:23:48',NULL,'jpg',214989,'/product/10402/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100454,NULL,-1,'2016-05-05 12:23:55','2016-05-05 12:23:55',NULL,'jpg',131301,'/product/10402/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100455,NULL,-1,'2016-05-05 12:24:05','2016-05-05 12:24:05',NULL,'jpg',191984,'/product/10402/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100456,NULL,-1,'2016-05-05 14:32:05','2016-05-05 14:32:05',NULL,'jpg',25236,'/product/10404/12332.jpg','image/jpeg','12332.jpg','FILESYSTEM',NULL),(100457,NULL,-1,'2016-05-05 14:32:17','2016-05-05 14:32:17',NULL,'jpg',57687,'/product/10404/b1.jpg','image/jpeg','b1.jpg','FILESYSTEM',NULL),(100458,NULL,-1,'2016-05-05 14:32:29','2016-05-05 14:32:29',NULL,'jpg',62560,'/product/10404/b3.jpg','image/jpeg','b3.jpg','FILESYSTEM',NULL),(100459,NULL,-1,'2016-05-05 14:32:41','2016-05-05 14:32:41',NULL,'jpg',111616,'/product/10404/b4.jpg','image/jpeg','b4.jpg','FILESYSTEM',NULL),(100460,NULL,-1,'2016-05-05 14:32:48','2016-05-05 14:32:48',NULL,'jpg',48454,'/product/10404/b5.jpg','image/jpeg','b5.jpg','FILESYSTEM',NULL),(100461,NULL,-1,'2016-05-05 14:32:55','2016-05-05 14:32:55',NULL,'jpg',138699,'/product/10404/b6.jpg','image/jpeg','b6.jpg','FILESYSTEM',NULL),(100462,NULL,-1,'2016-05-05 14:42:09','2016-05-05 14:42:09',NULL,'jpg',231956,'/product/10405/23335196.jpg','image/jpeg','23335196.jpg','FILESYSTEM',NULL),(100463,NULL,-1,'2016-05-05 14:42:18','2016-05-05 14:42:18',NULL,'jpg',370409,'/product/10405/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100464,NULL,-1,'2016-05-05 14:42:28','2016-05-05 14:42:28',NULL,'jpg',397914,'/product/10405/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100465,NULL,-1,'2016-05-05 14:42:35','2016-05-05 14:42:35',NULL,'jpg',283653,'/product/10405/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100466,NULL,-1,'2016-05-05 14:42:46','2016-05-05 14:42:46',NULL,'jpg',410008,'/product/10405/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100467,NULL,-1,'2016-05-05 14:42:52','2016-05-05 14:42:52',NULL,'jpg',415593,'/product/10405/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100468,NULL,-1,'2016-05-05 14:43:00','2016-05-05 14:43:00',NULL,'jpg',382457,'/product/10405/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100469,NULL,-1,'2016-05-05 14:47:44','2016-05-05 14:47:44',NULL,'jpg',191783,'/product/10406/23214035.jpg','image/jpeg','23214035.jpg','FILESYSTEM',NULL),(100470,NULL,-1,'2016-05-05 14:47:55','2016-05-05 14:47:55',NULL,'gif',125839,'/product/10406/1.gif','image/gif','1.gif','FILESYSTEM',NULL),(100471,NULL,-1,'2016-05-05 14:48:02','2016-05-05 14:48:02',NULL,'gif',152932,'/product/10406/2.gif','image/gif','2.gif','FILESYSTEM',NULL),(100472,NULL,-1,'2016-05-05 14:48:10','2016-05-05 14:48:10',NULL,'gif',54488,'/product/10406/3.gif','image/gif','3.gif','FILESYSTEM',NULL),(100473,NULL,-1,'2016-05-05 14:48:18','2016-05-05 14:48:18',NULL,'gif',537361,'/product/10406/4.gif','image/gif','4.gif','FILESYSTEM',NULL),(100474,NULL,-1,'2016-05-05 14:48:26','2016-05-05 14:48:26',NULL,'jpg',289040,'/product/10406/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100475,NULL,-1,'2016-05-05 14:52:57','2016-05-05 14:52:57',NULL,'jpg',182554,'/product/10407/23214037.jpg','image/jpeg','23214037.jpg','FILESYSTEM',NULL),(100476,NULL,-1,'2016-05-05 14:53:06','2016-05-05 14:53:06',NULL,'gif',118759,'/product/10407/1.gif','image/gif','1.gif','FILESYSTEM',NULL),(100477,NULL,-1,'2016-05-05 14:54:27','2016-05-05 14:54:27',NULL,'gif',160031,'/product/10407/2.gif','image/gif','2.gif','FILESYSTEM',NULL),(100478,NULL,-1,'2016-05-05 14:54:33','2016-05-05 14:54:33',NULL,'gif',51405,'/product/10407/3.gif','image/gif','3.gif','FILESYSTEM',NULL),(100479,NULL,-1,'2016-05-05 14:54:40','2016-05-05 14:54:40',NULL,'gif',527729,'/product/10407/4.gif','image/gif','4.gif','FILESYSTEM',NULL),(100480,NULL,-1,'2016-05-05 15:02:58','2016-05-05 15:02:58',NULL,'jpg',365690,'/product/10408/20184256.jpg','image/jpeg','20184256.jpg','FILESYSTEM',NULL),(100481,NULL,-1,'2016-05-05 15:04:23','2016-05-05 15:04:23',NULL,'jpg',311032,'/product/10408/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100482,NULL,-1,'2016-05-05 15:04:31','2016-05-05 15:04:31',NULL,'jpg',366906,'/product/10408/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100483,NULL,-1,'2016-05-05 15:04:38','2016-05-05 15:04:38',NULL,'jpg',366036,'/product/10408/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100484,NULL,-1,'2016-05-05 15:04:44','2016-05-05 15:04:44',NULL,'jpg',196263,'/product/10408/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100485,NULL,-1,'2016-05-05 15:04:50','2016-05-05 15:04:50',NULL,'jpg',153749,'/product/10408/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100486,NULL,-1,'2016-05-05 15:04:57','2016-05-05 15:04:57',NULL,'jpg',288512,'/product/10408/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100487,NULL,-1,'2016-05-05 15:05:04','2016-05-05 15:05:04',NULL,'jpg',272428,'/product/10408/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100488,NULL,-1,'2016-05-05 15:05:09','2016-05-05 15:05:09',NULL,'jpg',323500,'/product/10408/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100489,NULL,-1,'2016-05-05 15:13:24','2016-05-05 15:13:24',NULL,'jpg',296883,'/product/10409/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100490,NULL,-1,'2016-05-05 15:13:43','2016-05-05 15:13:43',NULL,'jpg',290846,'/product/10409/Jersey-脱脂成人奶粉1000克.jpg','image/jpeg','Jersey-脱脂成人奶粉1000克.jpg','FILESYSTEM',NULL),(100491,NULL,-1,'2016-05-05 15:14:09','2016-05-05 15:14:09',NULL,'jpg',290846,'/product/10409/Jersey-全脂成人奶粉1000克.jpg','image/jpeg','Jersey-全脂成人奶粉1000克.jpg','FILESYSTEM',NULL),(100492,NULL,-1,'2016-05-05 15:14:28','2016-05-05 15:14:28',NULL,'jpg',321258,'/product/10409/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100493,NULL,-1,'2016-05-05 15:14:50','2016-05-05 15:14:50',NULL,'jpg',290846,'/product/10409/Jersey-脱脂成人奶粉1000克-1.jpg','image/jpeg','Jersey-脱脂成人奶粉1000克.jpg','FILESYSTEM',NULL),(100494,NULL,-1,'2016-05-05 15:19:54','2016-05-05 15:19:54',NULL,'jpg',191222,'/product/10409/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100495,NULL,-1,'2016-05-05 15:20:03','2016-05-05 15:20:03',NULL,'jpg',421882,'/product/10409/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100496,NULL,-1,'2016-05-05 15:20:12','2016-05-05 15:20:12',NULL,'jpg',296778,'/product/10409/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100497,NULL,-1,'2016-05-05 15:20:39','2016-05-05 15:20:39',NULL,'jpg',186532,'/product/10409/1-1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100498,NULL,-1,'2016-05-05 15:20:47','2016-05-05 15:20:47',NULL,'jpg',418218,'/product/10409/2-1.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100499,NULL,-1,'2016-05-05 15:20:55','2016-05-05 15:20:55',NULL,'jpg',290672,'/product/10409/3-1.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100500,NULL,-1,'2016-05-05 15:21:07','2016-05-05 15:21:07',NULL,'jpg',383764,'/product/10409/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100501,NULL,-1,'2016-05-05 15:21:17','2016-05-05 15:21:17',NULL,'jpg',294996,'/product/10409/5-1.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100502,NULL,-1,'2016-05-05 15:21:27','2016-05-05 15:21:27',NULL,'jpg',121252,'/product/10409/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100503,NULL,-1,'2016-05-05 15:21:34','2016-05-05 15:21:34',NULL,'jpg',195385,'/product/10409/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100504,NULL,-1,'2016-05-05 15:21:48','2016-05-05 15:21:48',NULL,'jpg',321258,'/product/10409/8-1.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100505,NULL,-1,'2016-05-05 15:27:23','2016-05-05 15:27:23',NULL,'jpg',261171,'/product/10409/9.jpg','image/jpeg','9.jpg','FILESYSTEM',NULL),(100506,NULL,-1,'2016-05-05 15:27:31','2016-05-05 15:27:31',NULL,'jpg',278729,'/product/10409/10.jpg','image/jpeg','10.jpg','FILESYSTEM',NULL),(100507,NULL,-1,'2016-05-05 15:27:39','2016-05-05 15:27:39',NULL,'jpg',238271,'/product/10409/11.jpg','image/jpeg','11.jpg','FILESYSTEM',NULL),(100508,NULL,-1,'2016-05-05 15:27:47','2016-05-05 15:27:47',NULL,'jpg',271336,'/product/10409/12.jpg','image/jpeg','12.jpg','FILESYSTEM',NULL),(100509,NULL,-1,'2016-05-05 15:27:54','2016-05-05 15:27:54',NULL,'jpg',354848,'/product/10409/13.jpg','image/jpeg','13.jpg','FILESYSTEM',NULL),(100510,NULL,-1,'2016-05-05 15:28:02','2016-05-05 15:28:02',NULL,'jpg',287687,'/product/10409/14.jpg','image/jpeg','14.jpg','FILESYSTEM',NULL),(100511,NULL,-1,'2016-05-05 15:32:06','2016-05-05 15:32:06',NULL,'jpg',290846,'/product/10410/Jersey-脱脂成人奶粉1000克.jpg','image/jpeg','Jersey-脱脂成人奶粉1000克.jpg','FILESYSTEM',NULL),(100512,NULL,-1,'2016-05-05 15:32:16','2016-05-05 15:32:16',NULL,'jpg',191222,'/product/10410/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100513,NULL,-1,'2016-05-05 15:32:24','2016-05-05 15:32:24',NULL,'jpg',421882,'/product/10410/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100514,NULL,-1,'2016-05-05 15:32:30','2016-05-05 15:32:30',NULL,'jpg',296778,'/product/10410/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100515,NULL,-1,'2016-05-05 15:32:36','2016-05-05 15:32:36',NULL,'jpg',386465,'/product/10410/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100516,NULL,-1,'2016-05-05 15:32:42','2016-05-05 15:32:42',NULL,'jpg',296883,'/product/10410/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100517,NULL,-1,'2016-05-05 15:32:48','2016-05-05 15:32:48',NULL,'jpg',155035,'/product/10410/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100518,NULL,-1,'2016-05-05 15:32:55','2016-05-05 15:32:55',NULL,'jpg',219645,'/product/10410/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100519,NULL,-1,'2016-05-05 15:33:01','2016-05-05 15:33:01',NULL,'jpg',272920,'/product/10410/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100520,NULL,-1,'2016-05-05 15:33:07','2016-05-05 15:33:07',NULL,'jpg',266460,'/product/10410/9.jpg','image/jpeg','9.jpg','FILESYSTEM',NULL),(100521,NULL,-1,'2016-05-05 15:33:15','2016-05-05 15:33:15',NULL,'jpg',327037,'/product/10410/10.jpg','image/jpeg','10.jpg','FILESYSTEM',NULL),(100522,NULL,-1,'2016-05-05 15:33:21','2016-05-05 15:33:21',NULL,'jpg',242726,'/product/10410/11.jpg','image/jpeg','11.jpg','FILESYSTEM',NULL),(100523,NULL,-1,'2016-05-05 15:33:28','2016-05-05 15:33:28',NULL,'jpg',275616,'/product/10410/12.jpg','image/jpeg','12.jpg','FILESYSTEM',NULL),(100524,NULL,-1,'2016-05-05 15:33:36','2016-05-05 15:33:36',NULL,'jpg',350738,'/product/10410/13.jpg','image/jpeg','13.jpg','FILESYSTEM',NULL),(100525,NULL,-1,'2016-05-05 15:33:49','2016-05-05 15:33:49',NULL,'jpg',287114,'/product/10410/14.jpg','image/jpeg','14.jpg','FILESYSTEM',NULL),(100526,NULL,-1,'2016-05-05 19:03:58','2016-05-05 19:03:58',NULL,'jpg',105456,'/product/10411/23335304.jpg','image/jpeg','23335304.jpg','FILESYSTEM',NULL),(100527,NULL,-1,'2016-05-05 19:04:07','2016-05-05 19:04:07',NULL,'jpg',320164,'/product/10411/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100528,NULL,-1,'2016-05-05 19:04:16','2016-05-05 19:04:16',NULL,'jpg',258355,'/product/10411/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100529,NULL,-1,'2016-05-05 19:04:24','2016-05-05 19:04:24',NULL,'jpg',181088,'/product/10411/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100530,NULL,-1,'2016-05-05 19:04:31','2016-05-05 19:04:31',NULL,'jpg',146819,'/product/10411/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100531,NULL,-1,'2016-05-05 19:04:37','2016-05-05 19:04:37',NULL,'jpg',171886,'/product/10411/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100532,NULL,-1,'2016-05-05 19:04:44','2016-05-05 19:04:44',NULL,'jpg',172527,'/product/10411/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100533,NULL,-1,'2016-05-05 19:04:50','2016-05-05 19:04:50',NULL,'jpg',203960,'/product/10411/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100534,NULL,-1,'2016-05-05 19:12:41','2016-05-05 19:12:41',NULL,'jpg',184178,'/product/10412/23337964.jpg','image/jpeg','23337964.jpg','FILESYSTEM',NULL),(100535,NULL,-1,'2016-05-05 19:12:49','2016-05-05 19:12:49',NULL,'png',242881,'/product/10412/1.png','image/png','1.png','FILESYSTEM',NULL),(100536,NULL,-1,'2016-05-05 19:13:06','2016-05-05 19:13:06',NULL,'png',347611,'/product/10412/2.png','image/png','2.png','FILESYSTEM',NULL),(100537,NULL,-1,'2016-05-05 19:13:17','2016-05-05 19:13:17',NULL,'png',266226,'/product/10412/3.png','image/png','3.png','FILESYSTEM',NULL),(100538,NULL,-1,'2016-05-05 19:13:30','2016-05-05 19:13:30',NULL,'png',208773,'/product/10412/4.png','image/png','4.png','FILESYSTEM',NULL),(100539,NULL,-1,'2016-05-05 19:15:10','2016-05-05 19:15:10',NULL,'png',343119,'/product/10412/5.png','image/png','5.png','FILESYSTEM',NULL),(100540,NULL,-1,'2016-05-05 19:15:16','2016-05-05 19:15:16',NULL,'png',433998,'/product/10412/6.png','image/png','6.png','FILESYSTEM',NULL),(100541,NULL,-1,'2016-05-05 19:15:22','2016-05-05 19:15:22',NULL,'png',252959,'/product/10412/7.png','image/png','7.png','FILESYSTEM',NULL),(100542,NULL,-1,'2016-05-05 19:15:29','2016-05-05 19:15:29',NULL,'png',535286,'/product/10412/8.png','image/png','8.png','FILESYSTEM',NULL),(100543,NULL,-1,'2016-05-05 19:15:34','2016-05-05 19:15:34',NULL,'png',466581,'/product/10412/9.png','image/png','9.png','FILESYSTEM',NULL),(100544,NULL,-1,'2016-05-05 19:18:33','2016-05-05 19:18:33',NULL,'jpg',118336,'/product/10413/22083955.jpg','image/jpeg','22083955.jpg','FILESYSTEM',NULL),(100545,NULL,-1,'2016-05-05 19:18:40','2016-05-05 19:18:40',NULL,'jpg',574771,'/product/10413/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100546,NULL,-1,'2016-05-05 19:18:52','2016-05-05 19:18:52',NULL,'png',679333,'/product/10413/2.png','image/png','2.png','FILESYSTEM',NULL),(100547,NULL,-1,'2016-05-05 19:19:01','2016-05-05 19:19:01',NULL,'jpg',101533,'/product/10413/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100548,NULL,-1,'2016-05-05 19:19:06','2016-05-05 19:19:06',NULL,'jpg',59195,'/product/10413/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100549,NULL,-1,'2016-05-05 19:21:43','2016-05-05 19:21:43',NULL,'jpg',218982,'/product/10414/22894783.jpg','image/jpeg','22894783.jpg','FILESYSTEM',NULL),(100550,NULL,-1,'2016-05-05 19:21:54','2016-05-05 19:21:54',NULL,'jpg',1822723,'/product/10414/TB2aMzGnpXXXXXGXXXXXXXXXXXX_!!2185467246.jpg','image/jpeg','TB2aMzGnpXXXXXGXXXXXXXXXXXX_!!2185467246.jpg','FILESYSTEM',NULL),(100551,NULL,-1,'2016-05-05 19:22:18','2016-05-05 19:22:18',NULL,'jpg',1496422,'/product/10414/TB23bCWnpXXXXXvXFXXXXXXXXXX_!!2185467246.jpg','image/jpeg','TB23bCWnpXXXXXvXFXXXXXXXXXX_!!2185467246.jpg','FILESYSTEM',NULL),(100552,NULL,-1,'2016-05-05 19:25:51','2016-05-05 19:25:51',NULL,'jpg',175373,'/product/10415/22903205.jpg','image/jpeg','22903205.jpg','FILESYSTEM',NULL),(100553,NULL,-1,'2016-05-05 19:26:01','2016-05-05 19:26:01',NULL,'jpg',463422,'/product/10415/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100554,NULL,-1,'2016-05-05 19:26:08','2016-05-05 19:26:08',NULL,'jpg',603576,'/product/10415/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100555,NULL,-1,'2016-05-05 19:26:15','2016-05-05 19:26:15',NULL,'jpg',348579,'/product/10415/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100556,NULL,-1,'2016-05-05 19:26:26','2016-05-05 19:26:26',NULL,'jpg',494321,'/product/10415/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100557,NULL,-1,'2016-05-05 19:26:32','2016-05-05 19:26:32',NULL,'jpg',433773,'/product/10415/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100558,NULL,-1,'2016-05-05 19:26:38','2016-05-05 19:26:38',NULL,'jpg',338052,'/product/10415/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100559,NULL,-1,'2016-05-05 19:26:44','2016-05-05 19:26:44',NULL,'jpg',346827,'/product/10415/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100560,NULL,-1,'2016-05-05 19:26:50','2016-05-05 19:26:50',NULL,'jpg',169142,'/product/10415/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100561,NULL,-1,'2016-05-05 19:29:57','2016-05-05 19:29:57',NULL,'jpg',113909,'/product/10416/23337638.jpg','image/jpeg','23337638.jpg','FILESYSTEM',NULL),(100562,NULL,-1,'2016-05-05 19:30:10','2016-05-05 19:30:10',NULL,'jpg',79779,'/product/10416/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100563,NULL,-1,'2016-05-05 19:30:17','2016-05-05 19:30:17',NULL,'jpg',154990,'/product/10416/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100564,NULL,-1,'2016-05-05 19:30:26','2016-05-05 19:30:26',NULL,'jpg',74908,'/product/10416/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100565,NULL,-1,'2016-05-05 19:30:31','2016-05-05 19:30:31',NULL,'jpg',113190,'/product/10416/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100566,NULL,-1,'2016-05-05 19:30:37','2016-05-05 19:30:37',NULL,'jpg',177442,'/product/10416/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100567,NULL,-1,'2016-05-05 19:30:41','2016-05-05 19:30:41',NULL,'jpg',96586,'/product/10416/6.jpg','image/jpeg','6.jpg','FILESYSTEM',NULL),(100568,NULL,-1,'2016-05-05 19:30:46','2016-05-05 19:30:46',NULL,'jpg',63721,'/product/10416/7.jpg','image/jpeg','7.jpg','FILESYSTEM',NULL),(100569,NULL,-1,'2016-05-05 19:30:52','2016-05-05 19:30:52',NULL,'jpg',278851,'/product/10416/8.jpg','image/jpeg','8.jpg','FILESYSTEM',NULL),(100570,NULL,-1,'2016-05-05 19:30:57','2016-05-05 19:30:57',NULL,'jpg',100985,'/product/10416/9.jpg','image/jpeg','9.jpg','FILESYSTEM',NULL),(100571,NULL,-1,'2016-05-05 19:31:02','2016-05-05 19:31:02',NULL,'jpg',77610,'/product/10416/10.jpg','image/jpeg','10.jpg','FILESYSTEM',NULL),(100572,NULL,-1,'2016-05-05 19:31:07','2016-05-05 19:31:07',NULL,'jpg',226419,'/product/10416/11.jpg','image/jpeg','11.jpg','FILESYSTEM',NULL),(100573,NULL,-1,'2016-05-05 19:33:06','2016-05-05 19:33:06',NULL,'jpg',99067,'/product/10417/23333399.jpg','image/jpeg','23333399.jpg','FILESYSTEM',NULL),(100574,NULL,-1,'2016-05-05 20:10:33','2016-05-05 20:10:33',NULL,'jpg',93086,'/product/10418/23331685.jpg','image/jpeg','23331685.jpg','FILESYSTEM',NULL),(100575,NULL,-1,'2016-05-05 20:10:44','2016-05-05 20:10:44',NULL,'jpg',277774,'/product/10418/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100576,NULL,-1,'2016-05-05 20:10:56','2016-05-05 20:10:56',NULL,'jpg',752869,'/product/10418/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100577,NULL,-1,'2016-05-05 20:11:02','2016-05-05 20:11:02',NULL,'jpg',597327,'/product/10418/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100578,NULL,-1,'2016-05-05 20:15:00','2016-05-05 20:15:00',NULL,'jpg',232532,'/product/10419/23331689.jpg','image/jpeg','23331689.jpg','FILESYSTEM',NULL),(100579,NULL,-1,'2016-05-05 20:15:07','2016-05-05 20:15:07',NULL,'jpg',601695,'/product/10419/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100580,NULL,-1,'2016-05-05 20:15:15','2016-05-05 20:15:15',NULL,'jpg',1385181,'/product/10419/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100581,NULL,-1,'2016-05-05 20:15:22','2016-05-05 20:15:22',NULL,'jpg',385797,'/product/10419/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100582,NULL,-1,'2016-05-05 20:15:28','2016-05-05 20:15:28',NULL,'jpg',472363,'/product/10419/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100583,NULL,-1,'2016-05-05 20:20:33','2016-05-05 20:20:33',NULL,'jpg',42910,'/product/10420/23331703.jpg','image/jpeg','23331703.jpg','FILESYSTEM',NULL),(100584,NULL,-1,'2016-05-05 20:20:44','2016-05-05 20:20:44',NULL,'jpg',312004,'/product/10420/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100585,NULL,-1,'2016-05-05 20:20:53','2016-05-05 20:20:53',NULL,'jpg',277594,'/product/10420/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100586,NULL,-1,'2016-05-05 20:21:02','2016-05-05 20:21:02',NULL,'jpg',170458,'/product/10420/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100587,NULL,-1,'2016-05-05 20:21:09','2016-05-05 20:21:09',NULL,'jpg',311212,'/product/10420/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100588,NULL,-1,'2016-05-05 20:26:37','2016-05-05 20:26:37',NULL,'jpg',103913,'/product/10421/23331705.jpg','image/jpeg','23331705.jpg','FILESYSTEM',NULL),(100589,NULL,-1,'2016-05-05 20:26:45','2016-05-05 20:26:45',NULL,'jpg',650439,'/product/10421/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100590,NULL,-1,'2016-05-05 20:26:52','2016-05-05 20:26:52',NULL,'jpg',245458,'/product/10421/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100591,NULL,-1,'2016-05-05 20:26:58','2016-05-05 20:26:58',NULL,'jpg',246531,'/product/10421/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100592,NULL,-1,'2016-05-05 20:27:03','2016-05-05 20:27:03',NULL,'jpg',413069,'/product/10421/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100593,NULL,-1,'2016-05-05 20:30:01','2016-05-05 20:30:01',NULL,'jpg',241355,'/product/10422/22434104.jpg','image/jpeg','22434104.jpg','FILESYSTEM',NULL),(100594,NULL,-1,'2016-05-05 20:35:12','2016-05-05 20:35:12',NULL,'jpg',69922,'/product/10423/23331711.jpg','image/jpeg','23331711.jpg','FILESYSTEM',NULL),(100595,NULL,-1,'2016-05-05 20:35:24','2016-05-05 20:35:24',NULL,'jpg',539711,'/product/10423/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100596,NULL,-1,'2016-05-05 20:35:32','2016-05-05 20:35:32',NULL,'jpg',336520,'/product/10423/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100597,NULL,-1,'2016-05-05 20:38:40','2016-05-05 20:38:40',NULL,'jpg',76326,'/product/10424/23331713.jpg','image/jpeg','23331713.jpg','FILESYSTEM',NULL),(100598,NULL,-1,'2016-05-05 20:38:53','2016-05-05 20:38:53',NULL,'jpg',243725,'/product/10424/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100599,NULL,-1,'2016-05-05 20:38:58','2016-05-05 20:38:58',NULL,'jpg',316489,'/product/10424/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100600,NULL,-1,'2016-05-05 20:39:03','2016-05-05 20:39:03',NULL,'jpg',113122,'/product/10424/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100601,NULL,-1,'2016-05-05 20:39:12','2016-05-05 20:39:12',NULL,'jpg',142823,'/product/10424/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100602,NULL,-1,'2016-05-05 20:39:26','2016-05-05 20:39:26',NULL,'jpg',168433,'/product/10424/5.jpg','image/jpeg','5.jpg','FILESYSTEM',NULL),(100603,NULL,-1,'2016-05-05 20:42:29','2016-05-05 20:42:29',NULL,'jpg',116454,'/product/10425/23331695.jpg','image/jpeg','23331695.jpg','FILESYSTEM',NULL),(100604,NULL,-1,'2016-05-05 20:42:37','2016-05-05 20:42:37',NULL,'jpg',238000,'/product/10425/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100605,NULL,-1,'2016-05-05 20:42:44','2016-05-05 20:42:44',NULL,'jpg',295320,'/product/10425/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100606,NULL,-1,'2016-05-05 20:42:55','2016-05-05 20:42:55',NULL,'jpg',551382,'/product/10425/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100607,NULL,-1,'2016-05-05 20:46:00','2016-05-05 20:46:00',NULL,'jpg',258225,'/product/10426/23329845.jpg','image/jpeg','23329845.jpg','FILESYSTEM',NULL),(100608,NULL,-1,'2016-05-05 20:48:00','2016-05-05 20:48:00',NULL,'jpg',191663,'/product/10427/23329843.jpg','image/jpeg','23329843.jpg','FILESYSTEM',NULL),(100609,NULL,-1,'2016-05-05 20:51:38','2016-05-05 20:51:38',NULL,'jpg',98629,'/product/10428/23329841.jpg','image/jpeg','23329841.jpg','FILESYSTEM',NULL),(100610,NULL,-1,'2016-05-05 21:41:31','2016-05-05 21:41:31',NULL,'jpg',299570,'/product/10429/20374167.jpg','image/jpeg','20374167.jpg','FILESYSTEM',NULL),(100611,NULL,-1,'2016-05-05 21:56:12','2016-05-05 21:56:12',NULL,'jpg',214574,'/product/10430/23325130.jpg','image/jpeg','23325130.jpg','FILESYSTEM',NULL),(100612,NULL,-1,'2016-05-05 21:56:59','2016-05-05 21:56:59',NULL,'jpg',329632,'/product/10431/23108478.jpg','image/jpeg','23108478.jpg','FILESYSTEM',NULL),(100613,NULL,-1,'2016-05-05 22:17:02','2016-05-05 22:17:02',NULL,'jpg',98629,'/product/10528/23329841.jpg','image/jpeg','23329841.jpg','FILESYSTEM',NULL),(100614,NULL,-1,'2016-05-05 22:17:35','2016-05-05 22:17:35',NULL,'jpg',191663,'/product/10527/23329843.jpg','image/jpeg','23329843.jpg','FILESYSTEM',NULL),(100615,NULL,-1,'2016-05-05 22:18:04','2016-05-05 22:18:04',NULL,'jpg',258225,'/product/10526/23329845.jpg','image/jpeg','23329845.jpg','FILESYSTEM',NULL),(100616,NULL,-1,'2016-05-05 22:22:43','2016-05-05 22:22:43',NULL,'jpg',225941,'/product/10512/23331809.jpg','image/jpeg','23331809.jpg','FILESYSTEM',NULL),(100617,NULL,-1,'2016-05-05 22:23:18','2016-05-05 22:23:18',NULL,'jpg',235150,'/product/10511/23331807.jpg','image/jpeg','23331807.jpg','FILESYSTEM',NULL),(100618,NULL,-1,'2016-05-05 22:23:52','2016-05-05 22:23:52',NULL,'jpg',185638,'/product/10510/23262595.jpg','image/jpeg','23262595.jpg','FILESYSTEM',NULL),(100619,NULL,-1,'2016-05-05 22:24:13','2016-05-05 22:24:13',NULL,'jpg',211013,'/product/10509/23262597.jpg','image/jpeg','23262597.jpg','FILESYSTEM',NULL),(100620,NULL,-1,'2016-05-05 22:26:13','2016-05-05 22:26:13',NULL,'jpg',78535,'/product/10507/20997703.jpg','image/jpeg','20997703.jpg','FILESYSTEM',NULL),(100621,NULL,-1,'2016-05-05 22:28:14','2016-05-05 22:28:14',NULL,'jpg',81846,'/product/10506/20997727.jpg','image/jpeg','20997727.jpg','FILESYSTEM',NULL),(100622,NULL,-1,'2016-05-05 22:29:18','2016-05-05 22:29:18',NULL,'jpg',263237,'/product/10505/23309514.jpg','image/jpeg','23309514.jpg','FILESYSTEM',NULL),(100623,NULL,-1,'2016-05-05 22:29:46','2016-05-05 22:29:46',NULL,'jpg',263237,'/product/10504/23309510.jpg','image/jpeg','23309510.jpg','FILESYSTEM',NULL),(100624,NULL,-1,'2016-05-05 22:30:02','2016-05-05 22:30:02',NULL,'jpg',187079,'/product/10503/23317022.jpg','image/jpeg','23317022.jpg','FILESYSTEM',NULL),(100625,NULL,-1,'2016-05-05 22:31:01','2016-05-05 22:31:01',NULL,'jpg',113909,'/product/10500/23337638.jpg','image/jpeg','23337638.jpg','FILESYSTEM',NULL),(100626,NULL,-1,'2016-05-05 22:31:23','2016-05-05 22:31:23',NULL,'jpg',175373,'/product/10499/22903205.jpg','image/jpeg','22903205.jpg','FILESYSTEM',NULL),(100627,NULL,-1,'2016-05-05 22:31:41','2016-05-05 22:31:41',NULL,'jpg',218982,'/product/10498/22894783.jpg','image/jpeg','22894783.jpg','FILESYSTEM',NULL),(100628,NULL,-1,'2016-05-05 22:31:58','2016-05-05 22:31:58',NULL,'jpg',49745,'/product/10497/23079232.jpg','image/jpeg','23079232.jpg','FILESYSTEM',NULL),(100629,NULL,-1,'2016-05-05 22:32:15','2016-05-05 22:32:15',NULL,'jpg',103895,'/product/10496/23225382.jpg','image/jpeg','23225382.jpg','FILESYSTEM',NULL),(100630,NULL,-1,'2016-05-05 22:32:33','2016-05-05 22:32:33',NULL,'jpg',190436,'/product/10495/23330568.jpg','image/jpeg','23330568.jpg','FILESYSTEM',NULL),(100631,NULL,-1,'2016-05-05 22:32:56','2016-05-05 22:32:56',NULL,'jpg',175072,'/product/10494/22894403.jpg','image/jpeg','22894403.jpg','FILESYSTEM',NULL),(100632,NULL,-1,'2016-05-05 22:33:12','2016-05-05 22:33:12',NULL,'jpg',176429,'/product/10493/23136512.jpg','image/jpeg','23136512.jpg','FILESYSTEM',NULL),(100633,NULL,-1,'2016-05-05 22:33:27','2016-05-05 22:33:27',NULL,'jpg',217438,'/product/10492/23275456.jpg','image/jpeg','23275456.jpg','FILESYSTEM',NULL),(100634,NULL,-1,'2016-05-05 22:33:44','2016-05-05 22:33:44',NULL,'jpg',118336,'/product/10491/22083955.jpg','image/jpeg','22083955.jpg','FILESYSTEM',NULL),(100635,NULL,-1,'2016-05-05 22:37:46','2016-05-05 22:37:46',NULL,'jpg',387470,'/product/10485/23305868.jpg','image/jpeg','23305868.jpg','FILESYSTEM',NULL),(100636,NULL,-1,'2016-05-05 22:38:02','2016-05-05 22:38:02',NULL,'jpg',211403,'/product/10484/23110974.jpg','image/jpeg','23110974.jpg','FILESYSTEM',NULL),(100637,NULL,-1,'2016-05-05 22:38:28','2016-05-05 22:38:28',NULL,'jpg',211403,'/product/10483/23110974.jpg','image/jpeg','23110974.jpg','FILESYSTEM',NULL),(100638,NULL,-1,'2016-05-05 22:38:43','2016-05-05 22:38:43',NULL,'jpg',211403,'/product/10482/23110972.jpg','image/jpeg','23110972.jpg','FILESYSTEM',NULL),(100639,NULL,-1,'2016-05-05 22:39:01','2016-05-05 22:39:01',NULL,'jpg',116454,'/product/10481/23331695.jpg','image/jpeg','23331695.jpg','FILESYSTEM',NULL),(100640,NULL,-1,'2016-05-05 22:39:16','2016-05-05 22:39:16',NULL,'jpg',76326,'/product/10480/23331713.jpg','image/jpeg','23331713.jpg','FILESYSTEM',NULL),(100641,NULL,-1,'2016-05-05 22:40:07','2016-05-05 22:40:07',NULL,'jpg',69922,'/product/10479/23331711.jpg','image/jpeg','23331711.jpg','FILESYSTEM',NULL),(100642,NULL,-1,'2016-05-05 22:40:23','2016-05-05 22:40:23',NULL,'jpg',103913,'/product/10478/23331705.jpg','image/jpeg','23331705.jpg','FILESYSTEM',NULL),(100643,NULL,-1,'2016-05-05 22:40:41','2016-05-05 22:40:41',NULL,'jpg',42910,'/product/10477/23331703.jpg','image/jpeg','23331703.jpg','FILESYSTEM',NULL),(100644,NULL,-1,'2016-05-05 22:40:57','2016-05-05 22:40:57',NULL,'jpg',80614,'/product/10476/23331697.jpg','image/jpeg','23331697.jpg','FILESYSTEM',NULL),(100645,NULL,-1,'2016-05-05 22:41:12','2016-05-05 22:41:12',NULL,'jpg',232532,'/product/10475/23331689.jpg','image/jpeg','23331689.jpg','FILESYSTEM',NULL),(100646,NULL,-1,'2016-05-05 22:41:27','2016-05-05 22:41:27',NULL,'jpg',93086,'/product/10474/23331685.jpg','image/jpeg','23331685.jpg','FILESYSTEM',NULL),(100647,NULL,-1,'2016-05-05 22:42:43','2016-05-05 22:42:43',NULL,'jpg',106398,'/product/10473/23330111.jpg','image/jpeg','23330111.jpg','FILESYSTEM',NULL),(100648,NULL,-1,'2016-05-05 22:42:58','2016-05-05 22:42:58',NULL,'jpg',184178,'/product/10472/23337964.jpg','image/jpeg','23337964.jpg','FILESYSTEM',NULL),(100649,NULL,-1,'2016-05-05 22:43:01','2016-05-05 22:43:01',NULL,'jpg',314842,'/product/10432/23108468.jpg','image/jpeg','23108468.jpg','FILESYSTEM',NULL),(100650,NULL,-1,'2016-05-05 22:43:11','2016-05-05 22:43:11',NULL,'jpg',192153,'/product/10471/23335394.jpg','image/jpeg','23335394.jpg','FILESYSTEM',NULL),(100651,NULL,-1,'2016-05-05 22:43:26','2016-05-05 22:43:26',NULL,'jpg',99067,'/product/10470/23333399.jpg','image/jpeg','23333399.jpg','FILESYSTEM',NULL),(100652,NULL,-1,'2016-05-05 22:43:39','2016-05-05 22:43:39',NULL,'jpg',105456,'/product/10469/23335304.jpg','image/jpeg','23335304.jpg','FILESYSTEM',NULL),(100653,NULL,-1,'2016-05-05 22:43:44','2016-05-05 22:43:44',NULL,'jpg',173671,'/product/10433/扇贝肉.jpg','image/jpeg','扇贝肉.jpg','FILESYSTEM',NULL),(100654,NULL,-1,'2016-05-05 22:43:53','2016-05-05 22:43:53',NULL,'jpg',98695,'/product/10468/23335561.jpg','image/jpeg','23335561.jpg','FILESYSTEM',NULL),(100655,NULL,-1,'2016-05-05 22:44:07','2016-05-05 22:44:07',NULL,'jpg',365690,'/product/10467/20184256.jpg','image/jpeg','20184256.jpg','FILESYSTEM',NULL),(100656,NULL,-1,'2016-05-05 22:44:17','2016-05-05 22:44:17',NULL,'jpg',202399,'/product/10434/23133395.jpg','image/jpeg','23133395.jpg','FILESYSTEM',NULL),(100657,NULL,-1,'2016-05-05 22:44:20','2016-05-05 22:44:20',NULL,'jpg',182554,'/product/10466/23214037.jpg','image/jpeg','23214037.jpg','FILESYSTEM',NULL),(100658,NULL,-1,'2016-05-05 22:44:32','2016-05-05 22:44:32',NULL,'jpg',191783,'/product/10465/23214035.jpg','image/jpeg','23214035.jpg','FILESYSTEM',NULL),(100659,NULL,-1,'2016-05-05 22:44:42','2016-05-05 22:44:42',NULL,'jpg',307835,'/product/10435/23113384.jpg','image/jpeg','23113384.jpg','FILESYSTEM',NULL),(100660,NULL,-1,'2016-05-05 22:44:47','2016-05-05 22:44:47',NULL,'jpg',231956,'/product/10464/23335196.jpg','image/jpeg','23335196.jpg','FILESYSTEM',NULL),(100661,NULL,-1,'2016-05-05 22:45:07','2016-05-05 22:45:07',NULL,'jpg',170321,'/product/10436/23303377.jpg','image/jpeg','23303377.jpg','FILESYSTEM',NULL),(100662,NULL,-1,'2016-05-05 22:45:34','2016-05-05 22:45:34',NULL,'jpg',164895,'/product/10462/23158864.jpg','image/jpeg','23158864.jpg','FILESYSTEM',NULL),(100663,NULL,-1,'2016-05-05 22:45:37','2016-05-05 22:45:37',NULL,'jpg',199271,'/product/10437/22651289.jpg','image/jpeg','22651289.jpg','FILESYSTEM',NULL),(100664,NULL,-1,'2016-05-05 22:46:12','2016-05-05 22:46:12',NULL,'jpg',161807,'/product/10438/21587251.jpg','image/jpeg','21587251.jpg','FILESYSTEM',NULL),(100665,NULL,-1,'2016-05-05 22:46:51','2016-05-05 22:46:51',NULL,'jpg',254072,'/product/10439/22209508.jpg','image/jpeg','22209508.jpg','FILESYSTEM',NULL),(100666,NULL,-1,'2016-05-05 22:46:53','2016-05-05 22:46:53',NULL,'jpg',306257,'/product/10459/23301430.jpg','image/jpeg','23301430.jpg','FILESYSTEM',NULL),(100667,NULL,-1,'2016-05-05 22:47:07','2016-05-05 22:47:07',NULL,'jpg',276908,'/product/10458/23332889.jpg','image/jpeg','23332889.jpg','FILESYSTEM',NULL),(100668,NULL,-1,'2016-05-05 22:47:26','2016-05-05 22:47:26',NULL,'jpg',313515,'/product/10457/22599862.jpg','image/jpeg','22599862.jpg','FILESYSTEM',NULL),(100669,NULL,-1,'2016-05-05 22:47:32','2016-05-05 22:47:32',NULL,'jpg',193107,'/product/10440/23334224.jpg','image/jpeg','23334224.jpg','FILESYSTEM',NULL),(100670,NULL,-1,'2016-05-05 22:47:41','2016-05-05 22:47:41',NULL,'jpg',310682,'/product/10456/23133423.jpg','image/jpeg','23133423.jpg','FILESYSTEM',NULL),(100671,NULL,-1,'2016-05-05 22:47:56','2016-05-05 22:47:56',NULL,'jpg',267831,'/product/10455/23133421.jpg','image/jpeg','23133421.jpg','FILESYSTEM',NULL),(100672,NULL,-1,'2016-05-05 22:48:11','2016-05-05 22:48:11',NULL,'jpg',233311,'/product/10454/23333020.jpg','image/jpeg','23333020.jpg','FILESYSTEM',NULL),(100673,NULL,-1,'2016-05-05 22:48:25','2016-05-05 22:48:25',NULL,'jpg',211552,'/product/10453/23194635.jpg','image/jpeg','23194635.jpg','FILESYSTEM',NULL),(100674,NULL,-1,'2016-05-05 22:48:28','2016-05-05 22:48:28',NULL,'jpg',162047,'/product/10441/23122333.jpg','image/jpeg','23122333.jpg','FILESYSTEM',NULL),(100675,NULL,-1,'2016-05-05 22:48:39','2016-05-05 22:48:39',NULL,'jpg',218613,'/product/10452/23194637.jpg','image/jpeg','23194637.jpg','FILESYSTEM',NULL),(100676,NULL,-1,'2016-05-05 22:48:47','2016-05-05 22:48:47',NULL,'jpg',231167,'/product/10442/01884931.jpg','image/jpeg','01884931.jpg','FILESYSTEM',NULL),(100677,NULL,-1,'2016-05-05 22:48:53','2016-05-05 22:48:53',NULL,'jpg',326252,'/product/10451/23155257.jpg','image/jpeg','23155257.jpg','FILESYSTEM',NULL),(100678,NULL,-1,'2016-05-05 22:49:06','2016-05-05 22:49:06',NULL,'jpg',160606,'/product/10450/00289961.jpg','image/jpeg','00289961.jpg','FILESYSTEM',NULL),(100679,NULL,-1,'2016-05-05 22:49:08','2016-05-05 22:49:08',NULL,'jpg',166197,'/product/10443/22919047.jpg','image/jpeg','22919047.jpg','FILESYSTEM',NULL),(100680,NULL,-1,'2016-05-05 22:49:20','2016-05-05 22:49:20',NULL,'jpg',190280,'/product/10449/22826219.jpg','image/jpeg','22826219.jpg','FILESYSTEM',NULL),(100681,NULL,-1,'2016-05-05 22:49:27','2016-05-05 22:49:27',NULL,'jpg',164304,'/product/10444/22700513.jpg','image/jpeg','22700513.jpg','FILESYSTEM',NULL),(100682,NULL,-1,'2016-05-05 22:49:58','2016-05-05 22:49:58',NULL,'jpg',140502,'/product/10448/22796773.jpg','image/jpeg','22796773.jpg','FILESYSTEM',NULL),(100683,NULL,-1,'2016-05-05 22:49:59','2016-05-05 22:49:59',NULL,'jpg',231024,'/product/10445/22700517.jpg','image/jpeg','22700517.jpg','FILESYSTEM',NULL),(100684,NULL,-1,'2016-05-05 22:50:11','2016-05-05 22:50:11',NULL,'jpg',198637,'/product/10447/02380206.jpg','image/jpeg','02380206.jpg','FILESYSTEM',NULL),(100685,NULL,-1,'2016-05-05 22:50:18','2016-05-05 22:50:18',NULL,'jpg',237223,'/product/10446/23337906.jpg','image/jpeg','23337906.jpg','FILESYSTEM',NULL),(100686,NULL,-1,'2016-05-05 22:51:39','2016-05-05 22:51:39',NULL,'jpg',194722,'/product/10501/阿巴町三代儿童智能手表.jpg','image/jpeg','阿巴町三代儿童智能手表.jpg','FILESYSTEM',NULL),(100687,NULL,-1,'2016-05-05 22:52:06','2016-05-05 22:52:06',NULL,'jpg',347075,'/product/10484/纯棉空调被200230.jpg','image/jpeg','纯棉空调被200230.jpg','FILESYSTEM',NULL),(100688,NULL,-1,'2016-05-05 22:52:42','2016-05-05 22:52:42',NULL,'jpg',142666,'/product/10508/花姿青花尚品卷筒纸160g10.jpg','image/jpeg','花姿青花尚品卷筒纸160g10.jpg','FILESYSTEM',NULL),(100689,NULL,-1,'2016-05-05 22:53:02','2016-05-05 22:53:02',NULL,'jpg',91203,'/product/10502/华为畅享5S.jpg','image/jpeg','华为畅享5S.jpg','FILESYSTEM',NULL),(100690,NULL,-1,'2016-05-05 22:53:50','2016-05-05 22:53:50',NULL,'jpg',123350,'/product/10490/锦骏1比12遥控车.jpg','image/jpeg','锦骏1比12遥控车.jpg','FILESYSTEM',NULL),(100691,NULL,-1,'2016-05-05 22:54:41','2016-05-05 22:54:41',NULL,'jpg',266446,'/product/10513/亲子装（T恤）男装.jpg','image/jpeg','亲子装（T恤）男装.jpg','FILESYSTEM',NULL),(100692,NULL,-1,'2016-05-05 22:54:50','2016-05-05 22:54:50',NULL,'jpg',266446,'/product/10514/亲子装（T恤）男装.jpg','image/jpeg','亲子装（T恤）男装.jpg','FILESYSTEM',NULL),(100693,NULL,-1,'2016-05-05 22:54:59','2016-05-05 22:54:59',NULL,'jpg',266446,'/product/10515/亲子装（T恤）男装.jpg','image/jpeg','亲子装（T恤）男装.jpg','FILESYSTEM',NULL),(100694,NULL,-1,'2016-05-05 22:55:38','2016-05-05 22:55:38',NULL,'jpg',266446,'/product/10517/亲子装（T恤）女装.jpg','image/jpeg','亲子装（T恤）女装.jpg','FILESYSTEM',NULL),(100695,NULL,-1,'2016-05-05 22:55:45','2016-05-05 22:55:45',NULL,'jpg',266446,'/product/10518/亲子装（T恤）女装.jpg','image/jpeg','亲子装（T恤）女装.jpg','FILESYSTEM',NULL),(100696,NULL,-1,'2016-05-05 22:55:52','2016-05-05 22:55:52',NULL,'jpg',266446,'/product/10519/亲子装（T恤）女装.jpg','image/jpeg','亲子装（T恤）女装.jpg','FILESYSTEM',NULL),(100697,NULL,-1,'2016-05-05 22:56:39','2016-05-05 22:56:39',NULL,'jpg',266446,'/product/10522/亲子装（T恤）童装.jpg','image/jpeg','亲子装（T恤）童装.jpg','FILESYSTEM',NULL),(100698,NULL,-1,'2016-05-05 22:56:47','2016-05-05 22:56:47',NULL,'jpg',266446,'/product/10523/亲子装（T恤）童装.jpg','image/jpeg','亲子装（T恤）童装.jpg','FILESYSTEM',NULL),(100699,NULL,-1,'2016-05-05 22:57:22','2016-05-05 22:57:22',NULL,'jpg',404861,'/product/10486/维洁牛皮席150x195.jpg','image/jpeg','维洁牛皮席150x195.jpg','FILESYSTEM',NULL),(100700,NULL,-1,'2016-05-05 22:57:34','2016-05-05 22:57:34',NULL,'jpg',404861,'/product/10487/维洁牛皮席180x200.jpg','image/jpeg','维洁牛皮席180x200.jpg','FILESYSTEM',NULL),(100701,NULL,-1,'2016-05-05 22:58:58','2016-05-05 22:58:58',NULL,'jpg',169841,'/product/10488/14寸小龙哈彼自行车(男款).jpg','image/jpeg','14寸小龙哈彼自行车(男款).jpg','FILESYSTEM',NULL),(100702,NULL,-1,'2016-05-05 22:59:08','2016-05-05 22:59:08',NULL,'jpg',189195,'/product/10489/14寸小龙哈彼自行车(女款).jpg','image/jpeg','14寸小龙哈彼自行车(女款).jpg','FILESYSTEM',NULL),(100703,NULL,-1,'2016-05-05 23:02:43','2016-05-05 23:02:43',NULL,'jpg',160321,'/product/10463/ptj.jpg','image/jpeg','ptj.jpg','FILESYSTEM',NULL),(100704,NULL,-1,'2016-05-05 23:03:38','2016-05-05 23:03:38',NULL,'jpg',290846,'/product/10460/Jersey-脱脂成人奶粉1000克.jpg','image/jpeg','Jersey-脱脂成人奶粉1000克.jpg','FILESYSTEM',NULL),(100705,NULL,-1,'2016-05-05 23:04:04','2016-05-05 23:04:04',NULL,'jpg',290846,'/product/10461/Jersey-全脂成人奶粉1000克.jpg','image/jpeg','Jersey-全脂成人奶粉1000克.jpg','FILESYSTEM',NULL),(100706,NULL,-1,'2016-05-05 23:06:40','2016-05-05 23:06:40',NULL,'jpg',266446,'/product/10521/亲子装（T恤）童装.jpg','image/jpeg','亲子装（T恤）童装.jpg','FILESYSTEM',NULL),(100750,NULL,-1,'2016-05-06 14:02:19','2016-05-06 14:02:19',NULL,'jpg',80614,'/product/10530/23331697.jpg','image/jpeg','23331697.jpg','FILESYSTEM',NULL),(100800,NULL,-1,'2016-05-06 14:20:49','2016-05-06 14:20:49',NULL,'jpg',80614,'/product/10530/23331697-1.jpg','image/jpeg','23331697.jpg','FILESYSTEM',NULL),(100801,NULL,-1,'2016-05-06 14:20:57','2016-05-06 14:20:57',NULL,'jpg',741993,'/product/10530/1.jpg','image/jpeg','1.jpg','FILESYSTEM',NULL),(100802,NULL,-1,'2016-05-06 14:21:05','2016-05-06 14:21:05',NULL,'jpg',632711,'/product/10530/2.jpg','image/jpeg','2.jpg','FILESYSTEM',NULL),(100803,NULL,-1,'2016-05-06 14:21:11','2016-05-06 14:21:11',NULL,'jpg',559488,'/product/10530/3.jpg','image/jpeg','3.jpg','FILESYSTEM',NULL),(100804,NULL,-1,'2016-05-06 14:21:18','2016-05-06 14:21:18',NULL,'jpg',182684,'/product/10530/4.jpg','image/jpeg','4.jpg','FILESYSTEM',NULL),(100805,NULL,-1,'2016-05-06 14:56:53','2016-05-06 14:56:53',NULL,'jpg',54039,'/product/10520/花1家成女.jpg','image/jpeg','花1家成女.jpg','FILESYSTEM',NULL),(100806,NULL,-1,'2016-05-06 14:58:44','2016-05-06 14:58:44',NULL,'jpg',51667,'/product/10525/花1家小男.jpg','image/jpeg','花1家小男.jpg','FILESYSTEM',NULL),(100807,NULL,-1,'2016-05-06 14:59:33','2016-05-06 14:59:33',NULL,'jpg',50614,'/product/10524/花1家小女.jpg','image/jpeg','花1家小女.jpg','FILESYSTEM',NULL);

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

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `coupon_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_type` tinyint(4) NOT NULL COMMENT '优惠券类型',
  `coupon_value` int(11) NOT NULL COMMENT '优惠券金额',
  `coupon_amount` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券数量',
  `coupon_desc` varchar(100) DEFAULT NULL COMMENT '使用规则描述',
  `updatedOn` datetime NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `coupon` */

insert  into `coupon`(`coupon_id`,`coupon_type`,`coupon_value`,`coupon_amount`,`coupon_desc`,`updatedOn`,`createdOn`) values (1,0,5,7998,'购买满50元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(2,1,10,100,'购买满88元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(3,2,50,20,'购买满150元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(4,3,88,5,'购买满200元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(5,4,5,3,'购买满50元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(6,5,5,4,'购买满50元可用','2016-04-28 13:42:10','2016-04-28 13:42:10');

/*Table structure for table `customaddressimpl` */

DROP TABLE IF EXISTS `customaddressimpl`;

CREATE TABLE `customaddressimpl` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `FKACEFD3E3C13085DD` (`ADDRESS_ID`),
  CONSTRAINT `FKACEFD3E3C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customaddressimpl` */

/*Table structure for table `customer_coupon_xref` */

DROP TABLE IF EXISTS `customer_coupon_xref`;

CREATE TABLE `customer_coupon_xref` (
  `customer_coupon_xref_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `coupon_status` tinyint(4) DEFAULT '0' COMMENT '优惠券使用状态,默认未使用',
  `updatedOn` datetime NOT NULL,
  `createdOn` datetime NOT NULL,
  `shop_id` bigint(20) DEFAULT NULL COMMENT '优惠券兑换门店',
  `is_new_coupon` tinyint(4) DEFAULT '1' COMMENT '是否是新获取的优惠券',
  PRIMARY KEY (`customer_coupon_xref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

/*Data for the table `customer_coupon_xref` */

/*Table structure for table `customer_extend` */

DROP TABLE IF EXISTS `customer_extend`;

CREATE TABLE `customer_extend` (
  `customer_id` bigint(20) unsigned NOT NULL,
  `test` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_extend` */

insert  into `customer_extend`(`customer_id`,`test`) values (9000,NULL);

/*Table structure for table `customer_fivecard_xref` */

DROP TABLE IF EXISTS `customer_fivecard_xref`;

CREATE TABLE `customer_fivecard_xref` (
  `active_date` datetime DEFAULT NULL COMMENT '激活时间',
  `create_date` datetime DEFAULT NULL COMMENT '发卡时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `fivecard_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '五折卡领取状态，默认为未领取',
  `type` tinyint(4) NOT NULL COMMENT '五折卡类型',
  `referer` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  `is_show_dialog` tinyint(4) DEFAULT '0' COMMENT '是否已经提示过用户获取卡券成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

/*Data for the table `customer_fivecard_xref` */

/*Table structure for table `fivecard` */

DROP TABLE IF EXISTS `fivecard`;

CREATE TABLE `fivecard` (
  `card_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `card_name` varchar(30) NOT NULL,
  `card_no` char(13) NOT NULL,
  `card_desc` varchar(100) DEFAULT NULL,
  `card_type` tinyint(4) NOT NULL DEFAULT '0',
  `card_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

/*Data for the table `fivecard` */

insert  into `fivecard`(`card_id`,`card_name`,`card_no`,`card_desc`,`card_type`,`card_status`) values (1,'自主五折卡','7400050012190','A卡',0,1),(2,'自主五折卡','7400050089376','A卡',0,1),(3,'自主五折卡','7400050098903','A卡',0,1),(4,'自主五折卡','7400050147472','A卡',0,1),(5,'自主五折卡','7400050155545','A卡',0,1),(6,'自主五折卡','7400050163489','A卡',0,1),(7,'自主五折卡','7400050169566','A卡',0,1),(8,'自主五折卡','7400050201716','A卡',0,0),(9,'自主五折卡','7400050208104','A卡',0,0),(10,'自主五折卡','7400050238521','A卡',0,0),(11,'自主五折卡','7400050239894','A卡',0,0),(12,'自主五折卡','7400050267934','A卡',0,0),(13,'自主五折卡','7400050287161','A卡',0,0),(14,'自主五折卡','7400050337545','A卡',0,0),(15,'自主五折卡','7400050467969','A卡',0,0),(16,'自主五折卡','7400050470938','A卡',0,0),(17,'自主五折卡','7400050474134','A卡',0,0),(18,'自主五折卡','7400050526079','A卡',0,0),(19,'自主五折卡','7400050530007','A卡',0,0),(20,'自主五折卡','7400050556618','A卡',0,0),(21,'自主五折卡','7400050593262','A卡',0,0),(22,'自主五折卡','7400050598373','A卡',0,0),(23,'自主五折卡','7400050609697','A卡',0,0),(24,'自主五折卡','7400050644513','A卡',0,0),(25,'自主五折卡','7400050653935','A卡',0,0),(26,'自主五折卡','7400050654567','A卡',0,0),(27,'自主五折卡','7400050711000','A卡',0,0),(28,'自主五折卡','7400050751259','A卡',0,0),(29,'自主五折卡','7400050774463','A卡',0,0),(30,'自主五折卡','7400050874163','A卡',0,0),(52,'分享五折卡','7400057128674','B卡',1,1),(53,'分享五折卡','7400057131520','B卡',1,1),(54,'分享五折卡','7400057170284','B卡',1,1),(55,'分享五折卡','7400057181129','B卡',1,1),(56,'分享五折卡','7400057195072','B卡',1,0),(57,'分享五折卡','7400057210850','B卡',1,0),(58,'分享五折卡','7400057224949','B卡',1,0),(59,'分享五折卡','7400057251662','B卡',1,0),(60,'分享五折卡','7400057254045','B卡',1,0),(61,'分享五折卡','7400057307116','B卡',1,0),(62,'分享五折卡','7400057365093','B卡',1,0),(63,'分享五折卡','7400057374460','B卡',1,0),(64,'分享五折卡','7400057377607','B卡',1,0),(65,'分享五折卡','7400057489867','B卡',1,0),(66,'分享五折卡','7400057503976','B卡',1,0),(67,'分享五折卡','7400057532433','B卡',1,0),(68,'分享五折卡','7400057565950','B卡',1,0),(69,'分享五折卡','7400057587105','B卡',1,0),(70,'分享五折卡','7400057587426','B卡',1,0),(71,'分享五折卡','7400057621502','B卡',1,0),(72,'分享五折卡','7400057632942','B卡',1,0),(73,'分享五折卡','7400057634717','B卡',1,0),(74,'分享五折卡','7400057635301','B卡',1,0),(75,'分享五折卡','7400057648073','B卡',1,0),(76,'分享五折卡','7400057649728','B卡',1,0),(77,'分享五折卡','7400057658003','B卡',1,0),(78,'分享五折卡','7400057674379','B卡',1,0),(79,'分享五折卡','7400057679985','B卡',1,0),(80,'分享五折卡','7400057766456','B卡',1,0),(81,'分享五折卡','7400057768139','B卡',1,0);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (146);

/*Table structure for table `order_extend` */

DROP TABLE IF EXISTS `order_extend`;

CREATE TABLE `order_extend` (
  `ORDER_EXTEND_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_extend` */

/*Table structure for table `product_extend` */

DROP TABLE IF EXISTS `product_extend`;

CREATE TABLE `product_extend` (
  `PRODUCT_EXTEND_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(200) DEFAULT NULL,
  `SALES` bigint(20) DEFAULT '0' COMMENT '销售量',
  `product_style` varchar(20) DEFAULT NULL COMMENT 'style',
  `product_sku` varchar(10) DEFAULT NULL COMMENT 'sku',
  `product_department` varchar(20) DEFAULT NULL COMMENT '部门',
  `sale_limit` bigint(20) DEFAULT NULL COMMENT '限购数量',
  PRIMARY KEY (`PRODUCT_EXTEND_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `product_extend_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `product_extend` */

insert  into `product_extend`(`PRODUCT_EXTEND_ID`,`PRODUCT_ID`,`PROMOTION_MESSAGE`,`SALES`,`product_style`,`product_sku`,`product_department`,`sale_limit`) values (8,10251,'限购数量:6',1,'23122333','231223331','008',6),(9,10252,'限购数量:4',6,'22796773','227967739','050',4),(10,10253,'限购数量:4',1,'22826219','228262194','050',4),(11,10254,'限购数量:4',0,'21587251','215872517','053',4),(12,10255,'限购数量:4',0,'22599862','225998629','084',4),(13,10256,'限购数量:5',0,'23337906','233379061','011',5),(14,10257,'限购数量:4',0,'00289961','02899612','017',4),(15,10258,'限购数量:4',0,'23155257','231552572','084',4),(16,10259,'限购数量:2',0,'01884931','18849318','007',2),(17,10260,'限购数量:2',0,'23325130','233251308','002',2),(18,10261,'限量购买:2',0,'02380206','23802065','117',2),(19,10262,'限购数量:4',0,'23194637','231946376','084',4),(20,10263,'限购数量:4',0,'23194635','231946368','084',4),(21,10264,'限购数量:4',0,'23333020','233330208','084',4),(22,10265,'限购数量:4',0,'23133421','231334214','084',4),(23,10266,'限购数量:4',0,'23133423','231334230','084',4),(24,10300,'限购数量:4',0,'233328890','23332889','009',4),(25,10301,'限购数量:4',0,'233014306','23301430','009',4),(26,10302,'限购数量:4',0,'229190472','22919047','007',4),(27,10303,'限购数量:4',0,'227005139','22700513','010',4),(28,10304,'限购数量:4',0,'227005171','22700517','010',4),(29,10305,'限购数量:2',0,'23303377','233033777','053',2),(30,10306,'限购数量:2',0,'22651289','226512894','053',2),(31,10307,'限购数量:2',0,'23317022','233170227','122',2),(32,10308,'限购数量:2',0,'23309510','233095101','122',2),(33,10309,'限购数量:6',0,'23158864','231588658','018',6),(34,10310,'限购数量:2',0,'23309514','233095144','013',2),(35,10311,'限购数量:4',0,'23331807','233318070','016',4),(36,10350,'限购数量:4',0,'23331809','233318097','040',4),(37,10351,'限购数量:6',0,'23335394','233353941','101',6),(38,10352,'限购数量:2',0,'23330111','233301119','107',2),(39,10353,'限购数量:2',0,'23110972','231109725','026',2),(40,10354,'限购数量:2',0,'23110974','231109741','026',2),(41,10355,'限购数量:2',0,'23305868','233058680','013',2),(42,10356,'限购数量:2',0,'20997727','209977272','013',2),(43,10357,'限购数量:2',0,'20997703','209977035','013',2),(44,10358,'限购数量:2',0,'New','New','015',2),(45,10400,'限购数量:2',0,'23262597','232625972','015',2),(46,10401,'限购数量:2',0,'23262595','232625956','015',2),(47,10402,'限购数量:2',0,'23335561','233355618','025',2),(49,10404,'限购数量:6',0,'22958044','229580440','018',6),(50,10405,'限购数量:4',0,'23335196','233351965','019',4),(51,10406,'限购数量:2',0,'23214035','232140359','019',2),(52,10407,'限购数量:2',0,'23214037','232140375','085',2),(53,10408,'限购数量:2',0,'20184256','201842564','025',2),(54,10409,'限购数量:2',0,'23339477','233394788','009',2),(55,10410,'限购数量:2',0,'23339479','233394796','009',2),(56,10411,'限购数量:2',0,'23335304','233353046','066',2),(57,10412,'限购数量:3',0,'23337964','233379649','107',3),(58,10413,'限购数量:2',0,'22083955','220839557','097',2),(59,10414,'限购数量:2',0,'22894783','228947839','049',2),(60,10415,'限购数量:2',0,'22903205','229032052','049',2),(61,10416,'限购数量:2',0,'23337638','233376380','078',2),(62,10417,'限购数量:3',0,'23333399','233333991','066',3),(63,10418,'限购数量:2',0,'23331685','233316868','033',2),(64,10419,'限购数量:2',0,'23331689','233316892','033',2),(65,10420,'限购数量:2',0,'23331703','233317031','033',2),(66,10421,'限购数量:2',0,'23331705','233317058','033',2),(67,10422,'限购数量:2',0,'dafda','sdfda','023232',324),(68,10423,'限购数量:2',0,'23331711','233317112','033',2),(69,10424,'限购数量:2',0,'23331713','233317139','033',2),(70,10425,'限购数量:2',0,'23331695','233316957','033',2),(71,10426,'限购数量:2',0,'23329845','233298452','096',2),(72,10427,'限购数量:2',0,'23329843','233298436','096',2),(73,10428,'限购数量:2',0,'23329841','233298428','096',2),(75,10530,'限购数量:2',0,'23331697','233316973','033',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `qrcode` */

insert  into `qrcode`(`id`,`code`,`usedate`,`status`,`usedby`) values (1,'7195007950571',NULL,0,NULL),(2,'7196007950585',NULL,1,NULL),(3,'7197007950599',NULL,0,NULL),(4,'7198007950602',NULL,0,NULL),(5,'7199007950616',NULL,0,NULL),(6,'7199007950623',NULL,0,NULL),(7,'7190007950637',NULL,0,NULL),(8,'7191007950641',NULL,0,NULL),(9,'7192007950655',NULL,0,NULL),(10,'7193007950669',NULL,0,NULL),(11,'7194007950673',NULL,0,NULL),(12,'7194007950680',NULL,0,NULL),(13,'7195007950694',NULL,0,NULL),(14,'7196007950707',NULL,0,NULL),(15,'7197007950711',NULL,0,NULL),(16,'7198007950725',NULL,0,NULL),(17,'7198007950732',NULL,0,NULL),(18,'7199007950746',NULL,0,NULL),(19,'7190007950750',NULL,0,NULL),(20,'7191007950764',NULL,0,NULL),(21,'7192007950778',NULL,0,NULL),(22,'7194007950789',NULL,0,NULL),(23,'7194007950796',NULL,0,NULL),(24,'7195007950809',NULL,0,NULL),(25,'7196007950813',NULL,0,NULL),(26,'7197007950827',NULL,0,NULL),(27,'7198007950831',NULL,0,NULL),(28,'7199007950845',NULL,0,NULL),(29,'7199007950852',NULL,0,NULL),(30,'7190007950866',NULL,0,NULL),(31,'7191007950870',NULL,0,NULL),(32,'7192007950884',NULL,0,NULL),(33,'7193007950898',NULL,0,NULL),(34,'7193007950904',NULL,0,NULL),(35,'7194007950918',NULL,0,NULL),(36,'7195007950922',NULL,0,NULL),(37,'7196007950936',NULL,0,NULL),(38,'7196007950943',NULL,0,NULL),(39,'7197007950957',NULL,0,NULL),(40,'7198007950961',NULL,0,NULL),(41,'7199007950975',NULL,0,NULL),(42,'7199007950982',NULL,0,NULL),(43,'7190007950996',NULL,0,NULL),(44,'7191007951006',NULL,0,NULL),(45,'7193007951017',NULL,0,NULL),(46,'7194007951021',NULL,0,NULL),(47,'7195007951035',NULL,0,NULL),(48,'7196007951049',NULL,0,NULL),(49,'7197007951053',NULL,0,NULL),(50,'7197007951060',NULL,0,NULL),(51,'7198007951074',NULL,0,NULL),(52,'7199007951088',NULL,0,NULL),(53,'7190007951092',NULL,0,NULL),(54,'7191007951105',NULL,0,NULL),(55,'7191007951112',NULL,0,NULL),(56,'7192007951126',NULL,0,NULL),(57,'7193007951130',NULL,0,NULL),(58,'7194007951144',NULL,0,NULL),(59,'7195007951158',NULL,0,NULL),(60,'7196007951162',NULL,0,NULL),(61,'7196007951179',NULL,0,NULL),(62,'7197007951183',NULL,1,NULL),(63,'7198007951197',NULL,0,NULL),(64,'7199007951200',NULL,0,NULL),(65,'7190007951214',NULL,0,NULL),(66,'7190007951221',NULL,0,NULL),(67,'7191007951235',NULL,0,NULL),(68,'7193007951246',NULL,0,NULL),(69,'7194007951250',NULL,0,NULL),(70,'7195007951264',NULL,0,NULL),(71,'7196007951278',NULL,0,NULL),(72,'7197007951282',NULL,0,NULL),(73,'7197007951299',NULL,0,NULL),(74,'7198007951302',NULL,0,NULL),(75,'7199007951316',NULL,0,NULL),(76,'7190007951320',NULL,0,NULL),(77,'7191007951334',NULL,0,NULL),(78,'7191007951341',NULL,0,NULL),(79,'7192007951355',NULL,0,NULL),(80,'7193007951369',NULL,0,NULL),(81,'7194007951373',NULL,0,NULL),(82,'7195007951387',NULL,0,NULL),(83,'7195007951394',NULL,0,NULL),(84,'7196007951407',NULL,0,NULL),(85,'7197007951411',NULL,0,NULL),(86,'7198007951425',NULL,0,NULL),(87,'7199007951439',NULL,0,NULL),(88,'7190007951443',NULL,0,NULL),(89,'7191007951457',NULL,0,NULL),(90,'7191007951464',NULL,0,NULL),(91,'7193007951475',NULL,0,NULL),(92,'7194007951489',NULL,0,NULL),(93,'7195007951493',NULL,0,NULL),(94,'7196007951506',NULL,0,NULL),(95,'7197007951510',NULL,0,NULL),(96,'7197007951527',NULL,0,NULL),(97,'7198007951531',NULL,0,NULL),(98,'7199007951545',NULL,0,NULL),(99,'7190007951559',NULL,0,NULL),(100,'7191007951563',NULL,0,NULL);

/*Table structure for table `sequence_generator` */

DROP TABLE IF EXISTS `sequence_generator`;

CREATE TABLE `sequence_generator` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sequence_generator` */

insert  into `sequence_generator`(`ID_NAME`,`ID_VAL`) values ('AddressImpl',2701),('AdminRoleImpl',151),('AdminUserImpl',151),('CategoryExcludedSearchFacetImpl',1000),('CategoryImpl',10200),('CategoryProductImpl',1000),('CategoryProductXrefImpl',2000),('CategorySearchFacetImpl',1050),('CategoryXrefImpl',1100),('ChallengeQuestionImpl',1000),('CrossSaleProductImpl',101),('CustomerAddressImpl',2051),('CustomerAttributeImpl',6901),('CustomerRoleImpl',3001),('EmailTrackingImpl',3151),('FeaturedProductImpl',1050),('FieldDefinitionImpl',1000),('FieldEnumerationImpl',1000),('FieldEnumerationItemImpl',1000),('FieldGroupImpl',1000),('FieldImpl',1000),('FulfillmentGroupImpl',3301),('FulfillmentGroupItemImpl',3451),('FulfillmentOptionImpl',1000),('MediaImpl',100950),('OfferCodeImpl',1050),('OfferImpl',1000),('OfferItemCriteriaImpl',1000),('OrderAttributeImpl',251),('OrderImpl',3351),('OrderItemAttributeImpl',301),('OrderItemImpl',3451),('OrderItemPriceDetailImpl',3451),('OrderPaymentImpl',251),('PageFieldImpl',1000),('PageImpl',1000),('PageTemplateImpl',1000),('PaymentTransactionImpl',251),('PersonalMessageImpl',151),('PhoneImpl',2251),('ProductAttributeImpl',1500),('ProductImpl',10679),('ProductOptionImpl',1050),('ProductOptionValueImpl',1050),('ProductOptionXrefImpl',1150),('RoleImpl',1000),('SandBoxImpl',201),('SandBoxManagementImpl',201),('SearchFacetImpl',1000),('SearchFacetRangeImpl',1000),('SearchInterceptImpl',1000),('SkuAttributeImpl',101),('SkuImpl',10850),('StaticAssetImpl',100900),('StructuredContentFieldImpl',1000),('StructuredContentImpl',1000),('StructuredContentRuleImpl',1000),('StructuredContentTypeImpl',1000),('SystemPropertyImpl',101),('UpSaleProductImpl',101),('URLHandlerImpl',1000);

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
  `shop_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26D2F6F5A0978D` (`shop_account_id`),
  CONSTRAINT `FK26D2F6F5A0978D` FOREIGN KEY (`shop_account_id`) REFERENCES `shop_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

insert  into `shop`(`id`,`area`,`code`,`province`,`city`,`name`,`address`,`shop_account_id`) values (37,'南区','014','广东','广州','三元里店','广州市三元里华园1号',99),(38,'','016','广东','广州','天河店','广州市车陂路399号',100),(39,'','080','广东','广州','花都店','广州市花都区公益路27号百业广场3楼',101),(40,'','085','广东','广州','长兴店','广州市天河区长湴村长兴路13号高德汇购物中心',102),(41,'','090','广东','广州','黄石店','广州市白云区黄石西路南面金国商业广场',103),(42,'','096','广东','佛山','金沙洲店','佛山市金沙洲国昌新城市广场',104),(43,'','017','广东','佛山','南海店','佛山市南海桂城桂澜路南海城市休闲广场',106),(44,'','051','广东','佛山','三水店','佛山市三水区西南镇三水广场',108),(45,'','066','广东','佛山','黄歧店','佛山市南海区黄歧广佛一路98号嘉洲广场',109),(46,'','071','广东','佛山','顺德店','佛山市顺德区容桂桂洲大道华夏新城',110),(47,'','097','广东','佛山','乐从店','佛山市顺德区乐从镇乐从大道南星光广场',111),(48,'','103','广东','佛山','怡丰城店','佛山南海区平洲佛平四路与石龙路交界',112),(49,'','084','广东','汕头','金平店','汕头市汕樟路41号',119),(50,'','015','广东','汕头','汕头店','汕头市长平东路丰泽庄卜蜂莲花商城',114),(51,'','042','广东','汕头','澄海店','汕头市澄海区城区324国道西侧同益路南侧',115),(52,'','104','广东','汕头','天山店','汕头市龙湖区长江路23号长平新一城商业广场负一层',123),(53,'','106','广东','汕头','东厦店','汕头市金平区东厦北路与华山北路交汇处卜蜂莲花',124),(54,'','107','广东','汕头','中信店','汕头市潮阳区棉北街道潮阳中信华庭负一层、一至三层局部',125),(55,'','070','广东','揭阳','揭阳店','揭阳市黄岐山大道与环市北路东南侧（御景花园西区）',116),(56,'','083','广东','揭阳','榕城店','揭阳市榕城区临江南路与同心路西南角江南新城',118),(57,'','079','广东','潮州','潮州店','潮州市潮枫路枫溪车站路段北侧',117),(58,'','094','广东','潮州','潮安店','潮州市潮安县潮汕公路与安北路交界处东南角 ',120),(59,'','098','广东','揭阳市','普宁店','普宁市流沙环市北路普宁广场万泰汇购物中心负一层',121),(60,'','101','广东','梅州','梅州店','梅州市梅县区广梅路与科技路交汇处',122),(61,'','102','广东','湛江市','鼎盛店','霞山区人民大道南116号鼎盛广场',127),(62,'','105','广东','阳西市','阳西店','阳西县人民大道凯旋商业广场',126),(63,'','109','广东','廉江市','廉江店','廉江市南北大道南与石城大道交界鑫源国际广场',128),(64,'','108','广东','增城市','新塘店','增城市新塘镇汽车城大道71号东凌广场',105),(65,'','031','广东','江门市','江门店','江门市建设二路99号双龙广场',107),(66,'','110','广东','中山市','小榄店','中山市小榄镇环镇北路与北秀路交汇处—百汇时代广场',113);

/*Table structure for table `shop_account` */

DROP TABLE IF EXISTS `shop_account`;

CREATE TABLE `shop_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mchid` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `appsecret` varchar(100) NOT NULL,
  `shop_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

/*Data for the table `shop_account` */

insert  into `shop_account`(`id`,`appid`,`name`,`mchid`,`key`,`appsecret`,`shop_code`) values (99,'wx937fba8914a5d9a9','三元里','10010514','xVVm9pGXwwJpAQWkhJDszfi46wtBX1EQ','1974155fda854243a2a4b08c2928bf92','014'),(100,'wx937fba8914a5d9a9','天河','1281605801','BC018B996C9107107DF1AC73E703C8DA','1974155fda854243a2a4b08c2928bf92','016'),(101,'wx937fba8914a5d9a9','花都','1324991401','CACB7A4C00A841E238D000C28A8F123E','1974155fda854243a2a4b08c2928bf92','080'),(102,'wx937fba8914a5d9a9','长兴','1283571001','115501F176015149AF6D22DA569C1E95','1974155fda854243a2a4b08c2928bf92','085'),(103,'wx937fba8914a5d9a9','黄石','1281924301','905A886EE8C28E4816BC804195B0249E','1974155fda854243a2a4b08c2928bf92','090'),(104,'wx937fba8914a5d9a9','金沙洲','1278795201','562d8ba6bf2bc562d8ba6bf337562d8b','1974155fda854243a2a4b08c2928bf92','096'),(105,'wx937fba8914a5d9a9','东凌店','1326016401','2AF7BB955D60964E3CD2C62BFDA1CA9E','1974155fda854243a2a4b08c2928bf92','108'),(106,'wx937fba8914a5d9a9','南海','1281623301','B15E5C5A17527604C1D536F3C08F8F1D','1974155fda854243a2a4b08c2928bf92','017'),(107,'wx937fba8914a5d9a9','江门','1281633801','26BE5777F714518C990B0B119A9325BE','1974155fda854243a2a4b08c2928bf92','031'),(108,'wx937fba8914a5d9a9','三水','1281765801','801D50291388A4AC8B699E4B43FB392F','1974155fda854243a2a4b08c2928bf92','051'),(109,'wx937fba8914a5d9a9','黄岐','1281804201','4E1BFA18A9970E2551AB96FC491A25C5','1974155fda854243a2a4b08c2928bf92','066'),(110,'wx937fba8914a5d9a9','顺德','1281829501','B2D4A5CC6781F49D5033E01DE7541A76','1974155fda854243a2a4b08c2928bf92','071'),(111,'wx937fba8914a5d9a9','乐从','1281933401','F2EA8D74E583B5986E74719BA2964316','1974155fda854243a2a4b08c2928bf92','097'),(112,'wx937fba8914a5d9a9','怡丰城','1282278301','8145A32DA48DB24FFDE9BAB17164E8DD','1974155fda854243a2a4b08c2928bf92','103'),(113,'wx937fba8914a5d9a9','中山小榄店','1324985201','11EBA122A77A7AD761B93D85BAA3935B','1974155fda854243a2a4b08c2928bf92','110'),(114,'wx937fba8914a5d9a9','汕头','1281597701','1FDD78A7B584F48B194CAEE2D035D6B3','1974155fda854243a2a4b08c2928bf92','015'),(115,'wx937fba8914a5d9a9','澄海','1281682701','E1A59CC6B350A27452B1B860217C2AE5','1974155fda854243a2a4b08c2928bf92','042'),(116,'wx937fba8914a5d9a9','揭阳','1281813501','B5B742BCBE7FD36B4A49F2C2C779D283','1974155fda854243a2a4b08c2928bf92','070'),(117,'wx937fba8914a5d9a9','潮州','1281842701','A534585E7E4B969A516B0F29B8281410','1974155fda854243a2a4b08c2928bf92','079'),(118,'wx937fba8914a5d9a9','榕城','1281864501','3185FEB3881B8C48290C463CB2ABA290','1974155fda854243a2a4b08c2928bf92','083'),(119,'wx937fba8914a5d9a9','金平','1281874701','F85D211FB0FE8CA8464EDC046C995D57','1974155fda854243a2a4b08c2928bf92','084'),(120,'wx937fba8914a5d9a9','潮安','1324996801','6CD64F448731B74A8E0045F8D29B936E','1974155fda854243a2a4b08c2928bf92','094'),(121,'wx937fba8914a5d9a9','普宁','1281936501','628D3ADD7794F2F04E23ADC992596887','1974155fda854243a2a4b08c2928bf92','098'),(122,'wx937fba8914a5d9a9','梅州','1282228201','D1D8DA2F48B95D43D5C852439CF089B6','1974155fda854243a2a4b08c2928bf92','101'),(123,'wx937fba8914a5d9a9','天山店','1282294601','BF544FA7E4F635FB27FB0770E838104F','1974155fda854243a2a4b08c2928bf92','104'),(124,'wx937fba8914a5d9a9','东厦店','1281939601','0BC936E9849A9B315074C187D739C537','1974155fda854243a2a4b08c2928bf92','106'),(125,'wx937fba8914a5d9a9','中信店','1282217901','864CF9E6E0EF325F3C7FC52A7F27A73A','1974155fda854243a2a4b08c2928bf92','107'),(126,'wx937fba8914a5d9a9','阳西','1282306901','DC802864B9A0EE826FABE6B2DBB42D35','1974155fda854243a2a4b08c2928bf92','105'),(127,'wx937fba8914a5d9a9','湛江','1282262401','7EBB6366189E4162758B80FE47049C0D','1974155fda854243a2a4b08c2928bf92','102'),(128,'wx937fba8914a5d9a9','廉江','1324982401','4EADF4E23EF8D79457AD8E1D18DFD9F8','1974155fda854243a2a4b08c2928bf92','109');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

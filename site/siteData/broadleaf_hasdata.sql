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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `address_shop` */

insert  into `address_shop`(`id`,`shop_id`,`address_id`) values (34,3,951),(35,4,1001),(36,3,1051),(37,52,1101),(38,50,1102),(39,49,1151),(40,47,1201),(41,59,1251),(42,57,1303),(43,45,1351),(44,43,1401),(45,55,1451),(46,42,1501),(47,63,1551),(48,60,1601),(49,39,1651),(50,37,1701),(51,37,1702),(52,37,1703),(53,55,1751),(54,37,1801),(55,37,1851),(56,55,1901),(57,55,1902),(58,55,1903),(59,64,1904),(60,64,1905),(61,64,1906),(62,64,1907),(63,64,1908),(64,64,1909),(65,64,1910),(66,56,1951),(67,64,1952),(68,56,1953),(69,56,1954),(70,56,1955),(71,56,1956),(72,64,2001),(73,64,2002),(74,37,2051),(75,64,2052),(76,37,2053),(77,38,2101),(78,57,2102),(79,37,2103),(80,37,2151);

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

insert  into `blc_address`(`ADDRESS_ID`,`ADDRESS_LINE1`,`ADDRESS_LINE2`,`ADDRESS_LINE3`,`CITY`,`COMPANY_NAME`,`COUNTY`,`EMAIL_ADDRESS`,`FAX`,`FIRST_NAME`,`IS_ACTIVE`,`IS_BUSINESS`,`IS_DEFAULT`,`LAST_NAME`,`POSTAL_CODE`,`PRIMARY_PHONE`,`SECONDARY_PHONE`,`STANDARDIZED`,`TOKENIZED_ADDRESS`,`VERIFICATION_LEVEL`,`ZIP_FOUR`,`COUNTRY`,`PHONE_FAX_ID`,`PHONE_PRIMARY_ID`,`PHONE_SECONDARY_ID`,`STATE_PROV_REGION`) values (2051,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dsdsdf',1,0,1,'default','default',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1751,NULL,NULL),(2052,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dafad',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,'CA',NULL,1752,NULL,NULL),(2053,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dafad',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,'CA',NULL,1753,NULL,NULL),(2101,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dafad',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,'CA',NULL,1801,NULL,NULL),(2102,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dafad',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,'CA',NULL,1802,NULL,NULL),(2103,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dsdsdf',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,'CA',NULL,1803,NULL,NULL),(2151,'default',NULL,NULL,'default',NULL,NULL,NULL,NULL,'dsdsdf',1,0,0,'default','default',NULL,NULL,0,NULL,NULL,NULL,'CA',NULL,1851,NULL,NULL);

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

insert  into `blc_category`(`CATEGORY_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`ARCHIVED`,`DESCRIPTION`,`DISPLAY_TEMPLATE`,`FULFILLMENT_TYPE`,`INVENTORY_TYPE`,`LONG_DESCRIPTION`,`NAME`,`TAX_CODE`,`URL`,`URL_KEY`,`DEFAULT_PARENT_CATEGORY_ID`) values (1,NULL,'2016-04-06 15:28:24',NULL,'Root',NULL,NULL,NULL,NULL,'根',NULL,NULL,NULL,NULL),(2,NULL,'2016-04-06 15:28:24',NULL,'Primary Nav',NULL,NULL,NULL,NULL,'主导航',NULL,NULL,NULL,1),(2001,NULL,'2016-04-06 15:28:24',NULL,'Home','layout/home',NULL,NULL,NULL,'首页',NULL,'/index',NULL,NULL),(2002,NULL,'2016-04-06 15:28:24',NULL,'Hot Sauces',NULL,NULL,NULL,NULL,'撒欢儿吃',NULL,'/dining',NULL,2),(2003,NULL,'2016-04-06 15:28:24',NULL,'Merchandise',NULL,NULL,NULL,NULL,'可劲儿喝',NULL,'/drinking',NULL,2),(2004,NULL,'2016-04-06 15:28:24',NULL,'Clearance',NULL,NULL,NULL,NULL,'放开玩儿',NULL,'/playing',NULL,2),(2005,NULL,'2016-04-06 15:28:24','Y','New to Hot Sauce?',NULL,NULL,'CHECK_QUANTITY',NULL,'New to Hot Sauce?',NULL,'/new-to-hot-sauce',NULL,2),(2006,NULL,'2016-04-06 15:28:24','Y','FAQs',NULL,NULL,NULL,NULL,'FAQs',NULL,'/faq',NULL,2),(9950,NULL,'2016-04-07 10:02:34','N',NULL,NULL,NULL,NULL,'<p>happy乐</p>','happy乐',NULL,'/fun',NULL,2),(10000,NULL,'2016-04-12 14:33:27','Y',NULL,NULL,NULL,NULL,'优惠卡券','优惠卡券',NULL,'/promotion',NULL,2);

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

insert  into `blc_category_product_xref`(`CATEGORY_PRODUCT_ID`,`DISPLAY_ORDER`,`CATEGORY_ID`,`PRODUCT_ID`) values (1350,NULL,2001,10150),(1351,NULL,2001,10151),(1352,NULL,2001,10152);

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

insert  into `blc_customer`(`CUSTOMER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`CHALLENGE_ANSWER`,`DEACTIVATED`,`EMAIL_ADDRESS`,`FIRST_NAME`,`LAST_NAME`,`PASSWORD`,`PASSWORD_CHANGE_REQUIRED`,`IS_PREVIEW`,`RECEIVE_EMAIL`,`IS_REGISTERED`,`TAX_EXEMPTION_CODE`,`USER_NAME`,`CHALLENGE_QUESTION_ID`,`LOCALE_CODE`) values (7400,0,'2016-05-03 16:26:32',NULL,NULL,NULL,0,'default','jackie','o1Py0tx91UJXWdtT_gD9xMdI5Rdo','o1Py0tx91UJXWdtT_gD9xMdI5Rdo{7400}',0,NULL,1,1,NULL,'o1Py0tx91UJXWdtT_gD9xMdI5Rdo',NULL,NULL);

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

insert  into `blc_customer_address`(`CUSTOMER_ADDRESS_ID`,`ADDRESS_NAME`,`ADDRESS_ID`,`CUSTOMER_ID`) values (1551,'收货地址',2051,7400);

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

insert  into `blc_customer_attribute`(`CUSTOMER_ATTR_ID`,`NAME`,`VALUE`,`CUSTOMER_ID`) values (1701,'country','中国',7400),(1702,'unionid','ocaz-sguoC7Z2I2wRPu-b3uojmhE',7400),(1703,'subscribe','1',7400),(1704,'city','成都',7400),(1705,'openid','o1Py0tx91UJXWdtT_gD9xMdI5Rdo',7400),(1706,'sex','1',7400),(1707,'groupid','0',7400),(1708,'language','zh_CN',7400),(1709,'remark','',7400),(1710,'subscribe_time','1461896099',7400),(1711,'province','四川',7400),(1712,'P2PData',NULL,7400),(1713,'nickname','jackie',7400),(1714,'headimgurl','http://wx.qlogo.cn/mmopen/RRTrAq8sOqGRPnjva2YQCSmT2OM9EUSsXicMx1EKWLxaibgOhVDuOQX3lKgiaOJrgf2lbXUtj9DdKpwCR60gpW9TBXWdSv2sFnq/0',7400);

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

insert  into `blc_customer_role`(`CUSTOMER_ROLE_ID`,`CUSTOMER_ID`,`ROLE_ID`) values (1801,7400,1);

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

insert  into `blc_discrete_order_item`(`BASE_RETAIL_PRICE`,`BASE_SALE_PRICE`,`ORDER_ITEM_ID`,`BUNDLE_ORDER_ITEM_ID`,`PRODUCT_ID`,`SKU_ID`,`SKU_BUNDLE_ITEM_ID`) values ('200.00000','99.00000',2651,NULL,10151,10251,NULL),('200.00000','99.00000',2652,NULL,10151,10251,NULL),('100.00000','10.00000',2701,NULL,10152,10252,NULL),('200.00000','99.00000',2702,NULL,10151,10251,NULL),('200.00000','99.00000',2703,NULL,10151,10251,NULL),('200.00000','99.00000',2751,NULL,10151,10251,NULL);

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

insert  into `blc_email_tracking`(`EMAIL_TRACKING_ID`,`DATE_SENT`,`EMAIL_ADDRESS`,`TYPE`) values (1,'2016-04-07 10:43:32','scottfield@qq.com',NULL),(2,'2016-04-07 10:44:14','scottfield@qq.com',NULL),(51,'2016-04-11 11:00:30','scottfield@qq.com',NULL),(52,'2016-04-11 11:03:03','scottfield@qq.com',NULL),(101,'2016-04-11 13:29:49','scottfield@qq.com',NULL),(102,'2016-04-11 14:16:45','scottfield@qq.com',NULL),(151,'2016-04-12 10:13:15','scottfield@qq.com',NULL),(207,'2016-04-22 12:52:55','default',NULL),(251,'2016-04-22 14:36:22','default',NULL),(301,'2016-04-22 15:57:48','default',NULL),(302,'2016-04-22 15:59:55','default',NULL),(351,'2016-04-22 16:29:38','default',NULL),(352,'2016-04-22 18:17:42','default',NULL),(353,'2016-04-23 03:02:25','default',NULL),(354,'2016-04-23 09:07:10','default',NULL),(401,'2016-04-23 19:44:57','default',NULL),(451,'2016-04-23 20:13:35','default',NULL),(452,'2016-04-23 20:17:11','default',NULL),(501,'2016-04-24 17:43:42','default',NULL),(551,'2016-04-24 18:28:58','default',NULL),(552,'2016-04-24 18:37:19','default',NULL),(601,'2016-04-24 20:00:50','default',NULL),(651,'2016-04-25 15:15:11','default',NULL),(701,'2016-04-25 16:43:49','default',NULL),(751,'2016-04-26 15:17:21','default',NULL),(752,'2016-04-26 15:29:53','default',NULL),(801,'2016-04-26 18:32:41','default',NULL),(851,'2016-04-27 11:45:43','default',NULL),(901,'2016-04-27 17:28:23','default',NULL),(951,'2016-04-28 10:09:46','default',NULL),(1001,'2016-04-28 10:41:31','default',NULL),(1051,'2016-04-28 11:33:12','default',NULL),(1101,'2016-04-28 13:50:30','default',NULL),(1151,'2016-04-28 14:09:17','default',NULL),(1201,'2016-04-29 09:53:46','default',NULL),(1202,'2016-04-29 09:53:48','default',NULL),(1203,'2016-04-29 09:57:12','default',NULL),(1204,'2016-04-29 09:58:16','default',NULL),(1205,'2016-04-29 10:08:42','default',NULL),(1206,'2016-04-29 10:12:45','default',NULL),(1207,'2016-04-29 10:15:12','default',NULL),(1251,'2016-04-29 10:37:13','default',NULL),(1301,'2016-04-29 10:58:36','default',NULL),(1351,'2016-04-29 11:00:28','default',NULL),(1401,'2016-04-29 13:26:30','default',NULL),(1451,'2016-05-01 12:38:51','default',NULL),(1501,'2016-05-01 21:10:03','default',NULL),(1502,'2016-05-01 21:14:25','default',NULL),(1551,'2016-05-01 21:21:09','default',NULL),(1601,'2016-05-02 11:01:46','default',NULL),(1651,'2016-05-03 11:16:27','default',NULL),(1701,'2016-05-03 11:20:36','default',NULL),(1751,'2016-05-03 13:50:07','default',NULL),(1801,'2016-05-03 14:19:53','default',NULL),(1802,'2016-05-03 14:35:14','default',NULL),(1851,'2016-05-03 14:59:34','default',NULL),(1901,'2016-05-03 16:06:22','default',NULL),(1951,'2016-05-03 16:26:33','default',NULL);

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

insert  into `blc_fulfillment_group`(`FULFILLMENT_GROUP_ID`,`DELIVERY_INSTRUCTION`,`PRICE`,`SHIPPING_PRICE_TAXABLE`,`MERCHANDISE_TOTAL`,`METHOD`,`IS_PRIMARY`,`REFERENCE_NUMBER`,`RETAIL_PRICE`,`SALE_PRICE`,`FULFILLMENT_GROUP_SEQUNCE`,`SERVICE`,`SHIPPING_OVERRIDE`,`STATUS`,`TOTAL`,`TOTAL_FEE_TAX`,`TOTAL_FG_TAX`,`TOTAL_ITEM_TAX`,`TOTAL_TAX`,`TYPE`,`ADDRESS_ID`,`FULFILLMENT_OPTION_ID`,`ORDER_ID`,`PERSONAL_MESSAGE_ID`,`PHONE_ID`) values (2501,NULL,'0.00000',0,'99.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'99.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,2651,NULL,NULL),(2502,NULL,'0.00000',0,'99.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'99.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,2652,NULL,NULL),(2551,NULL,'0.00000',0,'10.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'10.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,2701,NULL,NULL),(2552,NULL,'0.00000',0,'99.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'99.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,2702,NULL,NULL),(2553,NULL,'0.00000',0,'99.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'99.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,2703,NULL,NULL),(2601,NULL,'0.00000',0,'99.00000',NULL,0,NULL,'0.00000','0.00000',NULL,NULL,NULL,NULL,'99.00000','0.00000','0.00000','0.00000','0.00000',NULL,NULL,NULL,2751,NULL,NULL);

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

insert  into `blc_fulfillment_group_item`(`FULFILLMENT_GROUP_ITEM_ID`,`PRORATED_ORDER_ADJ`,`QUANTITY`,`STATUS`,`TOTAL_ITEM_AMOUNT`,`TOTAL_ITEM_TAXABLE_AMOUNT`,`TOTAL_ITEM_TAX`,`FULFILLMENT_GROUP_ID`,`ORDER_ITEM_ID`) values (2651,'0.00',1,NULL,'99.00000','99.00000','0.00000',2501,2651),(2652,'0.00',1,NULL,'99.00000','99.00000','0.00000',2502,2652),(2701,'0.00',1,NULL,'10.00000','10.00000','0.00000',2551,2701),(2702,'0.00',1,NULL,'99.00000','99.00000','0.00000',2552,2702),(2703,'0.00',1,NULL,'99.00000','99.00000','0.00000',2553,2703),(2751,'0.00',1,NULL,'99.00000','99.00000','0.00000',2601,2751);

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

insert  into `blc_id_generation`(`ID_TYPE`,`BATCH_SIZE`,`BATCH_START`,`ID_MIN`,`ID_MAX`,`version`) values ('org.broadleafcommerce.profile.core.domain.Customer',100,7500,NULL,NULL,75);

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

insert  into `blc_media`(`MEDIA_ID`,`ALT_TEXT`,`TAGS`,`TITLE`,`URL`) values (99951,'happy乐','happy乐','happy乐','/cmsstatic/category/99951/in_21-11.png'),(100150,'撒欢儿吃','撒欢儿吃','撒欢儿吃','/cmsstatic/category/2002/in_21.png'),(100151,'可劲儿喝','可劲儿喝','可劲儿喝','/cmsstatic/category/2003/in_21-09.png'),(100152,'放开玩儿','放开玩儿','放开玩儿','/cmsstatic/category/2004/in_21-10.png'),(100200,NULL,NULL,NULL,'/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg'),(100350,NULL,NULL,NULL,'/cmsstatic/product/9950/ii_11.png'),(100352,NULL,NULL,NULL,'/cmsstatic/img/sauces/Green-Ghost-Close.jpg'),(100353,NULL,NULL,NULL,'/cmsstatic/img/sauces/Sweet-Death-Sauce-Tile.jpg');

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

insert  into `blc_order`(`ORDER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`EMAIL_ADDRESS`,`NAME`,`ORDER_NUMBER`,`IS_PREVIEW`,`ORDER_STATUS`,`ORDER_SUBTOTAL`,`SUBMIT_DATE`,`TAX_OVERRIDE`,`ORDER_TOTAL`,`TOTAL_SHIPPING`,`TOTAL_TAX`,`CURRENCY_CODE`,`CUSTOMER_ID`,`LOCALE_CODE`) values (2651,7400,'2016-05-03 16:26:47','2016-05-03 17:22:00',7400,'default',NULL,'201605031627006352651',NULL,'CANCELLED','99.00000','2016-05-03 16:27:01',NULL,'99.00000','0.00000','0.00000','CNY',7400,'zh_CN'),(2652,7400,'2016-05-03 16:27:22','2016-05-03 17:22:00',7400,'default',NULL,'201605031627378202652',NULL,'CANCELLED','99.00000','2016-05-03 16:27:38',NULL,'99.00000','0.00000','0.00000','CNY',7400,'zh_CN'),(2701,7400,'2016-05-03 17:21:47','2016-05-03 17:59:39',7400,'default',NULL,'201605031722001912701',NULL,'CANCELLED','10.00000','2016-05-03 17:22:00',NULL,'10.00000','0.00000','0.00000','CNY',7400,'zh_CN'),(2702,7400,'2016-05-03 17:23:01','2016-05-03 17:59:39',7400,'default',NULL,'201605031723184652702',NULL,'CANCELLED','99.00000','2016-05-03 17:23:18',NULL,'99.00000','0.00000','0.00000','CNY',7400,'zh_CN'),(2703,7400,'2016-05-03 17:26:42','2016-05-03 17:59:40',7400,'default',NULL,'201605031734252982703',NULL,'CANCELLED','99.00000','2016-05-03 17:34:25',NULL,'99.00000','0.00000','0.00000','CNY',7400,'zh_CN'),(2751,7400,'2016-05-03 17:59:49','2016-05-03 18:00:00',7400,'default',NULL,'201605031759597192751',NULL,'UNPAID','99.00000','2016-05-03 18:00:00',NULL,'99.00000','0.00000','0.00000','CNY',7400,'zh_CN');

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

insert  into `blc_order_item`(`ORDER_ITEM_ID`,`DISCOUNTS_ALLOWED`,`ITEM_TAXABLE_FLAG`,`NAME`,`ORDER_ITEM_TYPE`,`PRICE`,`QUANTITY`,`RETAIL_PRICE`,`RETAIL_PRICE_OVERRIDE`,`SALE_PRICE`,`SALE_PRICE_OVERRIDE`,`TOTAL_TAX`,`CATEGORY_ID`,`GIFT_WRAP_ITEM_ID`,`ORDER_ID`,`PARENT_ORDER_ITEM_ID`,`PERSONAL_MESSAGE_ID`) values (2651,NULL,NULL,'测试产品2','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','99.00000',1,'200.00000',NULL,'99.00000',NULL,NULL,2001,NULL,2651,NULL,NULL),(2652,NULL,NULL,'测试产品2','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','99.00000',1,'200.00000',NULL,'99.00000',NULL,NULL,2001,NULL,2652,NULL,NULL),(2701,NULL,NULL,'测试产品3','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','10.00000',1,'100.00000',NULL,'10.00000',NULL,NULL,2001,NULL,2701,NULL,NULL),(2702,NULL,NULL,'测试产品2','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','99.00000',1,'200.00000',NULL,'99.00000',NULL,NULL,2001,NULL,2702,NULL,NULL),(2703,NULL,NULL,'测试产品2','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','99.00000',1,'200.00000',NULL,'99.00000',NULL,NULL,2001,NULL,2703,NULL,NULL),(2751,NULL,NULL,'测试产品2','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','99.00000',1,'200.00000',NULL,'99.00000',NULL,NULL,2001,NULL,2751,NULL,NULL);

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

insert  into `blc_order_item_price_dtl`(`ORDER_ITEM_PRICE_DTL_ID`,`QUANTITY`,`USE_SALE_PRICE`,`ORDER_ITEM_ID`) values (2651,1,1,2651),(2652,1,1,2652),(2701,1,1,2701),(2702,1,1,2702),(2703,1,1,2703),(2751,1,1,2751);

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

insert  into `blc_phone`(`PHONE_ID`,`IS_ACTIVE`,`IS_DEFAULT`,`PHONE_NUMBER`) values (1751,1,0,'43534'),(1752,1,0,'23432432'),(1753,1,0,'23432432'),(1801,1,0,'23432432'),(1802,1,0,'23432432'),(1803,1,0,'43534'),(1851,1,0,'43534');

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

insert  into `blc_product`(`PRODUCT_ID`,`ARCHIVED`,`CAN_SELL_WITHOUT_OPTIONS`,`DISPLAY_TEMPLATE`,`IS_FEATURED_PRODUCT`,`MANUFACTURE`,`MODEL`,`URL`,`URL_KEY`,`DEFAULT_CATEGORY_ID`,`DEFAULT_SKU_ID`) values (1,'Y',NULL,NULL,1,'Blair\'s',NULL,'/hot-sauces/sudden_death_sauce',NULL,2002,NULL),(2,'Y',NULL,NULL,0,'Blair\'s',NULL,'/hot-sauces/sweet_death_sauce',NULL,2002,NULL),(3,'Y',NULL,NULL,0,'Salsa Express',NULL,'/hot-sauces/hoppin_hot_sauce',NULL,2002,NULL),(4,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,2002,NULL),(5,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,2002,NULL),(6,'Y',NULL,NULL,0,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,2002,NULL),(7,'Y',NULL,NULL,0,'Garden Row',NULL,'/hot-sauces/green_ghost',NULL,2002,NULL),(8,'Y',NULL,NULL,0,'D. L. Jardine\'s',NULL,'/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,2002,NULL),(9,'Y',NULL,NULL,1,'Figueroa Brothers',NULL,'/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,2002,NULL),(10,'Y',NULL,NULL,0,'Figueroa Brothers',NULL,'/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,2002,NULL),(11,'Y',NULL,NULL,0,'Brazos Legends',NULL,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,2002,NULL),(12,'Y',NULL,NULL,0,'Garden Row',NULL,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,2002,NULL),(13,'Y',NULL,NULL,1,'Brazos Legends',NULL,'/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,2002,NULL),(14,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,2002,NULL),(15,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_garlic_hot_sauce',NULL,2002,NULL),(16,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/scotch_bonnet_hot_sauce',NULL,2002,NULL),(17,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/insanity_sauce',NULL,2002,NULL),(18,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,2002,NULL),(19,'Y',NULL,NULL,0,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,2002,NULL),(100,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,2003,NULL),(200,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,2003,NULL),(300,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,2003,NULL),(400,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,2003,NULL),(500,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_mens',NULL,2003,NULL),(600,'Y',NULL,NULL,0,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_womens',NULL,2003,NULL),(992,'Y',0,NULL,0,NULL,NULL,'/bundle1',NULL,NULL,NULL),(993,'Y',0,NULL,0,NULL,NULL,'/bundle2',NULL,NULL,NULL),(9950,'Y',0,NULL,1,'香奈儿',NULL,'/chanel',NULL,9950,NULL),(10000,'Y',0,NULL,0,'美即',NULL,'/product-meiji-facialmask',NULL,2001,NULL),(10001,'Y',0,NULL,0,NULL,NULL,'/product-cleanclear-mask',NULL,2001,NULL),(10002,'Y',0,NULL,0,NULL,NULL,'/product-facial-mask',NULL,2001,NULL),(10050,'Y',0,NULL,0,NULL,NULL,'/product-custom',NULL,2001,NULL),(10100,'Y',0,NULL,0,NULL,NULL,'/dfddd',NULL,2001,NULL),(10101,'Y',0,NULL,0,NULL,NULL,'/test',NULL,2001,NULL),(10102,'Y',0,NULL,0,NULL,NULL,'/test2',NULL,2001,NULL),(10103,'Y',0,NULL,0,NULL,NULL,'/test3',NULL,2001,NULL),(10150,'N',0,NULL,1,'美即面膜',NULL,'/test',NULL,2001,10250),(10151,'N',0,NULL,0,'hot saurce',NULL,'/test2',NULL,2001,10251),(10152,'N',0,NULL,1,'hot sauce',NULL,'/test3',NULL,2001,10252);

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

insert  into `blc_sku`(`SKU_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`AVAILABLE_FLAG`,`DESCRIPTION`,`CONTAINER_SHAPE`,`DEPTH`,`DIMENSION_UNIT_OF_MEASURE`,`GIRTH`,`HEIGHT`,`CONTAINER_SIZE`,`WIDTH`,`DISCOUNTABLE_FLAG`,`FULFILLMENT_TYPE`,`INVENTORY_TYPE`,`IS_MACHINE_SORTABLE`,`LONG_DESCRIPTION`,`NAME`,`RETAIL_PRICE`,`SALE_PRICE`,`TAX_CODE`,`TAXABLE_FLAG`,`WEIGHT`,`WEIGHT_UNIT_OF_MEASURE`,`CURRENCY_CODE`,`DEFAULT_PRODUCT_ID`,`QUANTITY_AVAILABLE`) values (111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,NULL,'5ml','800.00000','600.00000',NULL,NULL,NULL,NULL,NULL,NULL,19),(10002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,NULL,'10ml','1600.00000','1200.00000',NULL,NULL,NULL,NULL,NULL,NULL,10),(10100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'fda','fdafa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20),(10250,NULL,'2016-05-01 12:37:44',NULL,'测试产品简介',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'测试产品图文详情<br><p><img src=\"/cmsstatic/product/9950/ii_11.png\"></p>','测试产品','300.00000','200.00000',NULL,NULL,NULL,NULL,NULL,10150,0),(10251,NULL,'2016-05-01 13:37:59',NULL,'测试产品2简介',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'CHECK_QUANTITY',1,'<p>图文详情</p><p><img src=\"/cmsstatic/img/sauces/Sweet-Death-Sauce-Logo.jpg\"><br></p>','测试产品2','200.00000','99.00000',NULL,NULL,NULL,NULL,NULL,10151,1),(10252,NULL,'2016-05-01 13:41:02',NULL,'测试产品3简介',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,1,'<p>图文详情</p><p><img src=\"/cmsstatic/img/sauces/Sweet-Death-Sauce-Bottle.jpg\"><br></p>','测试产品3','100.00000','10.00000',NULL,NULL,NULL,NULL,NULL,10152,18);

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

insert  into `blc_sku_media_map`(`BLC_SKU_SKU_ID`,`MEDIA_ID`,`MAP_KEY`) values (10100,100200,'primary'),(10250,100350,'primary'),(10251,100352,'primary'),(10252,100353,'primary');

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

insert  into `coupon`(`coupon_id`,`coupon_type`,`coupon_value`,`coupon_amount`,`coupon_desc`,`updatedOn`,`createdOn`) values (1,0,5,7992,'购买满50元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(2,1,10,100,'购买满88元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(3,2,50,20,'购买满150元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(4,3,88,5,'购买满200元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(5,4,10,7,'购买满50元可用','2016-04-28 13:42:10','2016-04-28 13:42:10'),(6,5,10,9,'购买满50元可用','2016-04-28 13:42:10','2016-04-28 13:42:10');

/*Table structure for table `customaddressimpl` */

DROP TABLE IF EXISTS `customaddressimpl`;

CREATE TABLE `customaddressimpl` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `FKACEFD3E3C13085DD` (`ADDRESS_ID`),
  CONSTRAINT `FKACEFD3E3C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customaddressimpl` */

insert  into `customaddressimpl`(`ADDRESS_ID`) values (2051),(2052),(2053),(2101),(2102),(2103),(2151);

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Data for the table `customer_coupon_xref` */

/*Table structure for table `customer_extend` */

DROP TABLE IF EXISTS `customer_extend`;

CREATE TABLE `customer_extend` (
  `customer_id` bigint(20) unsigned NOT NULL,
  `test` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_extend` */

insert  into `customer_extend`(`customer_id`,`test`) values (5000,NULL),(5101,NULL),(5102,NULL),(5200,NULL),(5300,NULL),(5400,NULL),(5500,NULL),(5600,NULL),(5700,NULL),(5800,NULL),(5900,NULL),(6000,NULL),(6001,NULL),(6002,NULL),(6003,NULL),(6004,NULL),(6005,NULL),(6006,NULL),(6100,NULL),(6200,NULL),(6300,NULL),(6401,NULL),(6400,NULL),(6500,NULL),(6501,NULL),(6600,NULL),(6700,NULL),(6800,NULL),(6900,NULL),(7000,NULL),(7100,NULL),(7101,NULL),(7200,NULL),(7300,NULL),(7400,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

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

insert  into `fivecard`(`card_id`,`card_name`,`card_no`,`card_desc`,`card_type`,`card_status`) values (1,'自主五折卡','7400050089376','A卡',0,1),(2,'自主五折卡','7400050098903','A卡',0,1),(3,'自主五折卡','7400050098903','A卡',0,1),(4,'自主五折卡','7400050147472','A卡',0,1),(5,'自主五折卡','7400050155545','A卡',0,0),(6,'自主五折卡','7400050163489','A卡',0,0),(7,'自主五折卡','7400050169566','A卡',0,0),(8,'自主五折卡','7400050201716','A卡',0,0),(9,'自主五折卡','7400050208104','A卡',0,0),(10,'自主五折卡','7400050238521','A卡',0,0),(11,'自主五折卡','7400050239894','A卡',0,0),(12,'自主五折卡','7400050267934','A卡',0,0),(13,'自主五折卡','7400050287161','A卡',0,0),(14,'自主五折卡','7400050337545','A卡',0,0),(15,'自主五折卡','7400050467969','A卡',0,0),(16,'自主五折卡','7400050470938','A卡',0,0),(17,'自主五折卡','7400050474134','A卡',0,0),(18,'自主五折卡','7400050526079','A卡',0,0),(19,'自主五折卡','7400050530007','A卡',0,0),(20,'自主五折卡','7400050556618','A卡',0,0),(21,'自主五折卡','7400050593262','A卡',0,0),(22,'自主五折卡','7400050598373','A卡',0,0),(23,'自主五折卡','7400050609697','A卡',0,0),(24,'自主五折卡','7400050644513','A卡',0,0),(25,'自主五折卡','7400050653935','A卡',0,0),(26,'自主五折卡','7400050654567','A卡',0,0),(27,'自主五折卡','7400050711000','A卡',0,0),(28,'自主五折卡','7400050751259','A卡',0,0),(29,'自主五折卡','7400050774463','A卡',0,0),(30,'自主五折卡','7400050874163','A卡',0,0),(31,'自主五折卡','7400050882304','A卡',0,0),(32,'自主五折卡','7400050901111','A卡',0,0),(33,'自主五折卡','7400050902217','A卡',0,0),(34,'自主五折卡','7400050932672','A卡',0,0),(35,'自主五折卡','7400050940967','A卡',0,0),(36,'自主五折卡','7400050959433','A卡',0,0),(37,'自主五折卡','7400050971428','A卡',0,0),(38,'自主五折卡','7400050982875','A卡',0,0),(39,'自主五折卡','7400051021993','A卡',0,0),(40,'自主五折卡','7400051034917','A卡',0,0),(41,'自主五折卡','7400051038564','A卡',0,0),(42,'自主五折卡','7400051049782','A卡',0,0),(43,'自主五折卡','7400051069704','A卡',0,0),(44,'自主五折卡','7400051072124','A卡',0,0),(45,'自主五折卡','7400051180294','A卡',0,0),(46,'自主五折卡','7400051219734','A卡',0,0),(47,'自主五折卡','7400052401251','A卡',0,0),(48,'自主五折卡','7400052443510','A卡',0,0),(49,'自主五折卡','7400052453465','A卡',0,0),(50,'自主五折卡','7400052516412','A卡',0,0),(51,'自主五折卡','7400052518065','A卡',0,0),(52,'分享五折卡','7400052534911','B卡',1,1),(53,'分享五折卡','7400052560637','B卡',1,1),(54,'分享五折卡','7400052563409','B卡',1,1),(55,'分享五折卡','7400052563560','B卡',1,0),(56,'分享五折卡','7400052639654','B卡',1,0),(57,'分享五折卡','7400052645662','B卡',1,0),(58,'分享五折卡','7400052648724','B卡',1,0),(59,'分享五折卡','7400052649875','B卡',1,0),(60,'分享五折卡','7400052681493','B卡',1,0),(61,'分享五折卡','7400052686030','B卡',1,0),(62,'分享五折卡','7400052712357','B卡',1,0),(63,'分享五折卡','7400052729652','B卡',1,0),(64,'分享五折卡','7400052752025','B卡',1,0),(65,'分享五折卡','7400052756894','B卡',1,0),(66,'分享五折卡','7400052787775','B卡',1,0),(67,'分享五折卡','7400052790355','B卡',1,0),(68,'分享五折卡','7400052807428','B卡',1,0),(69,'分享五折卡','7400052818875','B卡',1,0),(70,'分享五折卡','7400052840401','B卡',1,0),(71,'分享五折卡','7400052863356','B卡',1,0),(72,'分享五折卡','7400052880926','B卡',1,0),(73,'分享五折卡','7400052889318','B卡',1,0),(74,'分享五折卡','7400052920806','B卡',1,0),(75,'分享五折卡','7400052973062','B卡',1,0),(76,'分享五折卡','7400053046307','B卡',1,0),(77,'分享五折卡','7400053058713','B卡',1,0),(78,'分享五折卡','7400053065872','B卡',1,0),(79,'分享五折卡','7400053088741','B卡',1,0),(80,'分享五折卡','7400053089540','B卡',1,0),(81,'分享五折卡','7400053097248','B卡',1,0),(82,'分享五折卡','7400053116451','B卡',1,0),(83,'分享五折卡','7400053119391','B卡',1,0),(84,'分享五折卡','7400053163769','B卡',1,0),(85,'分享五折卡','7400053167286','B卡',1,0),(86,'分享五折卡','7400053172723','B卡',1,0),(87,'分享五折卡','7400053238979','B卡',1,0),(88,'分享五折卡','7400053283443','B卡',1,0),(89,'分享五折卡','7400053292803','B卡',1,0),(90,'分享五折卡','7400053311924','B卡',1,0),(91,'分享五折卡','7400053326973','B卡',1,0),(92,'分享五折卡','7400053343291','B卡',1,0),(93,'分享五折卡','7400053370051','B卡',1,0),(94,'分享五折卡','7400053377043','B卡',1,0),(95,'分享五折卡','7400053408020','B卡',1,0),(96,'分享五折卡','7400053408914','B卡',1,0),(97,'分享五折卡','7400053416247','B卡',1,0),(98,'分享五折卡','7400053422507','B卡',1,0),(99,'分享五折卡','7400054604223','B卡',1,0),(100,'分享五折卡','7400054605220','B卡',1,0),(101,'分享五折卡','7400054625723','B卡',1,0),(102,'分享五折卡','7400054654891','B卡',1,0),(103,'分享五折卡','7400054661691','B卡',1,0),(104,'分享五折卡','7400054682214','B卡',1,0),(105,'分享五折卡','7400054689435','B卡',1,0),(106,'分享五折卡','7400054693678','B卡',1,0),(107,'分享五折卡','7400054693876','B卡',1,0),(108,'分享五折卡','7400054716971','B卡',1,0),(109,'分享五折卡','7400054778108','B卡',1,0),(110,'分享五折卡','7400054828377','B卡',1,0),(111,'分享五折卡','7400054836853','B卡',1,0),(112,'分享五折卡','7400054856783','B卡',1,0),(113,'分享五折卡','7400054859357','B卡',1,0),(114,'分享五折卡','7400054868014','B卡',1,0),(115,'分享五折卡','7400054944893','B卡',1,0),(116,'分享五折卡','7400054966949','B卡',1,0),(117,'分享五折卡','7400054969667','B卡',1,0),(118,'分享五折卡','7400054995840','B卡',1,0),(119,'分享五折卡','7400055024037','B卡',1,0),(120,'分享五折卡','7400055081740','B卡',1,0),(121,'分享五折卡','7400055105088','B卡',1,0),(122,'分享五折卡','7400055155366','B卡',1,0),(123,'分享五折卡','7400055170482','B卡',1,0),(124,'分享五折卡','7400055215824','B卡',1,0),(125,'分享五折卡','7400055294768','B卡',1,0),(126,'分享五折卡','7400055305372','B卡',1,0),(127,'分享五折卡','7400055324892','B卡',1,0),(128,'分享五折卡','7400055329620','B卡',1,0),(129,'分享五折卡','7400055387439','B卡',1,0),(130,'分享五折卡','7400055397377','B卡',1,0),(131,'分享五折卡','7400055424820','B卡',1,0),(132,'分享五折卡','7400055439046','B卡',1,0),(133,'分享五折卡','7400055467391','B卡',1,0),(134,'分享五折卡','7400055469173','B卡',1,0),(135,'分享五折卡','7400055474047','B卡',1,0),(136,'分享五折卡','7400055497039','B卡',1,0),(137,'分享五折卡','7400055518437','B卡',1,0),(138,'分享五折卡','7400055533690','B卡',1,0),(139,'分享五折卡','7400055542647','B卡',1,0),(140,'分享五折卡','7400055545433','B卡',1,0),(141,'分享五折卡','7400055556538','B卡',1,0),(142,'分享五折卡','7400055613682','B卡',1,0),(143,'分享五折卡','7400055615532','B卡',1,0),(144,'分享五折卡','7400055620178','B卡',1,0),(145,'分享五折卡','7400055627351','B卡',1,0),(146,'分享五折卡','7400055665131','B卡',1,0),(147,'分享五折卡','7400053512444','B卡',1,0),(148,'分享五折卡','7400053563552','B卡',1,0),(149,'分享五折卡','7400053565013','B卡',1,0),(150,'分享五折卡','7400053621795','B卡',1,0),(151,'分享五折卡','7400053633347','B卡',1,0),(152,'分享五折卡','7400053643643','B卡',1,0),(153,'分享五折卡','7400053644725','B卡',1,0),(154,'分享五折卡','7400053668042','B卡',1,0),(155,'分享五折卡','7400053674876','B卡',1,0),(156,'分享五折卡','7400053698995','B卡',1,0),(157,'分享五折卡','7400053739469','B卡',1,0),(158,'分享五折卡','7400053754189','B卡',1,0),(159,'分享五折卡','7400053759573','B卡',1,0),(160,'分享五折卡','7400053760326','B卡',1,0),(161,'分享五折卡','7400053814050','B卡',1,0),(162,'分享五折卡','7400053872609','B卡',1,0),(163,'分享五折卡','7400053908056','B卡',1,0),(164,'分享五折卡','7400053915900','B卡',1,0),(165,'分享五折卡','7400053989635','B卡',1,0),(166,'分享五折卡','7400053992338','B卡',1,0),(167,'分享五折卡','7400053997050','B卡',1,0),(168,'分享五折卡','7400054060463','B卡',1,0),(169,'分享五折卡','7400054061118','B卡',1,0),(170,'分享五折卡','7400054098381','B卡',1,0),(171,'分享五折卡','7400054161146','B卡',1,0),(172,'分享五折卡','7400054189560','B卡',1,0),(173,'分享五折卡','7400054190894','B卡',1,0),(174,'分享五折卡','7400054192522','B卡',1,0),(175,'分享五折卡','7400054211599','B卡',1,0),(176,'分享五折卡','7400054262881','B卡',1,0),(177,'分享五折卡','7400054288591','B卡',1,0),(178,'分享五折卡','7400054298385','B卡',1,0),(179,'分享五折卡','7400054311909','B卡',1,0),(180,'分享五折卡','7400054312319','B卡',1,0),(181,'分享五折卡','7400054315648','B卡',1,0),(182,'分享五折卡','7400054345324','B卡',1,0),(183,'分享五折卡','7400054367807','B卡',1,0),(184,'分享五折卡','7400054377950','B卡',1,0),(185,'分享五折卡','7400054409934','B卡',1,0),(186,'分享五折卡','7400054414563','B卡',1,0),(187,'分享五折卡','7400054416291','B卡',1,0),(188,'分享五折卡','7400054462144','B卡',1,0),(189,'分享五折卡','7400054472556','B卡',1,0),(190,'分享五折卡','7400054511071','B卡',1,0),(191,'分享五折卡','7400054557567','B卡',1,0),(192,'分享五折卡','7400054585119','B卡',1,0),(193,'分享五折卡','7400054585287','B卡',1,0),(194,'分享五折卡','7400051236731','B卡',1,0),(195,'分享五折卡','7400051236748','B卡',1,0),(196,'分享五折卡','7400051252069','B卡',1,0),(197,'分享五折卡','7400051267179','B卡',1,0),(198,'分享五折卡','7400051278670','B卡',1,0),(199,'分享五折卡','7400051279349','B卡',1,0),(200,'分享五折卡','7400051311971','B卡',1,0),(201,'分享五折卡','7400051313913','B卡',1,0),(202,'分享五折卡','7400051336127','B卡',1,0),(203,'分享五折卡','7400051360023','B卡',1,0),(204,'分享五折卡','7400051374273','B卡',1,0),(205,'分享五折卡','7400051377786','B卡',1,0),(206,'分享五折卡','7400051379025','B卡',1,0),(207,'分享五折卡','7400051427207','B卡',1,0),(208,'分享五折卡','7400051434731','B卡',1,0),(209,'分享五折卡','7400051448639','B卡',1,0),(210,'分享五折卡','7400051508081','B卡',1,0),(211,'分享五折卡','7400051527723','B卡',1,0),(212,'分享五折卡','7400051552510','B卡',1,0),(213,'分享五折卡','7400051602338','B卡',1,0),(214,'分享五折卡','7400051604332','B卡',1,0),(215,'分享五折卡','7400051632663','B卡',1,0),(216,'分享五折卡','7400051682828','B卡',1,0),(217,'分享五折卡','7400051695255','B卡',1,0),(218,'分享五折卡','7400051711214','B卡',1,0),(219,'分享五折卡','7400051714468','B卡',1,0),(220,'分享五折卡','7400051731830','B卡',1,0),(221,'分享五折卡','7400051833060','B卡',1,0),(222,'分享五折卡','7400051866914','B卡',1,0),(223,'分享五折卡','7400051893552','B卡',1,0),(224,'分享五折卡','7400051917173','B卡',1,0),(225,'分享五折卡','7400051917487','B卡',1,0),(226,'分享五折卡','7400051935948','B卡',1,0),(227,'分享五折卡','7400051956202','B卡',1,0),(228,'分享五折卡','7400051968847','B卡',1,0),(229,'分享五折卡','7400051995737','B卡',1,0),(230,'分享五折卡','7400052058387','B卡',1,0),(231,'分享五折卡','7400052067730','B卡',1,0),(232,'分享五折卡','7400052121241','B卡',1,0),(233,'分享五折卡','7400052121531','B卡',1,0),(234,'分享五折卡','7400052164101','B卡',1,0),(235,'分享五折卡','7400052168567','B卡',1,0),(236,'分享五折卡','7400052172724','B卡',1,0),(237,'分享五折卡','7400052183225','B卡',1,0),(238,'分享五折卡','7400052184550','B卡',1,0),(239,'分享五折卡','7400052245190','B卡',1,0),(240,'分享五折卡','7400052251023','B卡',1,0),(241,'分享五折卡','7400052256899','B卡',1,0),(242,'分享五折卡','7400052257810','B卡',1,0),(243,'分享五折卡','7400052265426','B卡',1,0),(244,'分享五折卡','7400052270123','B卡',1,0),(245,'分享五折卡','7400052282843','B卡',1,0),(246,'分享五折卡','7400052332944','B卡',1,0),(247,'分享五折卡','7400052346507','B卡',1,0),(248,'分享五折卡','7400052348860','B卡',1,0),(249,'分享五折卡','7400052357749','B卡',1,0),(250,'分享五折卡','7400052358326','B卡',1,0),(251,'分享五折卡','7400056868197','B卡',1,0),(252,'分享五折卡','7400056871074','B卡',1,0),(253,'分享五折卡','7400056920796','B卡',1,0),(254,'分享五折卡','7400056922554','B卡',1,0),(255,'分享五折卡','7400056933192','B卡',1,0),(256,'分享五折卡','7400056938821','B卡',1,0),(257,'分享五折卡','7400056966077','B卡',1,0),(258,'分享五折卡','7400056977288','B卡',1,0),(259,'分享五折卡','7400057028651','B卡',1,0),(260,'分享五折卡','7400057068312','B卡',1,0),(261,'分享五折卡','7400057081953','B卡',1,0),(262,'分享五折卡','7400057088679','B卡',1,0),(263,'分享五折卡','7400057094786','B卡',1,0),(264,'分享五折卡','7400057095516','B卡',1,0),(265,'分享五折卡','7400057106328','B卡',1,0),(266,'分享五折卡','7400057123349','B卡',1,0),(267,'分享五折卡','7400057141084','B卡',1,0),(268,'分享五折卡','7400057142777','B卡',1,0),(269,'分享五折卡','7400057174341','B卡',1,0),(270,'分享五折卡','7400057185286','B卡',1,0),(271,'分享五折卡','7400057194271','B卡',1,0),(272,'分享五折卡','7400057202198','B卡',1,0),(273,'分享五折卡','7400057216751','B卡',1,0),(274,'分享五折卡','7400057274171','B卡',1,0),(275,'分享五折卡','7400057289496','B卡',1,0),(276,'分享五折卡','7400057291222','B卡',1,0),(277,'分享五折卡','7400057325750','B卡',1,0),(278,'分享五折卡','7400057369259','B卡',1,0),(279,'分享五折卡','7400057389820','B卡',1,0),(280,'分享五折卡','7400057416977','B卡',1,0),(281,'分享五折卡','7400057428802','B卡',1,0),(282,'分享五折卡','7400057438382','B卡',1,0),(283,'分享五折卡','7400057507248','B卡',1,0),(284,'分享五折卡','7400057534077','B卡',1,0),(285,'分享五折卡','7400057534688','B卡',1,0),(286,'分享五折卡','7400057548197','B卡',1,0),(287,'分享五折卡','7400057549088','B卡',1,0),(288,'分享五折卡','7400057565903','B卡',1,0),(289,'分享五折卡','7400057594675','B卡',1,0),(290,'分享五折卡','7400057617442','B卡',1,0),(291,'分享五折卡','7400057624631','B卡',1,0),(292,'分享五折卡','7400057641362','B卡',1,0),(293,'分享五折卡','7400057643618','B卡',1,0),(294,'分享五折卡','7400057651446','B卡',1,0),(295,'分享五折卡','7400057666051','B卡',1,0),(296,'分享五折卡','7400057684215','B卡',1,0),(297,'分享五折卡','7400057688374','B卡',1,0),(298,'分享五折卡','7400057715957','B卡',1,0),(299,'分享五折卡','7400057741574','B卡',1,0),(300,'分享五折卡','7400057755557','B卡',1,0),(301,'分享五折卡','7400057762845','B卡',1,0),(302,'分享五折卡','7400057799957','B卡',1,0),(303,'分享五折卡','7400057835303','B卡',1,0),(304,'分享五折卡','7400057865652','B卡',1,0),(305,'分享五折卡','7400057912004','B卡',1,0),(306,'分享五折卡','7400057934815','B卡',1,0),(307,'分享五折卡','7400057939407','B卡',1,0),(308,'分享五折卡','7400057986333','B卡',1,0),(309,'分享五折卡','7400057990361','B卡',1,0),(310,'分享五折卡','7400058041550','B卡',1,0),(311,'分享五折卡','7400058052631','B卡',1,0),(312,'分享五折卡','7400058068205','B卡',1,0),(313,'分享五折卡','7400058071694','B卡',1,0),(314,'分享五折卡','7400058078853','B卡',1,0),(315,'分享五折卡','7400058080221','B卡',1,0),(316,'分享五折卡','7400058094501','B卡',1,0),(317,'分享五折卡','7400058095447','B卡',1,0),(318,'分享五折卡','7400058129029','B卡',1,0),(319,'分享五折卡','7400058132074','B卡',1,0);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (76);

/*Table structure for table `order_extend` */

DROP TABLE IF EXISTS `order_extend`;

CREATE TABLE `order_extend` (
  `ORDER_EXTEND_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_EXTEND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `order_extend` */

insert  into `order_extend`(`ORDER_EXTEND_ID`,`ORDER_ID`,`ADDRESS_ID`) values (15,2651,2052),(16,2652,2053),(17,2701,2101),(18,2702,2102),(19,2703,2103),(20,2751,2151);

/*Table structure for table `product_extend` */

DROP TABLE IF EXISTS `product_extend`;

CREATE TABLE `product_extend` (
  `PRODUCT_EXTEND_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(200) DEFAULT NULL,
  `SALES` bigint(20) DEFAULT '0' COMMENT '销售量',
  `sale_limit` bigint(20) DEFAULT '1' COMMENT '限购数量',
  PRIMARY KEY (`PRODUCT_EXTEND_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `product_extend_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `product_extend` */

insert  into `product_extend`(`PRODUCT_EXTEND_ID`,`PRODUCT_ID`,`PROMOTION_MESSAGE`,`SALES`,`sale_limit`) values (5,10150,'快来买哦！买买买',10,1),(6,10151,'测试产品2促销信息',8,NULL),(7,10152,'测试产品3促销信息',0,NULL);

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

insert  into `qrcode`(`id`,`code`,`usedate`,`status`,`usedby`) values (1,'1234567891245',NULL,0,NULL),(2,'7400045945206',NULL,1,NULL),(3,'7195007950571',NULL,0,NULL),(4,'7196007950585',NULL,0,NULL),(5,'7197007950599',NULL,0,NULL),(6,'7198007950602',NULL,0,NULL),(7,'7199007950616',NULL,0,NULL),(8,'7199007950623',NULL,0,NULL),(9,'7190007950637',NULL,0,NULL),(10,'7191007950641',NULL,0,NULL),(11,'7192007950655',NULL,0,NULL),(12,'7193007950669',NULL,0,NULL),(13,'7194007950673',NULL,0,NULL),(14,'7194007950680',NULL,0,NULL),(15,'7195007950694',NULL,0,NULL),(16,'7196007950707',NULL,0,NULL),(17,'7197007950711',NULL,0,NULL),(18,'7198007950725',NULL,0,NULL),(19,'7198007950732',NULL,0,NULL),(20,'7199007950746',NULL,0,NULL),(21,'7190007950750',NULL,0,NULL),(22,'7191007950764',NULL,0,NULL),(23,'7192007950778',NULL,0,NULL),(24,'7194007950789',NULL,0,NULL),(25,'7194007950796',NULL,0,NULL),(26,'7195007950809',NULL,0,NULL),(27,'7196007950813',NULL,0,NULL),(28,'7197007950827',NULL,0,NULL),(29,'7198007950831',NULL,0,NULL),(30,'7199007950845',NULL,0,NULL),(31,'7199007950852',NULL,0,NULL),(32,'7190007950866',NULL,0,NULL),(33,'7191007950870',NULL,0,NULL),(34,'7192007950884',NULL,0,NULL),(35,'7193007950898',NULL,0,NULL),(36,'7193007950904',NULL,0,NULL),(37,'7194007950918',NULL,0,NULL),(38,'7195007950922',NULL,0,NULL),(39,'7196007950936',NULL,0,NULL),(40,'7196007950943',NULL,0,NULL),(41,'7197007950957',NULL,0,NULL),(42,'7198007950961',NULL,0,NULL),(43,'7199007950975',NULL,0,NULL),(44,'7199007950982',NULL,0,NULL),(45,'7190007950996',NULL,0,NULL),(46,'7191007951006',NULL,0,NULL),(47,'7193007951017',NULL,0,NULL),(48,'7194007951021',NULL,0,NULL),(49,'7195007951035',NULL,0,NULL),(50,'7196007951049',NULL,0,NULL),(51,'7197007951053',NULL,0,NULL),(52,'7197007951060',NULL,0,NULL),(53,'7198007951074',NULL,0,NULL),(54,'7199007951088',NULL,0,NULL),(55,'7190007951092',NULL,0,NULL),(56,'7191007951105',NULL,0,NULL),(57,'7191007951112',NULL,0,NULL),(58,'7192007951126',NULL,0,NULL),(59,'7193007951130',NULL,0,NULL),(60,'7194007951144',NULL,0,NULL),(61,'7195007951158',NULL,0,NULL),(62,'7196007951162',NULL,0,NULL),(63,'7196007951179',NULL,0,NULL),(64,'7197007951183',NULL,0,NULL),(65,'7198007951197',NULL,0,NULL),(66,'7199007951200',NULL,0,NULL),(67,'7190007951214',NULL,0,NULL),(68,'7190007951221',NULL,0,NULL),(69,'7191007951235',NULL,0,NULL),(70,'7193007951246',NULL,0,NULL),(71,'7194007951250',NULL,0,NULL),(72,'7195007951264',NULL,0,NULL),(73,'7196007951278',NULL,0,NULL),(74,'7197007951282',NULL,0,NULL),(75,'7197007951299',NULL,0,NULL),(76,'7198007951302',NULL,0,NULL),(77,'7199007951316',NULL,0,NULL),(78,'7190007951320',NULL,0,NULL),(79,'7191007951334',NULL,0,NULL),(80,'7191007951341',NULL,0,NULL),(81,'7192007951355',NULL,0,NULL),(82,'7193007951369',NULL,0,NULL),(83,'7194007951373',NULL,0,NULL),(84,'7195007951387',NULL,0,NULL),(85,'7195007951394',NULL,0,NULL),(86,'7196007951407',NULL,0,NULL),(87,'7197007951411',NULL,0,NULL),(88,'7198007951425',NULL,0,NULL),(89,'7199007951439',NULL,0,NULL),(90,'7190007951443',NULL,0,NULL),(91,'7191007951457',NULL,0,NULL),(92,'7191007951464',NULL,0,NULL),(93,'7193007951475',NULL,0,NULL),(94,'7194007951489',NULL,0,NULL),(95,'7195007951493',NULL,0,NULL),(96,'7196007951506',NULL,0,NULL),(97,'7197007951510',NULL,0,NULL),(98,'7197007951527',NULL,0,NULL),(99,'7198007951531',NULL,0,NULL),(100,'7199007951545',NULL,0,NULL),(101,'7190007951559',NULL,0,NULL),(102,'7191007951563',NULL,0,NULL);

/*Table structure for table `sequence_generator` */

DROP TABLE IF EXISTS `sequence_generator`;

CREATE TABLE `sequence_generator` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sequence_generator` */

insert  into `sequence_generator`(`ID_NAME`,`ID_VAL`) values ('AddressImpl',2251),('AdminRoleImpl',101),('AdminUserImpl',101),('CategoryExcludedSearchFacetImpl',1000),('CategoryImpl',10100),('CategoryProductImpl',1000),('CategoryProductXrefImpl',1450),('CategorySearchFacetImpl',1050),('CategoryXrefImpl',1100),('ChallengeQuestionImpl',1000),('CrossSaleProductImpl',101),('CustomerAddressImpl',1651),('CustomerAttributeImpl',1801),('CustomerRoleImpl',1901),('EmailTrackingImpl',2051),('FeaturedProductImpl',1050),('FieldDefinitionImpl',1000),('FieldEnumerationImpl',1000),('FieldEnumerationItemImpl',1000),('FieldGroupImpl',1000),('FieldImpl',1000),('FulfillmentGroupImpl',2701),('FulfillmentGroupItemImpl',2851),('FulfillmentOptionImpl',1000),('MediaImpl',100450),('OfferCodeImpl',1050),('OfferImpl',1000),('OfferItemCriteriaImpl',1000),('OrderAttributeImpl',251),('OrderImpl',2851),('OrderItemAttributeImpl',301),('OrderItemImpl',2851),('OrderItemPriceDetailImpl',2851),('OrderPaymentImpl',251),('PageFieldImpl',1000),('PageImpl',1000),('PageTemplateImpl',1000),('PaymentTransactionImpl',251),('PersonalMessageImpl',151),('PhoneImpl',1951),('ProductAttributeImpl',1200),('ProductImpl',10250),('ProductOptionImpl',1050),('ProductOptionValueImpl',1050),('ProductOptionXrefImpl',1150),('RoleImpl',1000),('SandBoxImpl',151),('SandBoxManagementImpl',151),('SearchFacetImpl',1000),('SearchFacetRangeImpl',1000),('SearchInterceptImpl',1000),('SkuAttributeImpl',101),('SkuImpl',10350),('StaticAssetImpl',100100),('StructuredContentFieldImpl',1000),('StructuredContentImpl',1000),('StructuredContentRuleImpl',1000),('StructuredContentTypeImpl',1000),('SystemPropertyImpl',101),('UpSaleProductImpl',101),('URLHandlerImpl',1000);

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

insert  into `shop_account`(`id`,`appid`,`name`,`mchid`,`key`,`appsecret`,`shop_code`) values (99,'wx937fba8914a5d9a9','三元里','10010514','xVVm9pGXwwJpAQWkhJDszfi46wtBX1EQ\r\n','1974155fda854243a2a4b08c2928bf92','014'),(100,'wx937fba8914a5d9a9','天河','1281605801','BC018B996C9107107DF1AC73E703C8DA','1974155fda854243a2a4b08c2928bf92','016'),(101,'wx937fba8914a5d9a9','花都','1324991401','CACB7A4C00A841E238D000C28A8F123E','1974155fda854243a2a4b08c2928bf92','080'),(102,'wx937fba8914a5d9a9','长兴','1283571001','115501F176015149AF6D22DA569C1E95','1974155fda854243a2a4b08c2928bf92','085'),(103,'wx937fba8914a5d9a9','黄石','1281924301','905A886EE8C28E4816BC804195B0249E','1974155fda854243a2a4b08c2928bf92','090'),(104,'wx937fba8914a5d9a9','金沙洲','1278795201','562d8ba6bf2bc562d8ba6bf337562d8b','1974155fda854243a2a4b08c2928bf92','096'),(105,'wx937fba8914a5d9a9','东凌店','1326016401','2AF7BB955D60964E3CD2C62BFDA1CA9E','1974155fda854243a2a4b08c2928bf92','108'),(106,'wx937fba8914a5d9a9','南海','1281623301','B15E5C5A17527604C1D536F3C08F8F1D','1974155fda854243a2a4b08c2928bf92','017'),(107,'wx937fba8914a5d9a9','江门','1281633801','26BE5777F714518C990B0B119A9325BE','1974155fda854243a2a4b08c2928bf92','031'),(108,'wx937fba8914a5d9a9','三水','1281765801','801D50291388A4AC8B699E4B43FB392F','1974155fda854243a2a4b08c2928bf92','051'),(109,'wx937fba8914a5d9a9','黄岐','1281804201','4E1BFA18A9970E2551AB96FC491A25C5','1974155fda854243a2a4b08c2928bf92','066'),(110,'wx937fba8914a5d9a9','顺德','1281829501','B2D4A5CC6781F49D5033E01DE7541A76','1974155fda854243a2a4b08c2928bf92','071'),(111,'wx937fba8914a5d9a9','乐从','1281933401','F2EA8D74E583B5986E74719BA2964316','1974155fda854243a2a4b08c2928bf92','097'),(112,'wx937fba8914a5d9a9','怡丰城','1282278301','8145A32DA48DB24FFDE9BAB17164E8DD','1974155fda854243a2a4b08c2928bf92','103'),(113,'wx937fba8914a5d9a9','中山小榄店','1324985201','11EBA122A77A7AD761B93D85BAA3935B','1974155fda854243a2a4b08c2928bf92','110'),(114,'wx937fba8914a5d9a9','汕头','1281597701','1FDD78A7B584F48B194CAEE2D035D6B3','1974155fda854243a2a4b08c2928bf92','015'),(115,'wx937fba8914a5d9a9','澄海','1281682701','E1A59CC6B350A27452B1B860217C2AE5','1974155fda854243a2a4b08c2928bf92','042'),(116,'wx937fba8914a5d9a9','揭阳','1281813501','B5B742BCBE7FD36B4A49F2C2C779D283','1974155fda854243a2a4b08c2928bf92','070'),(117,'wx937fba8914a5d9a9','潮州','1281842701','A534585E7E4B969A516B0F29B8281410','1974155fda854243a2a4b08c2928bf92','079'),(118,'wx937fba8914a5d9a9','榕城','1281864501','3185FEB3881B8C48290C463CB2ABA290','1974155fda854243a2a4b08c2928bf92','083'),(119,'wx937fba8914a5d9a9','金平','1281874701','F85D211FB0FE8CA8464EDC046C995D57','1974155fda854243a2a4b08c2928bf92','084'),(120,'wx937fba8914a5d9a9','潮安','1324996801','6CD64F448731B74A8E0045F8D29B936E','1974155fda854243a2a4b08c2928bf92','094'),(121,'wx937fba8914a5d9a9','普宁','1281936501','628D3ADD7794F2F04E23ADC992596887','1974155fda854243a2a4b08c2928bf92','098'),(122,'wx937fba8914a5d9a9','梅州','1282228201','D1D8DA2F48B95D43D5C852439CF089B6','1974155fda854243a2a4b08c2928bf92','101'),(123,'wx937fba8914a5d9a9','天山店','1282294601','BF544FA7E4F635FB27FB0770E838104F','1974155fda854243a2a4b08c2928bf92','104'),(124,'wx937fba8914a5d9a9','东厦店','1281939601','0BC936E9849A9B315074C187D739C537','1974155fda854243a2a4b08c2928bf92','106'),(125,'wx937fba8914a5d9a9','中信店','1282217901','864CF9E6E0EF325F3C7FC52A7F27A73A','1974155fda854243a2a4b08c2928bf92','107'),(126,'wx937fba8914a5d9a9','阳西','1282306901','DC802864B9A0EE826FABE6B2DBB42D35','1974155fda854243a2a4b08c2928bf92','105'),(127,'wx937fba8914a5d9a9','湛江','1282262401','7EBB6366189E4162758B80FE47049C0D','1974155fda854243a2a4b08c2928bf92','102'),(128,'wx937fba8914a5d9a9','廉江','1324982401','4EADF4E23EF8D79457AD8E1D18DFD9F8','1974155fda854243a2a4b08c2928bf92','109');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: likepizza
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SPRING_SESSION`
--

DROP TABLE IF EXISTS `SPRING_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SESSION_ID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION`
--

LOCK TABLES `SPRING_SESSION` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES ('327f8887-4d16-4a31-8344-6cd0f044ebd8','b9aae7c5-3746-4366-af56-adb36534ad2a',1616010737637,1616010737637,604800,1616615537637,'operator'),('559fb0f8-e6bb-426f-9005-d72143152092','21b53393-0b54-4731-9165-950d717f63a9',1616010554701,1616010621258,604800,1616615421258,'operator'),('5bfc3502-7f98-4086-8761-139fa5b93d79','86aab306-4405-4562-bc7a-c09a2c82d40a',1616085822515,1616085822515,604800,1616690622515,'operator'),('60321cb7-a6b4-4153-a04c-a66eb811f002','110651d9-c3e9-48ae-8260-5121d6a95c97',1616010724142,1616010724142,604800,1616615524142,'admin'),('904b733f-7c21-4484-9f10-2b64e40752a5','ff9d4e83-15fd-41c4-990c-d3542f163f8d',1616085962367,1616086456818,604800,1616691256818,'admin'),('cc711494-3d88-4c6e-91c4-e9ded1958b43','2b53f080-8348-456e-8c12-baa73ce5d47c',1616432534174,1616432534228,604800,1617037334228,'admin'),('d3131be6-5a3d-4eca-b07e-7baa73c8b9ae','8605957c-084b-4e37-9c02-6140803905a5',1615826581409,1616021474234,604800,1616626274234,'admin');
/*!40000 ALTER TABLE `SPRING_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `SPRING_SESSION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_PRIMARY_ID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION_ATTRIBUTES`
--

LOCK TABLES `SPRING_SESSION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION_ATTRIBUTES` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES ('327f8887-4d16-4a31-8344-6cd0f044ebd8','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0\rROLE_OPERATORpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0	ROLE_USERpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1ppsr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpsq\0~\0\0\0\0\0\0\0\0t\0<$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLesr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0&xp\0????\0\0\0q\0~\0\"q\0~\0t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xt\0operator'),('559fb0f8-e6bb-426f-9005-d72143152092','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0	ROLE_USERpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\rROLE_OPERATORpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1ppsr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpsq\0~\0\0\0\0\0\0\0\0t\0<$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLesr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0&xp\0????\0\0\0q\0~\0\"q\0~\0t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xt\0operator'),('5bfc3502-7f98-4086-8761-139fa5b93d79','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0	ROLE_USERpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\rROLE_OPERATORpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\0\r176.194.34.16ppsr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpsq\0~\0\0\0\0\0\0\0\0t\0<$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLesr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0&xp\0????\0\0\0q\0~\0\"q\0~\0t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xt\0operator'),('60321cb7-a6b4-4153-a04c-a66eb811f002','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0\nROLE_ADMINpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0	ROLE_USERpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\rROLE_OPERATORpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1ppsr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpq\0~\0t\0<$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLesr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0(xp\0????\0\0\0q\0~\0q\0~\0\"t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0\Zq\0~\0\Zxsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0q\0~\0\Zxt\0admin'),('904b733f-7c21-4484-9f10-2b64e40752a5','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0\rROLE_OPERATORpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0	ROLE_USERpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\nROLE_ADMINpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\0\r176.194.34.16t\0$f994393a-2111-41d8-b9fb-ddab40892d56psr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpq\0~\0t\0<$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLesr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0)xp\0????\0\0\0q\0~\0q\0~\0#t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0\Zq\0~\0\Zq\0~\0q\0~\0xsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0q\0~\0\Zxt\0admin'),('cc711494-3d88-4c6e-91c4-e9ded1958b43','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0	ROLE_USERpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\rROLE_OPERATORpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\nROLE_ADMINpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\094.19.189.44ppsr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpq\0~\0t\0<$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLesr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0(xp\0????\0\0\0q\0~\0q\0~\0\"t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0\Zq\0~\0\Zq\0~\0q\0~\0q\0~\0q\0~\0xsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0q\0~\0\Zxt\0admin'),('d3131be6-5a3d-4eca-b07e-7baa73c8b9ae','SPRING_SECURITY_CONTEXT','??0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList?%1??\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0???\0L\0cq\0~\0xpsr\0java.util.ArrayListx?????\0I\0sizexp\0\0\0w\0\0\0sr\0ru.exsoft.likepizza.entity.Role?5C2?<?\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;L\0userst\0Ljava/util/Set;xpsr\0java.lang.Long;???#?\0J\0valuexr\0java.lang.Number?????\0\0xp\0\0\0\0\0\0\0t\0	ROLE_USERpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\rROLE_OPERATORpsq\0~\0sq\0~\0\0\0\0\0\0\0\0t\0\nROLE_ADMINpxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\094.19.189.44t\0$76b3c391-4e9b-4d97-a2f2-956f0ea56002psr\0ru.exsoft.likepizza.entity.UserM?y???\0L\0enabledt\0Ljava/lang/Boolean;L\0idq\0~\0L\0passwordq\0~\0L\0rolesq\0~\0L\0usernameq\0~\0xpsr\0java.lang.Boolean?r?՜??\0Z\0valuexpq\0~\0t\0<$2a$31$.VymeAzOq21QYC76c/FuauyCnNpvR6WXI5wfpCf.VUfuuKW/oKzpSsr\0/org.hibernate.collection.internal.PersistentSet?G???}\0L\0setq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionW?]??sT\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0)xp\0????\0\0\0q\0~\0q\0~\0#t\0%ru.exsoft.likepizza.entity.User.rolespsr\0java.util.HashMap??`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0\Zq\0~\0\Zxsr\0java.util.HashSet?D?????4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0q\0~\0\Zxt\0admin');
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_awards`
--

DROP TABLE IF EXISTS `t_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_awards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `award_id_idx` (`id`),
  KEY `award_phone_idx` (`phone`),
  KEY `FKh3exfyq8322macbvllvwlvfky` (`prize_id`),
  KEY `award_created_idx` (`created`),
  CONSTRAINT `FKh3exfyq8322macbvllvwlvfky` FOREIGN KEY (`prize_id`) REFERENCES `t_prizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_awards`
--

LOCK TABLES `t_awards` WRITE;
/*!40000 ALTER TABLE `t_awards` DISABLE KEYS */;
INSERT INTO `t_awards` (`id`, `created`, `phone`, `prize_id`, `status`) VALUES (1,'2021-03-14 14:20:46.079000','+79043402122',15,2),(2,'2021-03-14 14:52:10.728000','+79043402122',1,3),(3,'2021-03-14 14:53:49.466000','+79043402122',15,1),(4,'2021-03-14 14:54:05.653000','+79043402122',10,2),(5,'2021-03-14 14:54:43.859000','+79043402122',3,2),(6,'2021-03-14 14:56:21.858000','+79043402122',17,3),(7,'2021-03-14 14:56:30.027000','+79043402122',14,2),(8,'2021-03-14 14:59:35.981000','+79043402122',8,2),(9,'2021-03-14 15:00:37.163000','+79043402122',3,2),(10,'2021-03-14 15:01:13.971000','+79043402122',12,2),(11,'2021-03-14 15:01:58.382000','+79043402122',4,2),(12,'2021-03-14 15:02:27.387000','+79043402122',17,3),(13,'2021-03-14 15:02:32.914000','+79043402122',1,3),(14,'2021-03-14 15:12:00.102000','+79043402122',5,2),(15,'2021-03-14 15:14:07.393000','+79043402122',1,3),(16,'2021-03-14 15:14:11.997000','+79043402122',15,1),(17,'2021-03-14 15:18:48.537000','+79043402122',4,2),(18,'2021-03-14 15:18:54.500000','+79043402122',17,3),(19,'2021-03-14 15:19:34.522000','+79043402122',16,2),(20,'2021-03-14 15:19:48.368000','+79043402122',7,2),(21,'2021-03-14 15:20:00.826000','+79043402122',4,0),(22,'2021-03-14 15:21:40.699000','+79043402122',15,1),(23,'2021-03-14 15:22:15.284000','+79043402122',16,0),(24,'2021-03-14 15:22:53.483000','+79043402122',10,0),(25,'2021-03-14 15:23:49.984000','+79043402122',1,3),(26,'2021-03-14 15:24:36.298000','+79043402122',15,1),(27,'2021-03-14 16:50:23.747000','+79043402122',1,3),(28,'2021-03-14 16:51:30.350000','+79043402122',6,2),(29,'2021-03-14 16:51:48.189000','+79043402122',13,0),(30,'2021-03-14 17:42:40.907000','+79043402122',4,0),(31,'2021-03-14 17:58:13.549000','+79043402122',6,0),(32,'2021-03-14 17:58:32.428000','+79043402122',13,0),(33,'2021-03-14 17:58:46.983000','+79043402122',4,0),(34,'2021-03-14 17:59:10.172000','+79043402122',1,3),(35,'2021-03-14 17:59:24.697000','+79043402122',9,2),(36,'2021-03-14 18:00:28.075000','+79043402122',1,3),(37,'2021-03-14 18:00:46.598000','+79043402122',4,0),(38,'2021-03-14 18:01:09.240000','+79043402122',3,0),(39,'2021-03-14 18:07:14.424000','+79043402122',5,0),(40,'2021-03-14 18:07:34.842000','+79043402122',7,0),(41,'2021-03-14 18:07:41.036000','+79043402122',6,0),(42,'2021-03-14 18:08:02.291000','+79043402122',5,0),(43,'2021-03-14 18:08:09.384000','+79043402122',8,0),(44,'2021-03-14 18:08:35.898000','+79043402122',6,0),(45,'2021-03-14 18:08:41.703000','+79043402122',1,3),(46,'2021-03-14 18:16:07.312000','+79043402122',9,0),(47,'2021-03-14 18:17:16.554000','+79043402122',12,0),(48,'2021-03-14 18:19:31.788000','+79043402122',3,0),(49,'2021-03-14 18:20:01.021000','+79043402122',5,0),(50,'2021-03-14 18:22:15.773000','+79043402122',5,0),(51,'2021-03-14 18:22:19.543000','+79043402122',6,0),(52,'2021-03-14 18:23:26.715000','+79043402122',6,0),(53,'2021-03-14 18:23:32.033000','+79043402122',4,0),(54,'2021-03-14 18:23:35.963000','+79043402122',7,0),(55,'2021-03-14 18:24:19.461000','+79043402122',5,0),(56,'2021-03-14 18:24:21.691000','+79043402122',14,0),(57,'2021-03-14 18:24:23.937000','+79043402122',12,0),(58,'2021-03-14 18:24:59.116000','+79043402122',15,1),(59,'2021-03-14 18:25:11.135000','+79043402122',9,0),(60,'2021-03-14 18:26:08.352000','+79043402122',9,2),(61,'2021-03-14 18:26:11.357000','+79043402122',5,2),(62,'2021-03-14 18:26:56.464000','+79043402122',5,0),(63,'2021-03-14 18:27:10.627000','+79043402122',5,0),(64,'2021-03-14 18:27:13.533000','+79043402122',5,0),(65,'2021-03-14 18:28:11.828000','+79043402122',5,0),(66,'2021-03-14 18:28:19.344000','+79043402122',17,3),(67,'2021-03-14 18:28:23.993000','+79043402122',1,3),(68,'2021-03-14 18:28:29.365000','+79043402122',10,0),(69,'2021-03-14 18:28:49.598000','+79043402122',1,3),(70,'2021-03-14 18:28:52.424000','+79043402122',15,1),(71,'2021-03-14 18:29:20.111000','+79043402122',15,1),(72,'2021-03-14 18:29:26.441000','+79043402122',6,0),(73,'2021-03-14 18:31:39.052000','+79043402122',14,0),(74,'2021-03-14 18:31:41.642000','+79043402122',5,0),(75,'2021-03-14 18:31:58.117000','+79043402122',5,0),(76,'2021-03-14 18:32:02.173000','+79043402122',9,0),(77,'2021-03-14 18:32:12.459000','+79043402122',13,0),(78,'2021-03-14 18:32:57.673000','+79043402122',16,0),(79,'2021-03-14 18:33:07.510000','+79043402122',7,0),(80,'2021-03-14 18:35:10.153000','+79043402122',1,3),(81,'2021-03-14 18:35:23.919000','+79043402122',8,0),(82,'2021-03-14 18:35:28.252000','+79043402122',7,0),(83,'2021-03-14 18:35:36.555000','+79043402122',17,3),(84,'2021-03-14 18:35:55.990000','+79043402122',9,0),(85,'2021-03-14 18:35:59.852000','+79043402122',1,3),(86,'2021-03-14 18:36:03.479000','+79043402122',15,1),(87,'2021-03-14 18:37:23.029000','+79043402122',10,0),(88,'2021-03-14 18:37:29.382000','+79043402122',4,0),(89,'2021-03-14 18:38:20.663000','+79043402122',15,1),(90,'2021-03-14 18:38:25.629000','+79043402122',12,0),(91,'2021-03-14 18:47:54.595000','+79043402122',10,0),(92,'2021-03-14 18:47:59.443000','+79043402122',5,0),(93,'2021-03-14 19:06:33.698000','+79043402122',12,0),(94,'2021-03-14 20:15:47.288000','+79622222222',15,0),(95,'2021-03-14 20:36:45.060000','+79231231231',16,0),(96,'2021-03-14 20:37:36.813000','+79235649165',6,0),(97,'2021-03-14 20:39:25.022000','+79236523336',6,0),(98,'2021-03-14 20:40:09.401000','+79214596363',7,0),(99,'2021-03-14 20:44:27.068000','+79111111111',9,2),(100,'2021-03-14 20:45:16.560000','+79000000000',3,0),(101,'2021-03-14 20:45:43.287000','+79000000001',5,0),(102,'2021-03-14 20:46:02.530000','+79333333335',4,0),(103,'2021-03-14 20:46:19.253000','+79000000002',8,0),(104,'2021-03-14 20:46:37.209000','+79111585884',4,0),(105,'2021-03-14 20:51:47.081000','+79665555556',1,3),(106,'2021-03-14 20:59:10.958000','+79235613465',13,0),(107,'2021-03-14 21:17:18.422000','+79536491865',7,0),(108,'2021-03-14 21:18:09.796000','+79343464646',14,0),(109,'2021-03-14 21:20:27.451000','+79313464949',9,0),(110,'2021-03-14 21:21:04.069000','+79643464949',14,0),(111,'2021-03-14 21:23:48.066000','+79346464646',17,3),(112,'2021-03-14 21:24:29.960000','+79364646494',8,0),(113,'2021-03-14 21:25:50.974000','+79235564685',14,0),(114,'2021-03-14 21:27:45.677000','+79999999996',5,0),(115,'2021-03-14 21:28:33.515000','+79123131231',17,3),(116,'2021-03-14 21:28:57.733000','+79123132123',15,0),(117,'2021-03-14 21:30:05.513000','+79213123123',17,3),(118,'2021-03-14 21:30:21.664000','+79213231231',3,0),(119,'2021-03-14 21:30:57.867000','+79695686652',5,0),(120,'2021-03-14 21:31:06.536000','+79212121245',5,0),(121,'2021-03-14 21:31:46.661000','+79666556585',9,0),(122,'2021-03-14 21:32:01.820000','+79123123123',17,3),(123,'2021-03-14 21:33:09.039000','+79995899886',17,3),(124,'2021-03-14 21:39:38.644000','+79454363453',15,0),(125,'2021-03-14 21:42:54.850000','+79111123212',7,0),(126,'2021-03-14 21:53:36.409000','+79113231312',3,0),(127,'2021-03-14 21:54:47.110000','+79235123123',5,0),(128,'2021-03-14 21:55:58.947000','+79890000000',17,3),(129,'2021-03-14 21:56:56.288000','+79534234234',13,0),(130,'2021-03-14 21:57:58.612000','+79555552222',12,0),(131,'2021-03-14 22:46:58.158000','+79122332221',15,0),(132,'2021-03-14 22:52:30.277000','+79043402133',8,0),(133,'2021-03-14 23:32:24.843000','+79231252323',12,0),(134,'2021-03-14 23:33:58.228000','+79512312312',14,0),(135,'2021-03-14 23:49:25.917000','+79657435135',13,0),(136,'2021-03-14 23:50:05.663000','+79415343213',8,0),(137,'2021-03-14 23:50:28.600000','+79465432463',17,3),(138,'2021-03-14 23:51:22.628000','+79654321324',17,3),(139,'2021-03-14 23:52:10.910000','+79131211110',16,0),(140,'2021-03-14 23:52:45.502000','+79514576465',6,0),(141,'2021-03-14 23:53:00.088000','+79121212121',9,0),(142,'2021-03-14 23:53:09.531000','+79121212176',15,0),(143,'2021-03-14 23:53:24.698000','+79876535467',3,0),(144,'2021-03-14 23:53:32.656000','+79789378937',15,0),(145,'2021-03-14 23:54:02.151000','+79446456455',7,0),(146,'2021-03-14 23:54:41.643000','+79341234123',8,0),(147,'2021-03-14 23:58:36.972000','+79464784986',17,3),(148,'2021-03-14 23:59:00.668000','+79785678657',1,3),(149,'2021-03-14 23:59:17.804000','+79569796500',8,0),(150,'2021-03-14 23:59:42.236000','+79124124124',14,0),(151,'2021-03-15 00:00:39.951000','+79634634663',1,3),(152,'2021-03-15 00:03:00.350000','+79123123679',5,0),(153,'2021-03-15 01:46:59.705000','+79123123123',4,0),(154,'2021-03-15 04:12:47.616000','+79043422133',17,3),(155,'2021-03-15 04:50:19.591000','+79512511213',17,3),(156,'2021-03-15 04:53:20.025000','+79741657413',1,3),(157,'2021-03-15 04:54:13.123000','+79525872321',10,0),(158,'2021-03-15 04:56:53.108000','+79741541541',1,3),(159,'2021-03-15 04:57:57.346000','+79044473193',1,3),(160,'2021-03-15 05:02:59.759000','+79634531264',1,3),(161,'2021-03-15 05:03:33.259000','+79876456456',10,0),(162,'2021-03-15 05:06:04.875000','+79235262623',10,0),(163,'2021-03-15 05:06:30.463000','+79124124555',9,0),(164,'2021-03-15 05:08:04.964000','+79553453453',15,0),(165,'2021-03-15 05:09:19.337000','+79235236789',7,0),(166,'2021-03-15 05:09:53.647000','+79856456345',4,0),(167,'2021-03-15 05:10:58.571000','+79325235235',8,0),(168,'2021-03-15 05:11:20.089000','+79796795673',17,3),(169,'2021-03-15 05:11:57.919000','+79623623611',15,0),(170,'2021-03-15 05:12:31.226000','+79543634634',1,3),(171,'2021-03-15 05:13:01.770000','+79551251221',15,0),(172,'2021-03-15 05:13:36.469000','+79125125521',6,0),(173,'2021-03-15 05:14:49.402000','+79343646433',17,3),(174,'2021-03-15 05:15:11.900000','+79363434664',10,0),(175,'2021-03-15 19:24:23.895000','+79222222222',6,0),(176,'2021-03-15 19:25:55.448000','+79111111111',17,3),(177,'2021-03-15 19:27:08.814000','+79333333333',7,0),(178,'2021-03-15 19:27:31.232000','+79444444444',3,0),(179,'2021-03-15 19:27:54.296000','+79555555555',15,0),(180,'2021-03-15 19:29:25.306000','+79666666666',3,0),(181,'2021-03-15 19:29:56.673000','+79777777777',16,0),(182,'2021-03-15 19:30:21.862000','+79888888888',15,0),(183,'2021-03-15 19:30:44.702000','+79999999999',10,2),(184,'2021-03-15 20:03:52.859000','+79043422122',8,0),(185,'2021-03-17 22:49:56.697000','+79043402122',7,2),(186,'2021-03-17 22:53:30.627000','+79545641352',6,0),(187,'2021-03-18 19:41:58.238000','+79525872320',14,2),(188,'2021-03-22 19:38:55.266000','+79885175114',3,0),(189,'2021-03-22 20:20:05.390000','+79995175114',15,0),(190,'2021-03-22 20:34:28.261000','+79647654456',8,0);
/*!40000 ALTER TABLE `t_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_prizes`
--

DROP TABLE IF EXISTS `t_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_prizes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rarity` int(11) NOT NULL,
  `pieces_left` bigint(20) NOT NULL,
  `expires_in` datetime(6) DEFAULT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `redirect` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_prizes`
--

LOCK TABLES `t_prizes` WRITE;
/*!40000 ALTER TABLE `t_prizes` DISABLE KEYS */;
INSERT INTO `t_prizes` (`id`, `description`, `name`, `rarity`, `pieces_left`, `expires_in`, `enabled`, `redirect`) VALUES (1,'Ты ничего не выйграл. Не расстраивайся, попробуй завтра!','Завтра будет твой день',0,-1,NULL,'',NULL),(3,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Молочный коктейль',1,81,NULL,'',NULL),(4,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Ролл Бонито',1,-1,NULL,'',NULL),(5,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Ролл ТИП-ТОП',1,-1,NULL,'',NULL),(6,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Кофе',1,-1,NULL,'',NULL),(7,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Маленькая пицца',1,-1,NULL,'',NULL),(8,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Пицца Барбекю',1,-1,NULL,'',NULL),(9,'Подарок от спонсора, сделай заказ, чтобы получить!','Подарок от спонсоров',2,-1,'2021-11-28 21:00:00.000000','','https://www.youtube.com/watch?v=rRPQs_kM_nw'),(10,'Подарок от спонсора, сделай заказ, чтобы получить!','Подарок от спонсора',2,-1,NULL,'','https://www.youtube.com/watch?v=rRPQs_kM_nw'),(12,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Пончики',1,-1,NULL,'',NULL),(13,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Скидка на пиццу 50%',1,-1,NULL,'',NULL),(14,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Чикен Бургер',1,-1,NULL,'',NULL),(15,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Эби Фрай',1,-1,NULL,'',NULL),(16,'При заказе большой пиццы укажи введёный номер телефона и скажи оператору, что хочешь использовать свой приз.','Дон Бекон',1,-1,NULL,'',NULL),(17,'Ты ничего не выйграл. Не расстраивайся, попробуй завтра!','Покрути завтра',0,-1,NULL,'',NULL);
/*!40000 ALTER TABLE `t_prizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `name`) VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN'),(3,'ROLE_OPERATOR'),(4,'ROLE_SUPERUSER');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_user_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `password`, `username`, `enabled`) VALUES (1,'$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLe','admin',''),(2,'$2a$31$fQZsT3Ejazumt9CfdDlm8uSLR1hdHAOQ5hBB8Jh/Ad9yMZh6ydpLe','operator','');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_roles`
--

DROP TABLE IF EXISTS `t_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKj47yp3hhtsoajht9793tbdrp4` (`roles_id`),
  CONSTRAINT `FKj47yp3hhtsoajht9793tbdrp4` FOREIGN KEY (`roles_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKpqntgokae5e703qb206xvfdk3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_roles`
--

LOCK TABLES `t_user_roles` WRITE;
/*!40000 ALTER TABLE `t_user_roles` DISABLE KEYS */;
INSERT INTO `t_user_roles` (`user_id`, `roles_id`) VALUES (1,1),(1,2),(1,3),(2,1),(2,3);
/*!40000 ALTER TABLE `t_user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-29 14:23:29

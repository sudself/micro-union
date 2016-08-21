drop database if exists aliyun;
create database aliyun character set utf8;
use aliyun;

-- 用户表
CREATE TABLE `CLOUD_USER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `CLOUD_USER` VALUES ('1', 'admin', 'admin');
commit;

-- 云账号设置表
CREATE TABLE `CLOUD_ACCOUNT` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `account_name` varchar(50) NOT NULL COMMENT '帐号名称',
  `type_id` int(1) NOT NULL COMMENT '云类型ID 0-aliyun 1-openstack',
  `vm_count` int(11) NOT NULL COMMENT '虚机个数',
  `status` int(1) NOT NULL COMMENT '帐号状态 0-无效，1-有效',
  `sync_status` int(1) NOT NULL COMMENT '同步状态 0-失败 1-成功',
  `update_time` datetime DEFAULT NULL COMMENT '上次同步时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `mark` varchar(200) DEFAULT NULL COMMENT '备注',
  `tenantName` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL COMMENT '阿里云对应Access Key ID',
  `password` varchar(200) DEFAULT NULL COMMENT '阿里云对应Access Key Secret',
  `endpoint` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;


-- 虚拟机模板表（一表|多表）
create table CLOUD_TEMPLATE
(
   ID                   int(11) not null AUTO_INCREMENT,
   TEM_NAME             varchar(60) comment '模板名称',
   TEM_DESC             varchar(100) comment '模板描述',
   `platform_type`      int(1) COMMENT '云平台类型，0表示阿里云，1表示openstack',
   ACCOUNTID            int(11) comment '云账号id',
   TEM_STATUS           tinyint comment '模板状态:0无效，1有效',
   CREATETIME           datetime comment '创建时间',
   TEM_CONTEXT          varchar(2000) comment '模板内容',
   primary key (ID)
);
alter table CLOUD_TEMPLATE comment '模板表';


-- 集群表
CREATE TABLE `CLOUD_CLUSTER` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '集群编号',
  `cluster_name` varchar(200) NOT NULL,
  `env_type` int(1) NOT NULL COMMENT '0 开发环境，1 测试环境， 2 staging环境 3 生产环境',
  `descr` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 虚拟机组表
CREATE TABLE `CLOUD_VM_GROUP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 虚拟机表
CREATE TABLE `CLOUD_VIRTUAL` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识id',
  `account_id`   int(11) DEFAULT NULL COMMENT '云账号表主键id',
  `platform_type`      int(1) COMMENT '云平台类型，0表示阿里云，1表示openstack',
  `virtual_name` varchar(60) NOT NULL COMMENT '虚拟机名称',
  `virtual_id` varchar(60) NOT NULL COMMENT '虚拟机id',
  `image_id` varchar(60) NOT NULL COMMENT '镜像id',
  `cluster_id`   int(11) DEFAULT NULL COMMENT '集群id',
  `vm_group_id`  int(11) DEFAULT NULL COMMENT '虚拟机组id',
  `status` varchar(20) DEFAULT NULL COMMENT '虚拟机状态',
  `ipaddresses` varchar(255) DEFAULT NULL COMMENT '多个则用逗号分隔，括号区分内网、公网',
  `regionid` varchar(60) DEFAULT NULL COMMENT '实例所属地域ID',
  `virtual_size` varchar(20) DEFAULT NULL COMMENT '虚拟机大小',
  `virtual_sys` varchar(60) DEFAULT NULL COMMENT '虚拟机操作系统',
  `virtual_createtime` datetime DEFAULT NULL COMMENT '虚拟机创建时间',
  `virtual_synchrotime` datetime DEFAULT NULL COMMENT '虚拟机同步更新时间',
  `target` char(1) DEFAULT 0 NOT NULL COMMENT '云平台类型，0表示未导入，1表示导入，2表示创建 3历史',
  `deleteFlag` char(1) DEFAULT 1  NOT NULL COMMENT '是否删除 0删除 1存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- create user module tables --
--add by Angie --

-- institution table --
DROP TABLE USR_INSTITUTION;
CREATE TABLE USR_INSTITUTION
(
 INSTITUTIONID VARCHAR(32) NOT NULL COMMENT '机构编号',
 INSTITUTIONNAME VARCHAR(20) NOT NULL COMMENT '名称',
 DETAIL	VARCHAR(64) NOT NULL COMMENT '说明',
 CREATE_TIME DATETIME NOT NULL COMMENT '创建时间',
 UPDATE_TIME DATETIME COMMENT '修改时间',
 PRIMARY KEY (INSTITUTIONID)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- role info table --
DROP TABLE USR_ROLEINFO;
CREATE TABLE USR_ROLEINFO
(
 ROLEID	VARCHAR(32) NOT NULL COMMENT '角色编号',
 ROLENAME	VARCHAR(20) NOT NULL COMMENT '角色名称',
 CREATE_TIME DATETIME NOT NULL COMMENT '创建时间',
 UPDATE_TIME DATETIME COMMENT '修改时间',
 PRIMARY KEY (ROLEID)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- department info table --
DROP TABLE USR_DEPARTMENT;
CREATE TABLE USR_DEPARTMENT
(
 DEPARTMENTID	VARCHAR(32) NOT NULL COMMENT '部门编号',
 DEPARTMENTNAME	VARCHAR(20) NOT NULL COMMENT '部门名称',
 DETAIL VARCHAR(64) NOT NULL COMMENT '说明',
 CREATE_TIME DATETIME NOT NULL COMMENT '创建时间',
 UPDATE_TIME DATETIME COMMENT '修改时间',
 PRIMARY KEY (DEPARTMENTID)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- userinfo table --
DROP TABLE USR_USERINFO;
CREATE TABLE USR_USERINFO
(
 USERID	VARCHAR(32) NOT NULL COMMENT '编号',
 USERNAME VARCHAR(20) NOT NULL COMMENT '姓名',
 PASSWD	VARCHAR(64)  NOT NULL COMMENT '密码',
 ROLEID VARCHAR(32) NOT NULL COMMENT '角色编号',
 GENDER	VARCHAR(1) NOT NULL COMMENT '性别 (0:女,1:男)',
 AGE	FLOAT(3,1) NOT NULL COMMENT '年龄',
 STATE	TINYINT NOT NULL COMMENT '状态 (0：正常，9：删除)',
 INSTITUTIONID	VARCHAR(32) NOT NULL COMMENT '机构编号',
 CREATE_TIME DATETIME NOT NULL COMMENT '创建时间',
 UPDATE_TIME DATETIME COMMENT '修改时间',
 PRIMARY KEY (USERID),
 FOREIGN KEY(INSTITUTIONID) REFERENCES USR_INSTITUTION(INSTITUTIONID),
 FOREIGN KEY(ROLEID) REFERENCES USR_ROLEINFO(ROLEID)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- user detail table --
DROP TABLE USR_USERDETAIL;
CREATE TABLE USR_USERDETAIL
(
 DETAILID VARCHAR(32) NOT NULL COMMENT '编号',
 USERID	VARCHAR(32)  NOT NULL COMMENT '用户唯一编号',
 USERNAME VARCHAR(20) NOT NULL COMMENT '姓名',
 DEPARTMENTID VARCHAR(32)  NOT NULL COMMENT '部门编号',
 CREATE_TIME DATETIME NOT NULL COMMENT '创建时间',
 UPDATE_TIME DATETIME COMMENT '修改时间',
 PRIMARY KEY (DETAILID),
 FOREIGN KEY(USERID) REFERENCES USR_USERINFO(USERID),
 FOREIGN KEY(DEPARTMENTID) REFERENCES USR_DEPARTMENT(DEPARTMENTID)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
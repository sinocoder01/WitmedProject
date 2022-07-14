-- 创建并使用数据库 witmed_db
drop database if exists witmed_db;
create database witmed_db;
use witmed_db;

-- ==================================================
-- 系统功能模块数据表
-- ==================================================
-- 系统人员信息表：sys_admin
drop table if exists sys_admin;
create table sys_admin(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    no varchar(100) comment '工号',
    name varchar(100) comment '姓名',
    cellphone varchar(100) comment '手机号码',
    password varchar(500) comment '登录密码，MD5 加密',
    identity varchar(100) comment '人员身份',
    position varchar(100) comment '人员职位',
    department varchar(100) comment '所属科室',
    eduBackground varchar(100) comment '学历',
    techTitle varchar(100) comment '专业技术职务',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '系统人员信息表';

-- 系统人员身份信息表：sys_admin_identity
drop table if exists sys_admin_identity;
create table sys_admin_identity(
    id int(10) not null auto_increment comment '主键',
    code varchar(100) comment '身份编号',
    name varchar(100) comment '身份名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '系统人员身份信息表';

-- 系统人员职位信息表：sys_admin_position
drop table if exists sys_admin_position;
create table sys_admin_position(
    id int(100) not null auto_increment comment '主键',
    department varchar(100) comment '所属科室',
    code varchar(100) comment '职位编码',
    name varchar(100) comment '职位名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '系统人员职位信息表';

-- 系统功能菜单信息表：sys_menu
drop table if exists sys_menu;
create table sys_menu(
    id int(10) not null auto_increment comment '主键',
    parent varchar(100) comment '所属功能',
    code varchar(100) comment '功能编码',
    text varchar(100) comment '功能文本',
    url varchar(100) comment '链接地址',
    icon varchar(100) comment '功能图标',
    sort int(10) comment '顺序',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '系统功能菜单信息表';

-- 职位功能信息表：sys_position_menu
drop table if exists sys_position_menu;
create table sys_position_menu(
    position varchar(100) comment '职位信息',
    menu varchar(100) comment '功能信息'
)Engine=InnoDB charset=utf8mb4 comment '职位功能信息表';

-- 科室部门信息表：sys_department
drop table if exists sys_department;
create table sys_department(
    id int(10) not null auto_increment comment '主键',
    hospital varchar(100) comment '所属医院',
    parent varchar(100) comment '上级科室',
    code varchar(100) comment '科室编码',
    name varchar(10) comment '科室名称',
    sort int(10) comment '顺序',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '科室部门信息表';

-- 医院信息表：sys_hospital
drop table if exists sys_hospital;
create table sys_hospital(
    id int(10) not null auto_increment comment '主键',
    name varchar(100) comment '医院名称',
    orgCode varchar(100) comment '组织机构编码',
    charge varchar(100) comment '负责人',
    province varchar(100) comment '所在省份',
    city varchar(100) comment '所在城市',
    district varchar(100) comment '所在区县',
    address varchar(500) comment '详细地址',
    telephone varchar(100) comment '联系电话', 
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '医院信息表';

-- 病历信息表：sys_emr
drop table if exists sys_emr;
create table sys_emr(
    id int(10) not null auto_increment comment '主键',
    code varchar(100) comment '病历编号',
    name varchar(100) comment '病历名称',
    url varchar(100) comment '链接地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历信息表';

-- 科室病历息表：sys_department_emr
drop table if exists sys_department_emr;
create table sys_department_emr(
    department varchar(100) comment '科室信息',
    emr varchar(100) comment '病历信息'
)Engine=InnoDB charset=utf8mb4 comment '科室病历息表';

-- 专业职务类别信息表：sys_tech_category
drop table if exists sys_tech_category;
create table sys_tech_category(
    id int(10) not null auto_increment comment '主键',
    code varchar(100) comment '类别编码',
    name varchar(100) comment '类别名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '专业职务类别信息表';

-- 专业职务等级信息表：sys_tech_rank
drop table if exists sys_tech_rank;
create table sys_tech_rank(
    id int(10) not null auto_increment comment '主键',
    techCat varchar(100) comment '所属类别',
    code varchar(100) comment '等级编码',
    name varchar(100) comment '等级名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '专业职务等级信息表';

-- 专业职务信息表：sys_tech_title
drop table if exists sys_tech_title;
create table sys_tech_title(
    id int(10) not null auto_increment comment '主键',
    techCat varchar(100) comment '所属类别',
    techRank varchar(100) comment '所属等级',
    code varchar(100) comment '等级编码',
    name varchar(100) comment '等级名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '专业职务信息表';

-- 学历信息表：sys_edu_background
drop table if exists sys_edu_background;
create table sys_edu_background(
    id int(10) not null auto_increment comment '主键',
    code varchar(100) comment '学历编码',
    name varchar(100) comment '学历名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '学历信息表';

-- 行政区划信息表：sys_division
drop table if exists sys_division;
create table sys_division(
    id int(10) not null auto_increment comment '主键',
    parent varchar(100) comment '上级行政区划',
    code varchar(100) comment '行政区划编码',
    name varchar(100) comment '行政区划名称',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '行政区划信息表';

-- 数据元值域信息表：sys_data_code
drop table if exists sys_data_code;
create table sys_data_code(
    id int(10) not null auto_increment comment '主键',
    parent varchar(100) comment '所属数据元',
    code varchar(100) comment '数据元值域',
    remark varchar(100) comment '数据元值域说明',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '数据元值域信息表';

-- 系统字典信息表：sys_dictionary
drop table if exists sys_dictionary;
create table sys_dictionary(
    id int(10) not null auto_increment comment '主键',
    parent varchar(100) comment '上级字典',
    code varchar(100) comment '字典编码',
    text varchar(100) comment '字典文本',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '系统字典信息表';

-- ==================================================
-- 病人功能模块数据表
-- ==================================================
-- 病人信息表：pa_patient
drop table if exists pa_patient;
create table pa_patient(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrNo varchar(100)  comment '病历号',
    name varchar(100)  comment '姓名',
    idType varchar(100)  comment '证件类型',
    idNo varchar(100)  comment '证件号码',
    idEffDate date comment '证件生效日期',
    idExpDate date comment '证件失效日期',
    idOrg varchar(100)  comment '证件提供机构',
    aboBlood varchar(100)  comment 'ABO血型',
    rhBlood varchar(100)  comment 'RH血型',
    gender varchar(100)  comment '性别',
    nationality varchar(100)  comment '国籍',
    ethnic varchar(100)  comment '民族',
    marital varchar(100)  comment '婚姻状况',
    education varchar(100)  comment '文化程度',
    birthday date comment '出生日期',
    birthplace varchar(500)  comment '出生地',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人信息表';

-- 病人联系地址详情表：pa_patient_address
drop table if exists pa_patient_address;
create table pa_patient_address(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    patient varchar(100) comment '病人信息',
    addrCat varchar(100) comment '地址类别',
    province varchar(100) comment '地址-省（自治区、直辖市）',
    city varchar(100) comment '地址-市（地区）',
    district varchar(100) comment '地址-县（区）',
    subdistrict varchar(100) comment '地址-乡（镇、街道办事处）',
    village varchar(100) comment '地址-村（街、路、弄等）',
    doorNo varchar(100) comment '地址-门牌号码',
    zipcode varchar(100) comment '邮政编码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人联系地址详情表';

-- 病人通信详情表：pa_patient_communication
drop table if exists pa_patient_communication;
create table pa_patient_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    patient varchar(100) comment '病人信息',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人通信详情表';

-- 病人联系人详情表：pa_patient_liaison
drop table if exists pa_patient_liaison;
create table pa_patient_liaison(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    patient varchar(100) comment '病人信息',
    idType varchar(100) comment '证件类别',
    idNo varchar(100) comment '证件',
    idEffDate date comment '证件生效日期',
    idExpDate date comment '证件失效日期',
    idOrg varchar(100) comment '证件提供机构',
    liaisonType varchar(100) comment '联系人类型',
    name varchar(100) comment '姓名',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人联系人详情表';

-- 病人医保详情表：pa_patient_insurance
drop table if exists pa_patient_insurance;
create table pa_patient_insurance(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    patient varchar(100) comment '病人信息',
    insCat varchar(100) comment '医疗保险-类别',
    treatment varchar(100) comment '医疗待遇',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人医保详情表';

-- 病人职业详情表：pa_patient_occupation
drop table if exists pa_patient_occupation;
create table pa_patient_occupation(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    patient varchar(100) comment '病人信息',
    occupation varchar(100) comment '职业信息',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人职业详情表';

-- 病人就诊信息表：pa_treatment
drop table if exists pa_treatment;
create table pa_patient_treatment(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    patient varchar(100) comment '病人信息',
    emrNo varchar(100) comment '病历号',
    txNo varchar(100) comment '就诊号',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病人就诊信息表';

-- ==================================================
-- 电子病历功能模块数据表 —— 病历概要
-- ==================================================
-- 病历概要信息表：emr_resume
drop table if exists emr_resume;
create table emr_resume(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrNo varchar(100) comment '病历号',
    clinicNo varchar(100) comment '门诊号',
    docName varchar(100) not null default '病历概要' comment '文档标识-名称',
    docCatCode varchar(100) not null default '01' comment '文档标识-类别代码',
    docAdminOrgName varchar(100) comment '文档标识-管理机构名称',
    docAdminOrgCode varchar(100) comment '文档标识-管理机构组织机构代码（法人代码）',
    docNo varchar(100) comment '文档标识-号码',
    docEffDate datetime comment '文档标识-生效日期',
    docExpDate datetime comment '文档标识-失效日期',
    markCatCode varchar(100) comment '标识号-类别代码',
    markNo varchar(100) comment '标识号-号码',
    markEffDate datetime comment '标识号-生效日期',
    markExpDate datetime comment '标识号-失效日期',
    markOrgName varchar(100) comment '标识号-提供标识的机构名称',
    markObj varchar(100) comment '姓名-标识对象',
    markObjCode varchar(100) comment '姓名-标识对象代码',
    name varchar(100) comment '姓名',
    paCatCode varchar(100) comment '病人类型代码',
    aboBlood varchar(100) comment 'ABO血型',
    rhBlood varchar(100) comment 'RH血型',
    gender varchar(100) comment '性别代码',
    age int comment '年龄（岁）',
    nationality varchar(100) comment '国籍代码',
    ethnic varchar(100) comment '民族代码',
    marital varchar(100) comment '婚姻状况类别代码',
    occupation varchar(100) comment '职业编码系统名称',
    occCode varchar(100) comment '职业代码',
    education varchar(100) comment '文化程度代码',
    birthday date comment '出生日期',
    birthplace varchar(500) comment '出生地',
    workplace varchar(500) comment '工作单位名称',
    addrCatCode varchar(100) comment '标识地址类别的代码',
    province varchar(100) comment '地址-省（自治区、直辖市）',
    city varchar(100) comment '地址-市（地区）',
    district varchar(100) comment '地址-县（区）',
    subdistrict varchar(100) comment '地址-乡（镇、街道办事处）',
    village varchar(100) comment '地址-村（街、路、弄等）',
    doorNo varchar(100) comment '地址-门牌号码',
    zipcode varchar(100) comment '邮政编码',
    divisionCode varchar(100) comment '行政区划代码',
    treatment varchar(100) comment '医疗待遇名称',
    txCode varchar(100) comment '医疗待遇代码',
    eventName varchar(500) comment '卫生事件(动作)名称',
    eventCatCode varchar(100) comment '事件分类代码',
    eventStartDate datetime COMMENT '事件开始时间',
    eventAddr varchar(500) comment '事件发生地点',
    eventPart varchar(100) comment '事件参与方',
    eventReason varchar(500) comment '事件发生原因',
    eventResult varchar(500) comment '事件结局',
    emrStatus varchar(100) comment '病历状态：0-待接诊，1-诊疗完毕，2-未接诊，3-接诊后转诊/院，4-挂号错误',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要信息表';

-- 病历概要通信详情表：emr_resume_communication
drop table if exists emr_resume_communication;
create table emr_resume_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrResume varchar(100) comment '所属病历概要数据',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要通信详情表';

-- 病历概要联系人详情表：emr_resume_liaison
drop table if exists emr_resume_liaison;
create table emr_resume_liaison(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrResume varchar(100) comment '所属病历概要数据',
    markCatCode varchar(100) comment '标识号-类别代码',
    markNo varchar(100) comment '标识号-号码',
    markEffDate datetime comment '标识号-生效日期',
    markOrgName varchar(100) comment '标识号-提供标识的机构名称',
    markObj varchar(100) comment '姓名-标识对象',
    markObjCode varchar(100) comment '姓名-标识对象代码',
    name varchar(100) comment '姓名',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要联系人详情表';

-- 病历概要既往史详情表：emr_resume_disease
drop table if exists emr_resume_disease;
create table emr_resume_disease(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrResume varchar(100) comment '所属病历概要数据',
    history varchar(100) comment '既往疾病史',
    mentalDxName varchar(100) comment '既往精神类疾病诊断名称',
    diseaseName varchar(100) comment '既往疾病名称',
    diseaseCode varchar(100) comment '既往疾病代码',
    diseaseDxOrg varchar(100) comment '既往疾病诊断机构',
    dxOrgLevelCode varchar(100) comment '既往疾病诊断机构级别代码',
    diseaseDxTime datetime comment '既往疾病诊断时间',
    diseaseStatus varchar(100) comment '疾病当前状态代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要既往史详情表';

-- 病历概要医疗费用详情表：emr_resume_expense
drop table if exists emr_resume_expense;
create table emr_resume_expense(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrResume varchar(100) comment '所属病历概要数据',
    expClinicCat varchar(100) comment '门诊费用-分类',
    expClinicCatCode varchar(100) comment '门诊费用-分类代码',
    clinicAmount decimal(10, 2) comment '门诊费用-金额（元/人民币）',
    clinicPayTypeCode varchar(100) comment '门诊费用-支付方式代码',
    hospExpCat varchar(100) comment '住院费用-分类',
    hospExpCatCode varchar(100) comment '住院费用-分类代码',
    hospAmount decimal(10, 2) comment '住院费用-金额（元/人民币）',
    personAmount decimal(10, 2) comment '个人承担费用（元）',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要医疗费用详情表';

-- 病历概要医保详情表：emr_resume_insurance
drop table if exists emr_resume_insurance;
create table emr_resume_insurance(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrResume varchar(100) comment '所属病历概要数据',
    insCat varchar(100) comment '医疗保险-类别',
    insCatCode varchar(100) comment '医疗保险-类别代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要医保详情表';

-- 病历概要用药详情表：emr_resume_medication
drop table if exists emr_resume_medication;
create table emr_resume_medication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrResume varchar(100) comment '所属病历概要数据',
    medUsage varchar(100) comment '药物用法',
    usageRate varchar(100) comment '药物使用-频率',
    medUnit varchar(100) comment '药物使用-剂量单位',
    perDosage decimal(10, 2) comment '药物使用-次剂量',
    totalDosage decimal(10, 2) comment '药物使用-总剂量',
    wayCode varchar(100) comment '药物使用-途径代码',
    medName varchar(100) comment '药物名称',
    dosageForm varchar(100) comment '药物剂型代码',
    medCat varchar(100) comment '药物类型',
    medNameCode varchar(100) comment '药物名称代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '病历概要用药详情表';

-- ==================================================
-- 电子病历功能模块数据表 —— 门（急）诊病历
-- ==================================================
-- 门（急）诊病历：emr_clinic
drop table if exists emr_clinic;
create table emr_clinic(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrNo varchar(100) comment '病历号',
    clinicNo varchar(100) comment '门诊号',
    docName varchar(100) not null default '门（急）诊病历' comment '文档标识-名称',
    docCatCode varchar(100) not null default '02' comment '文档标识-类别代码',
    docAdminOrgName varchar(100) comment '文档标识-管理机构名称',
    docAdminOrgCode varchar(100) comment '文档标识-管理机构组织机构代码（法人代码）',
    docNo varchar(100) comment '文档标识-号码',
    docEffDate datetime comment '文档标识-生效日期',
    docExpDate datetime comment '文档标识-失效日期',
    markCatCode varchar(100) comment '标识号-类别代码',
    markNo varchar(100) comment '标识号-号码',
    markEffDate datetime comment '标识号-生效日期',
    markExpDate datetime comment '标识号-失效日期',
    markOrgName varchar(100) comment '标识号-提供标识的机构名称',
    markObj varchar(100) comment '姓名-标识对象',
    markObjCode varchar(100) comment '姓名-标识对象代码',
    name varchar(100) comment '姓名',
    patientCatCode varchar(100) comment '病人类型代码',
    gender varchar(100) comment '性别代码',
    age int comment '年龄（岁）',
    nationality varchar(100) comment '国籍代码',
    ethnic varchar(100) comment '民族代码',
    marital varchar(100) comment '婚姻状况类别代码',
    occupation varchar(100) comment '职业编码系统名称',
    occCode varchar(100) comment '职业代码',
    education varchar(100) comment '文化程度代码',
    birthday date comment '出生日期',
    birthplace varchar(500) comment '出生地',
    workplace varchar(500) comment '工作单位名称',
    addrCatCode varchar(100) comment '标识地址类别的代码',
    province varchar(100) comment '地址-省（自治区、直辖市）',
    city varchar(100) comment '地址-市（地区）',
    district varchar(100) comment '地址-县（区）',
    subdistrict varchar(100) comment '地址-乡（镇、街道办事处）',
    village varchar(100) comment '地址-村（街、路、弄等）',
    doorNo varchar(100) comment '地址-门牌号码',
    zipcode varchar(100) comment '邮政编码',
    divisionCode varchar(100) comment '行政区划代码',
    orgName varchar(100) comment '机构名称',
    orgCode varchar(100) comment '机构组织机构代码',
    orgLeader varchar(500) comment '机构负责人（法人）',
    orgAddress varchar(500) comment '机构地址',
    deptName varchar(500) comment '科室名称',
    orgRole varchar(100) comment '机构角色',
    orgRoleCode varchar(100) comment '机构角色代码',
    servName varchar(100) comment '服务者姓名',
    servRole varchar(100) comment '服务者职责（角色）',
    servRoleCode varchar(100) comment '服务者职责（角色）代码',
    servtechTitle varchar(100) comment '服务者专业技术职务',
    servEdu varchar(100) comment '服务者学历',
    servMajor varchar(100) comment '服务者所学专业',
    servTechRank varchar(100) comment '服务者专业技术职务等级',
    servPost varchar(100) comment '服务者职务',
    mainSuit varchar(500) comment '主诉',
    symptom varchar(500) comment '症状代码编码体系名称',
    sxCode varchar(100) comment '症状代码',
    sxBeginTime datetime comment '症状开始日期时间',
    sxEndTime datetime comment '症状停止日期时间',
    sxDesc varchar(500) comment '症状描述',
    sxAcuteLevel varchar(100) comment '症状急性程度代码',
    firstVisit varchar(100) comment '初诊标志',
    physCheckCat varchar(100) comment '观察-类别',
    physCheckCatCode varchar(100) comment '观察-类别代码',
    physCheckItem varchar(100) comment '观察项目名称',
    physCheckItemCode varchar(100) comment '观察-项目代码',
    physCheckResultDesc varchar(500) comment '观察-结果描述',
    physCheckResult varchar(100) comment '观察-结果(数值)',
    physCheckUnit varchar(100) comment '观察-计量单位',
    physCheckResultCode varchar(100) comment '观察-结果代码',
    dxOrgName varchar(100) comment '诊断机构名称',
    dxDate datetime comment '诊断日期',
    dxCat varchar(100) comment '诊断类别',
    dxCatCode varchar(100) comment '诊断类别代码',
    dxCisCode varchar(100) comment '诊断顺位（从属关系）代码',
    disease varchar(500) comment '疾病名称',
    diseaseCode varchar(100) comment '疾病代码',
    dxAccording varchar(500) comment '诊断依据',
    dxAccordingCode varchar(100) comment '诊断依据代码',
    planCheck varchar(500) comment '拟做的检查',
    txSchPlan varchar(500) comment '今后治疗方案',
    followMark varchar(100) comment '随访标志',
    followInr varchar(100) comment '随访间隔（随诊期限）',
    docAdvice varchar(500) comment '医嘱',
    spRemark varchar(500) comment '特别注意事项',
    txProcName varchar(500) comment '诊疗过程名称',
    txProcDesc varchar(500) comment '诊疗过程描述',
    emrStatus varchar(100) comment '病历状态：0-待接诊，1-诊疗完毕，2-未接诊，3-接诊后转诊/院，4-挂号错误',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历信息表';

-- 门（急）诊病历医嘱详情表：emr_clinic_advice
drop table if exists emr_clinic_advice;
create table emr_clinic_advice(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClinic varchar(100) comment '所属门（急）诊病历',
    startDate datetime comment '医嘱开嘱日期时间',
    stopDate datetime comment '长期医嘱停嘱日期时间',
    execDate datetime comment '医嘱执行日期时间',
    execDateCatCode varchar(100) comment '医嘱执行时间类别代码',
    execCnlDate datetime comment '医嘱取消日期时间',
    adviceCat varchar(100) comment '医嘱类别',
    adviceDetail varchar(500) comment '医嘱内容',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历医嘱详情表';

-- 门（急）诊病历过敏史详情表：emr_clinic_allergy
drop table if exists emr_clinic_allergy;
create table emr_clinic_allergy(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClinic varchar(100) comment '所属门（急）诊病历',
    history varchar(500) comment '过敏史',
    allergen varchar(500) comment '过敏原',
    allSx varchar(500) comment '过敏症状',
    allSxCode varchar(100) comment '过敏症状代码',
    allergenCode varchar(100) comment '过敏原代码',
    medicant varchar(500) comment '过敏药物名称',
    statusCode varchar(100) comment '过敏病情状态代码',
    markCode varchar(100) comment '过敏史标识代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历过敏史详情表';

-- 门（急）诊病历检查申请详情表：emr_clinic_check_apply
drop table if exists emr_clinic_check_apply;
create table emr_clinic_check_apply(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClinic varchar(100) comment '所属门（急）诊病历',
    checkOrg varchar(100) comment '检查申请单—机构（科室）',
    checkNo varchar(100) comment '检查申请单—编号',
    checkReason varchar(500) comment '检查申请检查原因',
    applyDate datetime comment '检查申请日期',
    attention varchar(500) comment '检查申请注意事项',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历检查申请详情表';

-- 门（急）诊病历检查报告详情表：emr_clinic_check_report
drop table if exists emr_clinic_check_report;
create table emr_clinic_check_report(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClinic varchar(100) comment '所属门（急）诊病历',
    checkOrg varchar(100) comment '检查申请单—机构（科室）',
    checkNo varchar(100) comment '检查申请单—编号',
    objResult varchar(500) comment '检查报告结果-客观所见',
    subResult varchar(500) comment '检查报告结果-主观提示',
    checkDate datetime comment '检查日期',
    reportDate datetime comment '检查报告日期',
    remark varchar(500) comment '检查报告备注',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历检查报告详情表';

-- 门（急）诊病历通信详情表：emr_clinic_communication
drop table if exists emr_clinic_communication;
create table emr_clinic_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClinic varchar(100) comment '所属门（急）诊病历',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历通信详情表';

-- 门（急）诊病历通信详情表：emr_clinic_communication
drop table if exists emr_clinic_communication;
create table emr_clinic_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClinic varchar(100) comment '所属门（急）诊病历',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '门（急）诊病历通信详情表';

-- ==================================================
-- 电子病历功能模块数据表 —— 急诊留观病历
-- ==================================================
-- 急诊留观病历信息表：emr_clinic_observation
drop table if exists emr_clinic_observation;
create table emr_clinic_observation(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrNo varchar(100) comment '病历号',
    clinicNo varchar(100) comment '门诊号',
    docName varchar(100) not null default '急诊留观病历' comment '文档标识-名称',
    docCatCode varchar(100) not null default '99' comment '文档标识-类别代码',
    docAdminOrgName varchar(100) comment '文档标识-管理机构名称',
    docAdminOrgCode varchar(100) comment '文档标识-管理机构组织机构代码（法人代码）',
    docNo varchar(100) comment '文档标识-号码',
    docEffDate datetime comment '文档标识-生效日期',
    docExpDate datetime comment '文档标识-失效日期',
    markCatCode varchar(100) comment '标识号-类别代码',
    markNo varchar(100) comment '标识号-号码',
    markEffDate datetime comment '标识号-生效日期',
    markExpDate datetime comment '标识号-失效日期',
    markOrgName varchar(100) comment '标识号-提供标识的机构名称',
    markObj varchar(100) comment '姓名-标识对象',
    markObjCode varchar(100) comment '姓名-标识对象代码',
    name varchar(100) comment '姓名',
    patientCatCode varchar(100) comment '病人类型代码',
    gender varchar(100) comment '性别代码',
    age int comment '年龄（岁）',
    nationality varchar(100) comment '国籍代码',
    ethnic varchar(100) comment '民族代码',
    marital varchar(100) comment '婚姻状况类别代码',
    occupation varchar(100) comment '职业编码系统名称',
    occCode varchar(100) comment '职业代码',
    education varchar(100) comment '文化程度代码',
    birthday date comment '出生日期',
    birthplace varchar(500) comment '出生地',
    workplace varchar(500) comment '工作单位名称',
    addrCatCode varchar(100) comment '标识地址类别的代码',
    province varchar(100) comment '地址-省（自治区、直辖市）',
    city varchar(100) comment '地址-市（地区）',
    district varchar(100) comment '地址-县（区）',
    subdistrict varchar(100) comment '地址-乡（镇、街道办事处）',
    village varchar(100) comment '地址-村（街、路、弄等）',
    doorNo varchar(100) comment '地址-门牌号码',
    zipcode varchar(100) comment '邮政编码',
    divisionCode varchar(100) comment '行政区划代码',
    orgName varchar(100) comment '机构名称',
    orgCode varchar(100) comment '机构组织机构代码',
    orgLeader varchar(500) comment '机构负责人（法人）',
    orgAddress varchar(500) comment '机构地址',
    deptName varchar(500) comment '科室名称',
    orgRole varchar(100) comment '机构角色',
    orgRoleCode varchar(100) comment '机构角色代码',
    servName varchar(100) comment '服务者姓名',
    servRole varchar(100) comment '服务者职责（角色）',
    servRoleCode varchar(100) comment '服务者职责（角色）代码',
    servtechTitle varchar(100) comment '服务者专业技术职务',
    servEdu varchar(100) comment '服务者学历',
    servMajor varchar(100) comment '服务者所学专业',
    servTechRank varchar(100) comment '服务者专业技术职务等级',
    servPost varchar(100) comment '服务者职务',
    mainSuit varchar(500) comment '主诉',
    symptom varchar(500) comment '症状代码编码体系名称',
    sxCode varchar(100) comment '症状代码',
    sxBeginTime datetime comment '症状开始日期时间',
    sxEndTime datetime comment '症状停止日期时间',
    sxDesc varchar(500) comment '症状描述',
    physCheckCat varchar(100) comment '观察-类别',
    physCheckCatCode varchar(100) comment '观察-类别代码',
    physCheckItem varchar(100) comment '观察项目名称',
    physCheckItemCode varchar(100) comment '观察-项目代码',
    physCheckResultDesc varchar(500) comment '观察-结果描述',
    physCheckResult varchar(100) comment '观察-结果(数值)',
    physCheckUnit varchar(100) comment '观察-计量单位',
    physCheckResultCode varchar(100) comment '观察-结果代码',
    personRisk varchar(100) comment '个人史危险因素代码',
    personCheckCatName varchar(100) comment '个人史观察项目类目名称',
    personCheckResult varchar(500) comment '个人史观察结果',
    dxOrgName varchar(100) comment '诊断机构名称',
    dxDate datetime comment '诊断日期',
    dxCat varchar(100) comment '诊断类别',
    dxCatCode varchar(100) comment '诊断类别代码',
    dxCisCode varchar(100) comment '诊断顺位（从属关系）代码',
    disease varchar(500) comment '疾病名称',
    diseaseCode varchar(100) comment '疾病代码',
    dxAccording varchar(500) comment '诊断依据',
    dxAccordingCode varchar(100) comment '诊断依据代码',
    proRecordCat varchar(500) comment '病程记录类别',
    proRecordDetail varchar(500) comment '病程记录内容',
    txCatCode varchar(100) comment '治疗类别代码',
    emrStatus varchar(100) comment '病历状态：0-待接诊，1-诊疗完毕，2-未接诊，3-接诊后转诊/院，4-挂号错误',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历信息表';

-- 急诊留观病历医嘱详情表：emr_clinic_obs_advice
drop table if exists emr_clinic_obs_advice;
create table emr_clinic_obs_advice(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    startDate datetime comment '医嘱开嘱日期时间',
    stopDate datetime comment '长期医嘱停嘱日期时间',
    execDate datetime comment '医嘱执行日期时间',
    execDateCatCode varchar(100) comment '医嘱执行时间类别代码',
    execCnlDate datetime comment '医嘱取消日期时间',
    adviceCat varchar(100) comment '医嘱类别',
    adviceDetail varchar(500) comment '医嘱内容',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历医嘱详情表';

-- 急诊留观病历过敏史详情表：emr_clinic_obs_allergy
drop table if exists emr_clinic_obs_allergy;
create table emr_clinic_obs_allergy(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    history varchar(500) comment '过敏史',
    allergen varchar(500) comment '过敏原',
    allSx varchar(500) comment '过敏症状',
    allSxCode varchar(100) comment '过敏症状代码',
    allergenCode varchar(100) comment '过敏原代码',
    medicant varchar(500) comment '过敏药物名称',
    statusCode varchar(100) comment '过敏病情状态代码',
    markCode varchar(100) comment '过敏史标识代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历过敏史详情表';

-- 急诊留观病历通信详情表：emr_clinic_obs_communication
drop table if exists emr_clinic_obs_communication;
create table emr_clinic_obs_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历通信详情表';

-- 急诊留观病历诊疗过程详情表：emr_clinic_obs_dxtreatment
drop table if exists emr_clinic_obs_dxtreatment;
create table emr_clinic_obs_dxtreatment(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    dxtxName varchar(100) comment '诊疗过程名称',
    dxtxDesc varchar(500) comment '诊疗过程描述',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历诊疗过程详情表';

-- 急诊留观病历家族史详情表：emr_clinic_obs_family
drop table if exists emr_clinic_obs_family;
create table emr_clinic_obs_family(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    typeName varchar(500) comment '家族史观察项目类目名称',
    result varchar(500) comment '家族史观察结果',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历家族史详情表';

-- 急诊留观病历既往史详情表：emr_clinic_obs_past
drop table if exists emr_clinic_obs_past;
create table emr_clinic_obs_past(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    itemName varchar(100) comment '既往观察-项目名称',
    itemCatCode varchar(100) comment '既往观察-项目分类代码',
    itemCodeName varchar(100) comment '既往观察-项目代码名称',
    itemCode varchar(100) comment '既往观察-项目代码',
    methodCode varchar(100) comment '既往观察-方法代码',
    result varchar(500) comment '既往观察-结果',
    pastTypeName varchar(500) comment '既往史观察项目类目名称',
    pastResult varchar(500) comment '既往史观察结果',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历既往史详情表';

-- 急诊留观病历现病史详情表：emr_clinic_obs_present
drop table if exists emr_clinic_obs_present;
create table emr_clinic_obs_present(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    onsetDate datetime comment '起病时间',
    onsetDesc varchar(500) comment '起病情况描述',
    sxOnsetReason varchar(500) comment '症状开始原因/诱因',
    sxCh varchar(500) comment '症状特点',
    sxAcc varchar(500) comment '伴随症状',
    pastTx varchar(500) comment '本疾病既往诊疗经过',
    baseTx varchar(500) comment '基础疾病诊疗情况',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历现病史详情表';

-- 急诊留观病历治疗详情表：emr_clinic_obs_treatment
drop table if exists emr_clinic_obs_treatment;
create table emr_clinic_obs_treatment(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClObs varchar(100) comment '所属急诊留观病历',
    planCheck varchar(500) comment '拟做的检查',
    txSchPlan varchar(500) comment '今后治疗方案',
    followMark varchar(100) comment '随访标志',
    followInr varchar(100) comment '随访间隔（随诊期限）',
    docAdvice varchar(500) comment '医嘱',
    spRemark varchar(500) comment '特别注意事项',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '急诊留观病历治疗详情表';

-- ==================================================
-- 电子病历功能模块数据表 —— 西医处方
-- ==================================================
-- 西医处方信息表：emr_clinic_wm_rx
drop table if exists emr_clinic_wm_rx;
create table emr_clinic_wm_rx(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrNo varchar(100) comment '病历号',
    clinicNo varchar(100) comment '门诊号',
    docName varchar(100) not null default '西医处方' comment '文档标识-名称',
    docCatCode varchar(100) not null default '03' comment '文档标识-类别代码',
    docAdminOrgName varchar(100) comment '文档标识-管理机构名称',
    docAdminOrgCode varchar(100) comment '文档标识-管理机构组织机构代码（法人代码）',
    docNo varchar(100) comment '文档标识-号码',
    docEffDate datetime comment '文档标识-生效日期',
    docExpDate datetime comment '文档标识-失效日期',
    markCatCode varchar(100) comment '标识号-类别代码',
    markNo varchar(100) comment '标识号-号码',
    markEffDate datetime comment '标识号-生效日期',
    markExpDate datetime comment '标识号-失效日期',
    markOrgName varchar(100) comment '标识号-提供标识的机构名称',
    markObj varchar(100) comment '姓名-标识对象',
    markObjCode varchar(100) comment '姓名-标识对象代码',
    name varchar(100) comment '姓名',
    patientCatCode varchar(100) comment '病人类型代码',
    gender varchar(100) comment '性别代码',
    age int comment '年龄（岁）',
    nationality varchar(100) comment '国籍代码',
    ethnic varchar(100) comment '民族代码',
    marital varchar(100) comment '婚姻状况类别代码',
    occupation varchar(100) comment '职业编码系统名称',
    occCode varchar(100) comment '职业代码',
    education varchar(100) comment '文化程度代码',
    birthday date comment '出生日期',
    birthplace varchar(500) comment '出生地',
    workplace varchar(500) comment '工作单位名称',
    addrCatCode varchar(100) comment '标识地址类别的代码',
    province varchar(100) comment '地址-省（自治区、直辖市）',
    city varchar(100) comment '地址-市（地区）',
    district varchar(100) comment '地址-县（区）',
    subdistrict varchar(100) comment '地址-乡（镇、街道办事处）',
    village varchar(100) comment '地址-村（街、路、弄等）',
    doorNo varchar(100) comment '地址-门牌号码',
    zipcode varchar(100) comment '邮政编码',
    divisionCode varchar(100) comment '行政区划代码',
    treatment varchar(100) comment '医疗待遇名称',
    treatmentCode varchar(100) comment '医疗待遇代码',
    orgName varchar(100) comment '机构名称',
    orgCode varchar(100) comment '机构组织机构代码',
    orgLeader varchar(500) comment '机构负责人（法人）',
    orgAddress varchar(500) comment '机构地址',
    deptName varchar(500) comment '科室名称',
    orgRole varchar(100) comment '机构角色',
    orgRoleCode varchar(100) comment '机构角色代码',
    servName varchar(100) comment '服务者姓名',
    servRole varchar(100) comment '服务者职责（角色）',
    servRoleCode varchar(100) comment '服务者职责（角色）代码',
    servtechTitle varchar(100) comment '服务者专业技术职务',
    servEdu varchar(100) comment '服务者学历',
    servMajor varchar(100) comment '服务者所学专业',
    servTechRank varchar(100) comment '服务者专业技术职务等级',
    servPost varchar(100) comment '服务者职务',
    eventName varchar(500) comment '卫生事件(动作)名称',
    eventCatCode varchar(100) comment '事件分类代码',
    eventStartDate datetime comment '事件开始时间',
    eventAddr varchar(500) comment '事件发生地点',
    eventPart varchar(100) comment '事件参与方',
    eventReason varchar(500) comment '事件发生原因',
    eventResult varchar(500) comment '事件结局',
    obsCat varchar(100) comment '观察-类别',
    obsCatCode varchar(100) comment '观察-类别代码',
    obsItem varchar(100) comment '观察项目名称',
    obsItemCode varchar(100) comment '观察-项目代码',
    obsResultDesc varchar(500) comment '观察-结果描述',
    dxOrgName varchar(100) comment '诊断机构名称',
    dxDate datetime comment '诊断日期',
    dxCat varchar(100) comment '诊断类别',
    dxCatCode varchar(100) comment '诊断类别代码',
    dxCisCode varchar(100) comment '诊断顺位（从属关系）代码',
    disease varchar(500) comment '疾病名称',
    diseaseCode varchar(100) comment '疾病代码',
    dxAccording varchar(500) comment '诊断依据',
    dxAccordingCode varchar(100) comment '诊断依据代码',
    txProcName varchar(500) comment '诊疗过程名称',
    txProcDesc varchar(500) comment '诊疗过程描述',
    emrStatus varchar(100) comment '病历状态：0-待接诊，1-诊疗完毕，2-未接诊，3-接诊后转诊/院，4-挂号错误',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '西医处方信息表';

-- 西医处方通信详情表：emr_clinic_wm_rx_communication
drop table if exists emr_clinic_wm_rx_communication;
create table emr_clinic_wm_rx_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClRx varchar(100) comment '门（急）诊西医处方',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '西医处方通信详情表';

-- 西医处方联系人详情表：emr_clinic_wm_rx_liaison
drop table if exists emr_clinic_wm_rx_liaison;
create table emr_clinic_wm_rx_liaison(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClRx varchar(100) comment '门（急）诊西医处方',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '西医处方联系人详情表';

-- 西医处方医保详情表：emr_clinic_wm_rx_insurance
drop table if exists emr_clinic_wm_rx_insurance;
create table emr_clinic_wm_rx_insurance(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClRx varchar(100) comment '门（急）诊西医处方',
    insCat varchar(100) comment '医疗保险-类别',
    insCatCode varchar(100) comment '医疗保险-类别代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '西医处方医保详情表';

-- 西医处方用药详情表：emr_clinic_wm_rx_medication
drop table if exists emr_clinic_wm_rx_medication;
create table emr_clinic_wm_rx_medication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrClRx varchar(100) comment '门（急）诊西医处方',
    medUsage varchar(100) comment '药物用法',
    usageRate varchar(100) comment '药物使用-频率',
    medUnit varchar(100) comment '药物使用-剂量单位',
    perDosage decimal(10, 2) comment '药物使用-次剂量',
    totalDosage decimal(10, 2) comment '药物使用-总剂量',
    wayCode varchar(100) comment '药物使用-途径代码',
    medName varchar(100) comment '药物名称',
    dosageForm varchar(100) comment '药物剂型代码',
    medCat varchar(100) comment '药物类型',
    medNameCode varchar(100) comment '药物名称代码',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '西医处方用药详情表';

-- ==================================================
-- 电子病历功能模块数据表 —— 转诊（院）记录信息
-- ==================================================
-- 转诊（院）记录信息表：emr_referral
drop table if exists emr_referral;
create table emr_referral(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrNo varchar(100) comment '病历号',
    clinicNo varchar(100) comment '门诊号',
    docName varchar(100) comment '文档标识-名称',
    docCatCode varchar(100) comment '文档标识-类别代码',
    docAdminOrgName varchar(100) comment '文档标识-管理机构名称',
    docAdminOrgCode varchar(100) comment '文档标识-管理机构组织机构代码（法人代码）',
    docNo varchar(100) comment '文档标识-号码',
    docEffDate datetime comment '文档标识-生效日期',
    docExpDate datetime comment '文档标识-失效日期',
    markCatCode varchar(100) comment '标识号-类别代码',
    markNo varchar(100) comment '标识号-号码',
    markEffDate datetime comment '标识号-生效日期',
    markExpDate datetime comment '标识号-失效日期',
    markOrgName varchar(100) comment '标识号-提供标识的机构名称',
    markObj varchar(100) comment '姓名-标识对象',
    markObjCode varchar(100) comment '姓名-标识对象代码',
    name varchar(100) comment '姓名',
    patientCatCode varchar(100) comment '病人类型代码',
    gender varchar(100) comment '性别代码',
    age int comment '年龄（岁）',
    nationality varchar(100) comment '国籍代码',
    ethnic varchar(100) comment '民族代码',
    marital varchar(100) comment '婚姻状况类别代码',
    occupation varchar(100) comment '职业编码系统名称',
    occCode varchar(100) comment '职业代码',
    education varchar(100) comment '文化程度代码',
    birthday date comment '出生日期',
    birthplace varchar(500) comment '出生地',
    workplace varchar(500) comment '工作单位名称',
    addrCatCode varchar(100) comment '标识地址类别的代码',
    province varchar(100) comment '地址-省（自治区、直辖市）',
    city varchar(100) comment '地址-市（地区）',
    district varchar(100) comment '地址-县（区）',
    subdistrict varchar(100) comment '地址-乡（镇、街道办事处）',
    village varchar(100) comment '地址-村（街、路、弄等）',
    doorNo varchar(100) comment '地址-门牌号码',
    zipcode varchar(100) comment '邮政编码',
    divisionCode varchar(100) comment '行政区划代码',
    eventName varchar(500) comment '卫生事件(动作)名称',
    eventStartDate datetime comment '事件开始时间',
    eventEndDate datetime comment '事件结束时间',
    eventAddr varchar(500) comment '事件发生地点',
    eventReason varchar(500) comment '事件发生原因',
    obsCat varchar(100) comment '观察-类别',
    obsCatCode varchar(100) comment '观察-类别代码',
    obsItem varchar(100) comment '观察项目名称',
    obsItemCode varchar(100) comment '观察-项目代码',
    obsResultDesc varchar(500) comment '观察-结果描述',
    dxOrgName varchar(100) comment '诊断机构名称',
    dxDate datetime comment '诊断日期',
    dxCat varchar(100) comment '诊断类别',
    dxCatCode varchar(100) comment '诊断类别代码',
    dxCisCode varchar(100) comment '诊断顺位（从属关系）代码',
    disease varchar(500) comment '疾病名称',
    diseaseCode varchar(100) comment '疾病代码',
    dxAccording varchar(500) comment '诊断依据',
    dxAccordingCode varchar(100) comment '诊断依据代码',
    txProcName varchar(500) comment '诊疗过程名称',
    txProcDesc varchar(500) comment '诊疗过程描述',
    emrStatus varchar(100) comment '病历状态：0-待接诊，1-诊疗完毕，2-未接诊，3-接诊后转诊/院，4-挂号错误',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '转诊（院）记录信息表';

-- 转诊（院）记录医院详情表：emr_referral_hospital
drop table if exists emr_referral_hospital;
create table emr_referral_hospital(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrReferral varchar(100) comment '所属转诊（院）记录',
    orgName varchar(100) comment '机构名称',
    orgCode varchar(100) comment '机构组织机构代码',
    orgLeader varchar(500) comment '机构负责人（法人）',
    orgAddr varchar(500) comment '机构地址',
    deptName varchar(500) comment '科室名称',
    orgRole varchar(100) comment '机构角色',
    orgRoleCode varchar(100) comment '机构角色代码',
    servName varchar(100) comment '服务者姓名',
    servRole varchar(100) comment '服务者职责（角色）',
    servRoleCode varchar(100) comment '服务者职责（角色）代码',
    servtechTitle varchar(100) comment '服务者专业技术职务',
    servEdu varchar(100) comment '服务者学历',
    servMajor varchar(100) comment '服务者所学专业',
    servTechRank varchar(100) comment '服务者专业技术职务等级',
    servPost varchar(100) comment '服务者职务',
    referralMark varchar(10) comment '转入转出标记：0-转出，1-转入',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '转诊（院）记录医院详情表';

-- 转诊（院）记录通信详情表：emr_referral_communication
drop table if exists emr_referral_communication;
create table emr_referral_communication(
    id varchar(100) not null comment '主键，使用雪花算法生成唯一主键',
    emrReferral varchar(100) comment '所属转诊（院）记录',
    phoneCat varchar(100) comment '联系电话-类别',
    phoneCatCode varchar(100) comment '联系电话-类别代码',
    phoneNo varchar(100) comment '联系电话-号码',
    email varchar(500) comment '电子邮件地址',
    status varchar(10) not null default '1' comment '系统状态，1-启用，0-禁用',
    createdBy varchar(100) comment '创建人',
    createTime timestamp not null default current_timestamp comment '创建时间',
    modifiedBy varchar(100) comment '修改人',
    modifiedTime timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
    primary key(id)
)Engine=InnoDB charset=utf8mb4 comment '转诊（院）记录通信详情表';
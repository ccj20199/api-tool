/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2020-07-27 10:00:35                          */
/*==============================================================*/

if exists (select 1
            from  sysobjects
           where  id = object_id('API_CHANGE_LOG')
            and   type = 'U')
   drop table API_CHANGE_LOG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('API_INFORMATION_DETAIL')
            and   type = 'U')
   drop table API_INFORMATION_DETAIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('API_INFORMATION_DETAIL_UPDATE')
            and   type = 'U')
   drop table API_INFORMATION_DETAIL_UPDATE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('API_PARAMETER_INFORMATION')
            and   type = 'U')
   drop table API_PARAMETER_INFORMATION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('API_PARAMETER_INFORMATION_UPDATE')
            and   type = 'U')
   drop table API_PARAMETER_INFORMATION_UPDATE
go


if exists (select 1
            from  sysobjects
           where  id = object_id('BUSINESS_DOMAIN_INFORMATION')
            and   type = 'U')
   drop table BUSINESS_DOMAIN_INFORMATION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CODE_REPOSITORY_GROUP')
            and   type = 'U')
   drop table CODE_REPOSITORY_GROUP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CODE_REPOSITORY_INFORMATION')
            and   type = 'U')
   drop table CODE_REPOSITORY_INFORMATION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SYS_DICT_DATA')
            and   type = 'U')
   drop table SYS_DICT_DATA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SYS_DICT_TYPE')
            and   type = 'U')
   drop table SYS_DICT_TYPE
go

/*==============================================================*/
/* Table: API_CHANGE_LOG                                        */
/*==============================================================*/
create table API_CHANGE_LOG (
   API_CHANGE_ID        numeric(19,0)        not null,
   API_CHANGE_REASON    varchar(256)         not null,
   API_CHANGE_AT        datetime             not null,
   API_CHANGE_BY        varchar(16)          not null,
   constraint PK_API_CHANGE_LOG primary key (API_CHANGE_ID)
)
go
 
/*==============================================================*/
/* Table: API_INFORMATION_DETAIL                                */
/*==============================================================*/
create table API_INFORMATION_DETAIL (
   API_ID               numeric(19,0)        not null,
   GROUP_ID             numeric(19,0)        not null,
   API_NO               varchar(16)          null,
   API_NAME             varchar(128)          not null,
   API_URL              varchar(512)         not null,
   API_STATUS_CODE      numeric(19,0)        not null,
   REQUEST_METHOD_CODE  numeric(19,0)        not null,
   API_DESCRIPTION      varchar(256)         not null,
   BUSINESS_RULE        text                 not null,
   ALLOW_PAGE_CODE   numeric(19,0)        not null,
   CREATE_BY            varchar(16)          not null,
   CREATE_AT            datetime             not null,
   MODIFIED_AT          datetime             not null,
   MEMO              varchar(1024)        null,
   IS_DEL               int                  not null,
   CHECK_OUT_BY         varchar(16)          not null,
   CHECK_OUT_AT         datetime             not null,
   constraint PK_API_INFORMATION_DETAIL primary key (API_ID)
)
go

/*==============================================================*/
/* Table: API_INFORMATION_DETAIL_UPDATE                         */
/*==============================================================*/
create table API_INFORMATION_DETAIL_UPDATE (
   API_UPDATE_ID        numeric(19,0)             not null,
   API_CHANGE_ID        numeric(19,0)        null,
   GROUP_ID             numeric(19,0)        not null,
   API_ID               numeric(19,0)        null,
   API_NO               varchar(16)          null,
   API_NAME             varchar(128)          not null,
   API_URL              varchar(512)         not null,
   API_STATUS_CODE      numeric(19,0)        not null,
   REQUEST_METHOD_CODE  numeric(19,0)        not null,
   API_DESCRIPTION      varchar(256)         not null,
   BUSINESS_RULE        text                 not null,
   ALLOW_PAGE_CODE   numeric(19,0)        not null,
   CREATE_BY            varchar(16)          not null,
   CREATE_AT            datetime             not null,
   MODIFIED_AT          datetime             not null,
   MEMO              varchar(1024)        null,
   IS_DEL               int                  not null,
   HANG_UP_STATUS_CODE  numeric(19,0)        not null,
   CHECK_IN_AT          datetime             null,
   constraint PK_API_INFORMATION_DETAIL_UPDA primary key (API_UPDATE_ID)
)
go

/*==============================================================*/
/* Table: API_PARAMETER_INFORMATION                             */
/*==============================================================*/
create table API_PARAMETER_INFORMATION (
   API_PARAMETER_ID     numeric(19,0)        not null,
   API_ID               numeric(19,0)        not null,
   PARAMETER_NO         varchar(128)         not null,
   PARAMETER_NAME       varchar(128)         not null,
   PARAMETER_TYPE_CODE  numeric(19,0)        not null,
   DATA_TYPE_CODE       numeric(19,0)        not null,
   REQUIRED_CODE        numeric(19,0)        not null,
   DEFAULT_VALUE        varchar(128)         null,
   MEMO              varchar(1024)        null,
   PARENT_PARAMETER_ID  numeric(19,0)        not null,
   constraint PK_API_PARAMETER_INFORMATION primary key (API_PARAMETER_ID)
)
go

/*==============================================================*/
/* Table: API_PARAMETER_INFORMATION_UPDATE                      */
/*==============================================================*/
create table API_PARAMETER_INFORMATION_UPDATE (
   API_PARAMETER_ID     numeric(19,0)        not null,
   API_UPDATE_ID        numeric(19,0)             not null,
   API_ID               numeric(19,0)        null,
   PARAMETER_NO         varchar(128)         not null,
   PARAMETER_NAME       varchar(128)         not null,
   PARAMETER_TYPE_CODE  numeric(19,0)        not null,
   DATA_TYPE_CODE       numeric(19,0)        not null,
   REQUIRED_CODE        numeric(19,0)        not null,
   DEFAULT_VALUE        varchar(128)         null,
   MEMO              varchar(1024)        null,
   PARENT_PARAMETER_ID  numeric(19,0)        not null,
   constraint PK_API_PARAMETER_INFORMATION_U primary key (API_PARAMETER_ID)
)
go

/*==============================================================*/
/* Table: BUSINESS_DOMAIN_INFORMATION                           */
/*==============================================================*/
create table BUSINESS_DOMAIN_INFORMATION (
   BUSINESS_DOMAIN_ID   numeric(19,0)        not null,
   BUSINESS_DOMAIN_REPOSITORY_NO varchar(16)          not null,
   BUSINESS_DOMAIN_NAME varchar(128)         not null,
   BUSINESS_DOMAIN_KEY_WORD		VARCHAR(16)			 NOT NULL,
   BUSINESS_DOMAIN_GROUP_NAME varchar(128)          null,
   constraint PK_BUSINESS_DOMAIN_INFORMATION primary key (BUSINESS_DOMAIN_ID)
)
GO

/*==============================================================*/
/* Table: CODE_REPOSITORY_GROUP                                 */
/*==============================================================*/
create table CODE_REPOSITORY_GROUP (
   GROUP_ID             numeric(19,0)        not null,
   CODE_REPOSITORY_ID   numeric(19,0)        not null,
   GROUP_NAME           varchar(128)         not null,
   PARENT_GROUP_ID      numeric(19,0)        null,
   IS_DEL               int                  not null,
   constraint PK_CODE_REPOSITORY_GROUP primary key (GROUP_ID)
)
go

/*==============================================================*/
/* Table: CODE_REPOSITORY_INFORMATION                           */
/*==============================================================*/
create table CODE_REPOSITORY_INFORMATION (
   CODE_REPOSITORY_ID   numeric(19,0)        not null,
   BUSINESS_DOMAIN_ID   numeric(19,0)        not null,
   REPOSITORY_ARCHITECT_TYPE_CODE numeric(19,0)        not null,
   --REPOSITORY_BUSINESS_TYPE_CODE numeric(19,0)        not null,不需要业务架构类别
   REPOSITORY_NAME      varchar(128)         not null,
   APP_NAME             varchar(64)          not null,
   APP_ID               bigint               not null,
   EXCEPTION_CLASS_NO   bigint               not null,
   DEFAULT_PORT         bigint               not null,
   INTERFACE_BASE_PATH  varchar(256)         null,
   REPOSITORY_STATUS_CODE numeric(19,0)        not null,
   CREATE_BY            varchar(16)          not null,
   CREATE_AT            datetime             not null,
   MODIFIED_AT          datetime             not null,
   MEMO              varchar(1024)        null,
   CURR_API_NO          varchar(128)         not null,
   constraint PK_CODE_REPOSITORY_INFORMATION primary key (CODE_REPOSITORY_ID)
)
GO

if not exists(select 1 from sysindexes where name ='IDX_CODE_REPOSITORY_INFORMATION_APP_ID')
	create unique index IDX_CODE_REPOSITORY_INFORMATION_APP_ID on CODE_REPOSITORY_INFORMATION(APP_ID)
go

/*==============================================================*/
/* Table: SYS_DICT_DATA                                         */
/*==============================================================*/
create table SYS_DICT_DATA (
   DICT_DATA_ID         numeric(19,0)        not null,
   DICT_ID              numeric(19,0)        not null,
   DICT_DATA_DESC       varchar(256)         not null,
   DICT_DATA_SORT       int                  not null,
   IS_DEFAULT           int                  not null,
   STATUS               int                  not null,
   CREATE_BY            varchar(16)          not null,
   CREATE_AT            datetime             not null,
   MODIFIED_AT          datetime             not null,
   DICT_KEY_WORD		VARCHAR(16)			 NULL,
   constraint PK_SYS_DICT_DATA primary key (DICT_DATA_ID)
)
go

/*==============================================================*/
/* Table: SYS_DICT_TYPE                                         */
/*==============================================================*/
create table SYS_DICT_TYPE (
   DICT_ID              numeric(19,0)        not null,
   DICT_NAME            varchar(256)         not null,
   STATUS               int                  not null,
   CREATE_BY            varchar(16)          not null,
   CREATE_AT            datetime             not null,
   MODIFIED_AT          datetime             not null,
   MEMO              varchar(1024)        null,
   constraint PK_SYS_DICT_TYPE primary key (DICT_ID)
)
GO


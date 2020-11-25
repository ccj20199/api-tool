------------------------------------------------域信息
DELETE FROM BUSINESS_DOMAIN_INFORMATION

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD
        )
VALUES  ( 1 , -- BUSINESS_DOMAIN_ID - numeric
          '00' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '主数据'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'mdm'
        )
INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD,
		  BUSINESS_DOMAIN_GROUP_NAME
        )
VALUES  ( 2 , -- BUSINESS_DOMAIN_ID - numeric
          '10' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '物品域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'material'
		  ,'物品组'
        )
INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD
        )

VALUES  ( 3 , -- BUSINESS_DOMAIN_ID - numeric
          '11' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '临床域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'material'
        )

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD,
		  BUSINESS_DOMAIN_GROUP_NAME
        )
VALUES  ( 4 , -- BUSINESS_DOMAIN_ID - numeric
          '12' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '费用域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'finance'
		  ,'费用组'
        )

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD
        )
VALUES  ( 5 , -- BUSINESS_DOMAIN_ID - numeric
          '13' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '执行域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'execution'
        )

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD,
		  BUSINESS_DOMAIN_GROUP_NAME
        )
VALUES  ( 6 , -- BUSINESS_DOMAIN_ID - numeric
          '14' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '患者域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'person'
		  ,'患者组'
        )

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD,
		  BUSINESS_DOMAIN_GROUP_NAME
        )
VALUES  ( 7 , -- BUSINESS_DOMAIN_ID - numeric
          '15' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '就诊域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'encounter'
		  ,'就诊组'
        )

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD
        )
VALUES  ( 8 , -- BUSINESS_DOMAIN_ID - numeric
          '16' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '记录域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'encounter'
        )

INSERT INTO dbo.BUSINESS_DOMAIN_INFORMATION
        ( BUSINESS_DOMAIN_ID ,
          BUSINESS_DOMAIN_REPOSITORY_NO ,
          BUSINESS_DOMAIN_NAME,
		  BUSINESS_DOMAIN_KEY_WORD
        )
VALUES  ( 9 , -- BUSINESS_DOMAIN_ID - numeric
          '17' , -- BUSINESS_DOMAIN_REPOSITORY_NO - varchar(16)
          '知识域'  -- BUSINESS_DOMAIN_NAME - varchar(128)
		  ,'knowledge'
        )



DELETE FROM SYS_DICT_TYPE
DELETE FROM SYS_DICT_DATA
------------------------------------------------------------------------------------仓库架构类别代码

INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 1 , -- DICT_ID - numeric
          '仓库架构类别代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT,
		  DICT_KEY_WORD
        )
VALUES  ( 1 , -- DICT_DATA_ID - numeric
          1 , -- DICT_ID - numeric
          '主数据中台' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
		  ,'mds'
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT,
		  DICT_KEY_WORD
        )
VALUES  ( 2 , -- DICT_DATA_ID - numeric
          1 , -- DICT_ID - numeric
          '业务中台' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
		  ,'bmts'
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT,
		  DICT_KEY_WORD
        )
VALUES  ( 3 , -- DICT_DATA_ID - numeric
          1 , -- DICT_ID - numeric
          '聚合中台' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
		  ,'amts'
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT,
		  DICT_KEY_WORD
        )
VALUES  ( 4 , -- DICT_DATA_ID - numeric
          1 , -- DICT_ID - numeric
          '前台' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
		  ,'bas'
        )

------------------------------------------------------------仓库业务类别代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 2 , -- DICT_ID - numeric
          '仓库业务类别代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 5 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '主数据' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 6 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '票据' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 7 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '门诊费用' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 8 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '账户' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 9 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '住院费用' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 10 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '医保' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 11 , -- DICT_DATA_ID - numeric
          2 , -- DICT_ID - numeric
          '公共' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------仓库状态代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 3 , -- DICT_ID - numeric
          '仓库状态代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 12 , -- DICT_DATA_ID - numeric
          3 , -- DICT_ID - numeric
          '有效' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 13,  -- DICT_DATA_ID - numeric
          3 , -- DICT_ID - numeric
          '作废' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------API状态代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 4 , -- DICT_ID - numeric
          'API状态代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 14 , -- DICT_DATA_ID - numeric
          4 , -- DICT_ID - numeric
          '设计中' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 15 , -- DICT_DATA_ID - numeric
          4 , -- DICT_ID - numeric
          '已设计' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 16 , -- DICT_DATA_ID - numeric
          4 , -- DICT_ID - numeric
          '开发中' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 17 , -- DICT_DATA_ID - numeric
          4 , -- DICT_ID - numeric
          '开发完成' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------请求方式代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 5 , -- DICT_ID - numeric
          '请求方式代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 18 , -- DICT_DATA_ID - numeric
          5 , -- DICT_ID - numeric
          'POST' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 19 , -- DICT_DATA_ID - numeric
          5 , -- DICT_ID - numeric
          'GET' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 20 , -- DICT_DATA_ID - numeric
          5 , -- DICT_ID - numeric
          'PUT' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 21 , -- DICT_DATA_ID - numeric
          5 , -- DICT_ID - numeric
          'DELETE' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------是否分页代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 6 , -- DICT_ID - numeric
          '是否分页代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 22 , -- DICT_DATA_ID - numeric
          6 , -- DICT_ID - numeric
          '是' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 23 , -- DICT_DATA_ID - numeric
          6 , -- DICT_ID - numeric
          '否' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------挂起状态代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 7 , -- DICT_ID - numeric
          '挂起状态代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 24 , -- DICT_DATA_ID - numeric
          7 , -- DICT_ID - numeric
          '新建中' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 25 , -- DICT_DATA_ID - numeric
          7 , -- DICT_ID - numeric
          '签出中' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 26 , -- DICT_DATA_ID - numeric
          7 , -- DICT_ID - numeric
          '已签入' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 27 , -- DICT_DATA_ID - numeric
          7 , -- DICT_ID - numeric
          '已撤销' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------参数类型代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 8 , -- DICT_ID - numeric
          '参数类型代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 28 , -- DICT_DATA_ID - numeric
          8 , -- DICT_ID - numeric
          '入参' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 29 , -- DICT_DATA_ID - numeric
          8 , -- DICT_ID - numeric
          '出参' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------数据类型代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 9 , -- DICT_ID - numeric
          '数据类型代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 30 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'Long' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 31 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'String' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
		
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 32 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'Date' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 33 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'List' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 34 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'Long[]' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 35 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'List<Long>' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 36 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'BigDecimal' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 37 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'Integer' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 38 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'Object' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 39 , -- DICT_DATA_ID - numeric
          9 , -- DICT_ID - numeric
          'Boolean' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------是否必填代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 10 , -- DICT_ID - numeric
          '是否必填代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 40 , -- DICT_DATA_ID - numeric
          10 , -- DICT_ID - numeric
          '非必须' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 41 , -- DICT_DATA_ID - numeric
          10 , -- DICT_ID - numeric
          '必须' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

--------------------API状态代码补充值集
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 42 , -- DICT_DATA_ID - numeric
          4 , -- DICT_ID - numeric
          '已验收' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 43 , -- DICT_DATA_ID - numeric
          4 , -- DICT_ID - numeric
          '已废弃' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

----------------------------------------------------------------API动作代码
INSERT INTO dbo.SYS_DICT_TYPE
        ( DICT_ID ,
          DICT_NAME ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT ,
          MEMO
        )
VALUES  ( 11 , -- DICT_ID - numeric
          'API动作代码' , -- DICT_NAME - varchar(256)
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE() , -- MODIFIED_AT - datetime
          ''  -- MEMO - varchar(1024)
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 44 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'query' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 45 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'get' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )

INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 46 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'count' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 47 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'search' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 48 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'validate' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 49 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'add' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 50 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'update' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 51 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'save' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 52 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'delete' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 53 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'sync' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 54 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'submit' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 55 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'cancel' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 56 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'check' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 57 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'uncheck' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 58 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'enable' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 59 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'disable' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 60 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'signoff' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 61 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'charge' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 62 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'publish' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 63 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'import' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 64 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'export' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 65 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'set' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 66 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'cache' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 67 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'duplicate' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )
INSERT INTO dbo.SYS_DICT_DATA
        ( DICT_DATA_ID ,
          DICT_ID ,
          DICT_DATA_DESC ,
          DICT_DATA_SORT ,
          IS_DEFAULT ,
          STATUS ,
          CREATE_BY ,
          CREATE_AT ,
          MODIFIED_AT
        )
VALUES  ( 68 , -- DICT_DATA_ID - numeric
          11 , -- DICT_ID - numeric
          'clone' , -- DICT_DATA_DESC - varchar(256)
          0 , -- DICT_DATA_SORT - int
          0 , -- IS_DEFAULT - int
          0 , -- STATUS - int
          '5247' , -- CREATE_BY - varchar(16)
          GETDATE() , -- CREATE_AT - datetime
          GETDATE()  -- MODIFIED_AT - datetime
        )



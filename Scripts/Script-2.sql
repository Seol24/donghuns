-- 거래처 영업 관리 프로그램
DROP SCHEMA IF EXISTS donghun2;

-- 거래처 영업 관리 프로그램
CREATE SCHEMA donghun2;

-- 사원관리
CREATE TABLE donghun2.employee (
	code       VARCHAR(4)  NOT NULL COMMENT '사원코드', -- 사원코드
	name       VARCHAR(12) NOT NULL COMMENT '사원명', -- 사원명
	grade      VARCHAR(1)  NOT NULL COMMENT '사원등급', -- 사원등급
	discntRate INT         NOT NULL COMMENT '할인율' -- 할인율
)
COMMENT '사원관리';

drop table customer;
drop table employee;
drop table product;
drop table saleinfo;

-- 사원관리
ALTER TABLE donghun2.employee
	ADD CONSTRAINT PK_employee
		PRIMARY KEY (code);

-- 제품관리
CREATE TABLE donghun2.product (
	code       VARCHAR(4)  NOT NULL COMMENT '제품코드', -- 제품코드
	name       VARCHAR(12) NOT NULL COMMENT '제품명', -- 제품명
	salePrice  INT         NOT NULL COMMENT '판매정가', -- 판매정가
	origiPrice INT         NOT NULL COMMENT '판매원가' -- 판매원가
)
COMMENT '제품관리';

-- 제품관리
ALTER TABLE donghun2.product
	ADD CONSTRAINT PK_product
		PRIMARY KEY (code);

-- 거래처
CREATE TABLE donghun2.customer (
	code       VARCHAR(4)  NOT NULL COMMENT '거래처코드', -- 거래처코드
	name       VARCHAR(12) NOT NULL COMMENT '거래처명', -- 거래처명
	grade      VARCHAR(1)  NOT NULL COMMENT '거래처등급', -- 거래처등급
	discntRate INT         NOT NULL COMMENT '할인율' -- 할인율
)
COMMENT '거래처';

-- 거래처
ALTER TABLE donghun2.customer
	ADD CONSTRAINT PK_customer
		PRIMARY KEY (code);

-- 거래내역
CREATE TABLE donghun2.saleInfo (
	ecode     VARCHAR(4) NOT NULL COMMENT '사원코드',
	ccode     VARCHAR(4) NOT NULL COMMENT '거래처코드',
	pcode     VARCHAR(4) NOT NULL COMMENT '제품코드',
	quantity  INT        NOT NULL COMMENT '판매수량',
	unitPrice INT        NOT NULL COMMENT '판매단가',
	Date      DATE       NOT NULL COMMENT '거래일자',
	disPrice  INT        NOT NULL COMMENT '할인금액',
	sellPrice INT        NOT NULL COMMENT '판매금액'
)
COMMENT '거래내역';

-- 거래내역
ALTER TABLE donghun2.saleInfo
	ADD CONSTRAINT FK_employee_TO_saleInfo	FOREIGN KEY (ecode)
		REFERENCES donghun2.employee (code);

-- 거래내역
ALTER TABLE donghun2.saleInfo
	ADD CONSTRAINT FK_customer_TO_saleInfo
		FOREIGN KEY (ccode)
		REFERENCES donghun2.customer (code);

-- 거래내역
ALTER TABLE donghun2.saleInfo
	ADD CONSTRAINT FK_product_TO_saleInfo FOREIGN KEY (pcode
	)
		REFERENCES donghun2.product ( -- 제품관리
			code -- 제품코드
		);
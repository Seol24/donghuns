-- 거래처 영업 관리 프로그램

DROP SCHEMA IF EXISTS donghuns;

-- 거래처 영업 관리 프로그램
CREATE SCHEMA donghuns;

-- drop table customer;
-- drop table employee;
-- drop table product;
-- drop table saleinfo;

-- 사원관리
CREATE TABLE donghuns.employee (
	code       VARCHAR(4)  NOT NULL COMMENT '사원코드', -- 사원코드
	name       VARCHAR(12) NOT NULL COMMENT '사원명', -- 사원명
	class      VARCHAR(1)  NOT NULL COMMENT '사원등급', -- 사원등급
	discntRate INT         NOT NULL COMMENT '할인율' -- 할인율
)
COMMENT '사원관리';

-- 사원관리
ALTER TABLE donghuns.employee
	ADD CONSTRAINT PK_employee -- 사원관리 기본키
		PRIMARY KEY (
			code -- 사원코드
		);

-- 제품관리
CREATE TABLE donghuns.product (
	code       VARCHAR(4)  NOT NULL COMMENT '제품코드', -- 제품코드
	name       VARCHAR(12) NOT NULL COMMENT '제품명', -- 제품명
	salePrice  INT         NOT NULL COMMENT '판매정가', -- 판매정가
	origiPrice INT         NOT NULL COMMENT '판매원가' -- 판매원가
)
COMMENT '제품관리';

-- 제품관리
ALTER TABLE donghuns.product
	ADD CONSTRAINT PK_product -- 제품관리 기본키
		PRIMARY KEY (
			code -- 제품코드
		);

-- 거래처
CREATE TABLE donghuns.customer (
	code       VARCHAR(4)  NOT NULL COMMENT '거래처코드', -- 거래처코드
	name       VARCHAR(12) NOT NULL COMMENT '거래처명', -- 거래처명
	class      VARCHAR(1)  NOT NULL COMMENT '거래처등급', -- 거래처등급
	discntRate INT         NOT NULL COMMENT '할인율' -- 할인율
)
COMMENT '거래처';

-- 거래처
ALTER TABLE donghuns.customer
	ADD CONSTRAINT PK_customer -- 거래처 기본키
		PRIMARY KEY (
			code -- 거래처코드
		);

-- 거래내역
CREATE TABLE donghuns.saleInfo (
	ecode     VARCHAR(4) NOT NULL COMMENT '사원코드', -- 사원코드
	ccode     VARCHAR(4) NOT NULL COMMENT '거래처코드', -- 거래처코드
	pcode     VARCHAR(4) NOT NULL COMMENT '제품코드', -- 제품코드
	quantity  INT        NOT NULL COMMENT '판매수량', -- 판매수량
	unitPrice INT        NOT NULL COMMENT '판매단가', -- 판매단가
	Date      DATE       NOT NULL COMMENT '거래일자', -- 거래일자
	disPrice  INT        NOT NULL COMMENT '할인금액', -- 할인금액
	sellPrice INT        NOT NULL COMMENT '판매금액' -- 판매금액
)
COMMENT '거래내역';

-- 거래내역
ALTER TABLE donghuns.saleInfo
	ADD CONSTRAINT FK_employee_TO_saleInfo -- 사원관리 -> 거래내역
		FOREIGN KEY (
			ecode -- 사원코드
		)
		REFERENCES donghuns.employee ( -- 사원관리
			code -- 사원코드
		);

-- 거래내역
ALTER TABLE donghuns.saleInfo
	ADD CONSTRAINT FK_customer_TO_saleInfo -- 거래처 -> 거래내역
		FOREIGN KEY (
			ccode -- 거래처코드
		)
		REFERENCES donghuns.customer ( -- 거래처
			code -- 거래처코드
		);

-- 거래내역
ALTER TABLE donghuns.saleInfo
	ADD CONSTRAINT FK_product_TO_saleInfo -- 제품관리 -> 거래내역
		FOREIGN KEY (
			pcode -- 제품코드
		)
		REFERENCES donghuns.product ( -- 제품관리
			code -- 제품코드
		);
-- 거래처 영업 관리 프로그램
DROP SCHEMA IF EXISTS donghun2;

-- 거래처 영업 관리 프로그램
CREATE SCHEMA donghun2;

-- 영업사원
CREATE TABLE donghun2.Employee (
	code       VARCHAR(4)  NOT NULL COMMENT '사원코드',
	name       VARCHAR(12) NOT NULL COMMENT '사원명',
	class      VARCHAR(1)  NOT NULL COMMENT '사원등급',
	discntRate INTEGER     NOT NULL COMMENT '할인율'
)
COMMENT '영업사원';

-- 영업사원
ALTER TABLE donghun2.Employee
	ADD CONSTRAINT PK_Employee
		PRIMARY KEY (code);

-- 제품
CREATE TABLE donghun2.Product (
	code       VARCHAR(4)  NOT NULL COMMENT '제품코드',
	name       VARCHAR(12) NOT NULL COMMENT '제품명',
	salePrice  INTEGER     NOT NULL COMMENT '판매정가',
	origiPrice INTEGER     NOT NULL COMMENT '판매원가'
)
COMMENT '제품';

-- 제품
ALTER TABLE donghun2.Product
	ADD CONSTRAINT PK_Product
		PRIMARY KEY (code);

-- 거래처
CREATE TABLE donghun2.Customer (
	code  VARCHAR(4)  NOT NULL COMMENT '거래처코드',
	name  VARCHAR(12) NOT NULL COMMENT '거래처명',
	class INTEGER     NOT NULL COMMENT '거래처등급'
)
COMMENT '거래처';

-- 거래처
ALTER TABLE donghun2.Customer
	ADD CONSTRAINT PK_Customer
		PRIMARY KEY (code);

-- 거래내역
CREATE TABLE donghun2.SaleInfo (
	ecode     VARCHAR(4) NOT NULL COMMENT '사원코드',
	ccode     VARCHAR(4) NOT NULL COMMENT '거래처코드',
	pcode     VARCHAR(4) NOT NULL COMMENT '제품코드',
	quantity  INTEGER    NOT NULL COMMENT '판매수량',
	unitPrice INTEGER    NOT NULL COMMENT '판매단가',
	saleDate  INTEGER    NOT NULL COMMENT '거래일자' 
)
COMMENT '거래내역';

-- 거래내역
ALTER TABLE donghun2.SaleInfo
	ADD CONSTRAINT FK_Employee_TO_SaleInfo 
		FOREIGN KEY ()REFERENCES donghun2.Employee (code);

-- 거래내역
ALTER TABLE donghun2.SaleInfo
	ADD CONSTRAINT FK_Customer_TO_SaleInfo
		FOREIGN KEY (ccode)REFERENCES donghun2.Customer (code);

-- 거래내역
ALTER TABLE donghun2.SaleInfo
	ADD CONSTRAINT FK_Product_TO_SaleInfo
		FOREIGN KEY (pcode)
		REFERENCES donghun2.Product (code);
  CREATE TABLE "TEACHER_ENTITY" 
   (	"EMAIL" VARCHAR2(30), 
	"U_PASSWORD" VARCHAR2(30) NOT NULL ENABLE, 
	"U_ROLE" VARCHAR2(10) NOT NULL ENABLE, 
	"U_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"FINE_RATE" NUMBER(18,2), 
	"TOTAL_DAYS" NUMBER(*,0) NOT NULL ENABLE, 
	"BOOK_LIMIT" NUMBER DEFAULT 5 NOT NULL ENABLE, 
	"TOTAL_ISSUED" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	 CHECK (u_role IN ('Student', 'Teacher', 'Admin')) ENABLE, 
	 CHECK ( total_days = 14) ENABLE, 
	 CHECK (fine_rate = 0.03) ENABLE, 
	 PRIMARY KEY ("EMAIL")
  USING INDEX  ENABLE, 
	 CONSTRAINT "TEACHER_ENTITY_CON" CHECK ( "EMAIL" IS NOT NULL ) ENABLE
   ) ;

  ALTER TABLE "TEACHER_ENTITY" ADD FOREIGN KEY ("EMAIL")
	  REFERENCES "USER_ENTITY" ("EMAIL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "TEACHER_ENTITY" ADD CONSTRAINT "T_CREDENTIAL" FOREIGN KEY ("EMAIL", "U_PASSWORD", "U_ROLE", "U_NAME")
	  REFERENCES "USER_ENTITY" ("EMAIL", "U_PASSWORD", "U_ROLE", "U_NAME") DISABLE;
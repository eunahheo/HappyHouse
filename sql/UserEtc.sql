DROP TABLE IF EXISTS `happyhouse`.`user` ;

CREATE TABLE IF NOT EXISTS `happyhouse`.`user` (
  `userid` VARCHAR(16) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `userpwd` VARCHAR(16) NOT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `joindate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into user
values ('ssafy', '김싸피', 'ssafy', 'ssafy@ssafy.com', now());

insert into user
values ('admin', '관리자', 'admin', 'admin@ssafy.com', now());

commit;

-- -----------------------------------------------------
-- Table `happyhouse`.`notice` 공지사항
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouse`.`notice` ;
CREATE TABLE IF NOT EXISTS `happyhouse`.`notice` (
  `noticeno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NULL DEFAULT NULL,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT 0,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`noticeno`),
  INDEX `notice_to_user_fk` (`userid` ASC) VISIBLE,
  CONSTRAINT `notice_to_user_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into notice (userid, subject, content, hit, regtime)
values ('ssafy','[안내]공지사항 게시판입니다.','공지사항 등록은 관리자만 가능합니다.',31,now());
insert into notice (userid, subject, content, hit, regtime)
values ('ssafy','[공지] 사이트 점검 예정 안내드립니다.','2021.11.00 ~2021.11.00 기간 동안 사이트 점검 예정입니다.
참고 바랍니다.',57,now());
insert into notice (userid, subject, content, hit, regtime)
values ('admin','[안내]공지사항 작성은 관리자만 가능합니다.','공지사항을 확인하시고 궁금한 점은 QnA 게시판에 문의해주세요.',23,now());
insert into notice (userid, subject, content, hit, regtime)
values ('ssafy', '[필독] 아파트매매 실거래가 조회 방법','메인화면의 돋보기 버튼과 오른쪽 상단의 주택거래정보를 클릭하시면 주택거래정보 조회 페이지로 이동합니다. 
시,구,동을 선택하시면 아파트매매 거래내역을 조회하실 수 있으며 해당 아파트들의 위치와 정보가 지도 위에 표시됩니다.
아파트 이름을 클릭하시면 아파트매매 거래내역을 상세하게 조회하실 수 있습니다.',75,now());
insert into notice (userid, subject, content, hit, regtime)
values ('ssafy','[공지] 사이트 점검 예정 안내드립니다.','2021.11.00 ~2021.11.00 기간 동안 사이트 점검 예정입니다.
참고 바랍니다.',60,now());

-- -----------------------------------------------------
-- Table `happyhouse`.`comments_board`  QnA
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouse`.`board` ;

CREATE TABLE IF NOT EXISTS `happyhouse`.`board` (
  `articleno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NULL DEFAULT NULL,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT 0,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`articleno`),
  INDEX `board_to_user_fk` (`userid` ASC) VISIBLE,
  CONSTRAINT `board_to_user_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into board (userid, subject, content, hit, regtime)
		values ('sdi1358','상권정보는 어떻게 조회하나요?','상권정보 조회 방법이 궁금합니다.', 15, now()),
        ('ojy','사이트 점검 문의드립니다.','사이트 점검 기간 동안은 사이트 사용이 불가한가요?', 20, now()),
        ('hhh','사이트 설명이 부족해요.', '사이트 사용 방법에 대한 설명이 부족해요.
        더 상세한 설명 부탁드립니다.',13,now());

DROP TABLE IF EXISTS `happyhouse`.`memo` ;

CREATE TABLE IF NOT EXISTS `happyhouse`.`memo` (
  `memono` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NULL DEFAULT NULL,
  `comment` VARCHAR(500) NULL DEFAULT NULL,
  `memotime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articleno` INT NULL DEFAULT NULL,
  PRIMARY KEY (`memono`),
  INDEX `memo_to_board_fk` (`articleno` ASC) VISIBLE,
  INDEX `memo_to_user_fk_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `memo_to_board_fk`
    FOREIGN KEY (`articleno`)
    REFERENCES `happyhouse`.`board` (`articleno`),
  CONSTRAINT `memo_to_user_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`comments_board`  QnA게시판의 댓글
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`comments_board` (
  `commentno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NULL DEFAULT NULL,
  `comment` VARCHAR(500) NULL DEFAULT NULL,
  `commenttime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articleno` INT NULL DEFAULT NULL,
  PRIMARY KEY (`commentno`),
  INDEX `comments_to_board_fk` (`articleno` ASC) VISIBLE,
  INDEX `comments_to_user_fk_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `comments_to_board_fk`
    FOREIGN KEY (`articleno`)
    REFERENCES `happyhouse`.`board` (`articleno`),
  CONSTRAINT `comments_to_user_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`guestbook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`guestbook` (
  `articleno` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(16) NULL DEFAULT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `content` VARCHAR(2000) NOT NULL,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`articleno`),
  INDEX `guestbook_userid_FK_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `guestbook_id_FK`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`file_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`file_info` (
  `articleno` INT NOT NULL,
  `savefolder` VARCHAR(45) NULL DEFAULT NULL,
  `originfile` VARCHAR(50) NOT NULL,
  `savefile` VARCHAR(50) NULL DEFAULT NULL,
  INDEX `file_info_articleno_fk_idx` (`articleno` ASC) VISIBLE,
  CONSTRAINT `file_info_articleno_fk`
    FOREIGN KEY (`articleno`)
    REFERENCES `happyhouse`.`guestbook` (`articleno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `happyhouse`.`interest`  관심지역
-- -----------------------------------------------------
CREATE TABLE `happyhouse`.`interest` (
  `interestno` INT NOT NULL AUTO_INCREMENT,
  `sidoname` VARCHAR(45) NULL,
  `gugunname` VARCHAR(45) NULL,
  `dongname` VARCHAR(45) NULL,
  `dongcode` VARCHAR(45) NULL,
  `lat` VARCHAR(45) NULL,
  `lng` VARCHAR(45) NULL,
  `userid` VARCHAR(20) NULL,
  PRIMARY KEY (`interestno`),
  INDEX `interest_user_fk_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `interest_user_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `happyhouse`.`company`  사용자의 회사
-- -----------------------------------------------------
CREATE TABLE `happyhouse`.`company` (
  `companyno` INT NOT NULL AUTO_INCREMENT,
  `buildingname` VARCHAR(50) NOT NULL,
  `sido` VARCHAR(30) NULL,
  `sigungu` VARCHAR(30) NULL,
  `bname` VARCHAR(30) NULL,
  `bcode` VARCHAR(10) NULL,
  `lat` VARCHAR(30) NULL,
  `lng` VARCHAR(30) NULL,
  `userid` VARCHAR(16) NULL,
  PRIMARY KEY (`companyno`),
  INDEX `company_user_fk_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `company_user_fk`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
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
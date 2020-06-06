# project_sm

![main.PNG](https://github.com/bghgu/project_sm/blob/master/image/main.PNG)

성공회대학교 멘토링 시스템(SM 사업 시스템)

프로젝트 기간 : 2017년 9월 ~ 2017년 12월

맡은 역할 : Front-end 개발, Back-end 개발, DB 모델링

[SM 사업 시스템 작품제안서](https://github.com/bghgu/project_sm/blob/master/SM%EC%82%AC%EC%97%85%20%EC%8B%9C%EC%8A%A4%ED%85%9C_%EC%9E%91%ED%92%88%EC%A0%9C%EC%95%88%EC%84%9C.pdf) - 작품 제안서

사용 기술 : Spring-boot, JSP, MySQL, MyBatis, AWS(EC2, RDS, S3)

![db.png](https://github.com/bghgu/project_sm/blob/master/image/db.jpg)

RE 다이어그램

## 구성

![1.png](https://github.com/bghgu/project_sm/blob/master/image/1.png)

## 시작하기

모든 소스코드는 IntelliJ + Window10 + JAVA 8 환경에서 작성되었습니다.

이 프로젝트에서는 아래 같은 **의존성 프로젝트**가 포함되어있습니다. 

**pom.xml** 파일에 아래와 같이 **의존성 프로젝트**를 추가해 주세요.

```
<dependencies>
	<dependency>
		<groupId>org.mybatis.spring.boot</groupId>
		<artifactId>mybatis-spring-boot-starter</artifactId>
		<version>1.3.1</version>
	</dependency>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-web</artifactId>
	</dependency>
	<dependency>
		<groupId>mysql</groupId>
		<artifactId>mysql-connector-java</artifactId>
		<scope>runtime</scope>
	</dependency>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-tomcat</artifactId>
		<scope>provided</scope>
	</dependency>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-test</artifactId>
		<scope>test</scope>
	</dependency>
	<dependency>
		<groupId>javax.servlet</groupId>
		<artifactId>jstl</artifactId>
	</dependency>
	<dependency>
		<groupId>org.projectlombok</groupId>
		<artifactId>lombok</artifactId>
		<optional>true</optional>
	</dependency>
	<dependency>
		<groupId>org.apache.tomcat.embed</groupId>
		<artifactId>tomcat-embed-jasper</artifactId>
		<version>8.5.20</version>
	</dependency>
	<!-- Security -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
	<dependency>
		<groupId>org.springframework.security</groupId>
		<artifactId>spring-security-taglibs</artifactId>
	</dependency>
	<!-- EXCEL -->
	<dependency>
		<groupId>org.apache.poi</groupId>
		<artifactId>poi</artifactId>
		<version>3.11</version>
	</dependency>
	<dependency>
		<groupId>org.apache.poi</groupId>
		<artifactId>poi-ooxml</artifactId>
		<version>3.11</version>
	</dependency>
	<!-- file upload -->
	<dependency>
		<groupId>commons-fileupload</groupId>
		<artifactId>commons-fileupload</artifactId>
		<version>1.3.1</version>
	</dependency>
	<dependency>
		<groupId>commons-io</groupId>
		<artifactId>commons-io</artifactId>
		<version>2.4</version>
	</dependency>
	<!-- mail -->
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-mail</artifactId>
		<version>1.5.7.RELEASE</version>
	</dependency>
	<!-- redis -->
	<dependency>
		<groupId>redis.clients</groupId>
		<artifactId>jedis</artifactId>
	</dependency>
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-data-redis</artifactId>
	</dependency>
	<!-- AWS -->
	<dependency>
		<groupId>org.springframework.cloud</groupId>
		<artifactId>spring-cloud-starter-aws</artifactId>
	</dependency>
</dependencies>
<dependencyManagement>
	<dependencies>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-aws</artifactId>
			<version>1.2.1.RELEASE</version>
			<type>pom</type>
			<scope>import</scope>
		</dependency>
	</dependencies>
</dependencyManagement>
```
## 실행하기

모든 소스코드는 Intellij + Windows10 + java 8 환경에서 작성되었습니다.

- `jdk8` 과 `maven` 을 설치합니다.
- `JAVA_JOME` 환경변수 설정을 합니다.
- `Path`에 `maven` 환경변수 설정을 합니다.
- 내장 톰캣을 이용해 서버를 배포 합니다.
- spring boot 앱 실행
- `application.properties` 파일이 필요합니다.

```
mvn spring-boot:run
```

- 중지하려면, 키보드에서 `Crtl + C`를 누릅니다.
- `application.properties` 파일이 필요합니다.

AWS EC2 Ubuntu 환경

- `jdk8` 과 `maven` 을 설치합니다.
- 내장 톰캣을 이용해 서버를 배포 합니다.
- 백 그라운드 spring boot 앱 실행

```
nohup mvn spring-boot:run&
```

- 중지하려면,  `netstat -tnlp` 명령어를 통해 프로세스를 kill 하십시오.

## 배포

* AWS EC2 - 애플리케이션 서버
* AWS RDS - db 서버
* AWS S3 - 저장소 서버
* AWS ElastiCache - 인 메모리 데이터 서버

## 사용된 도구

* [Spring-boot](https://projects.spring.io/spring-boot/) - Spring-boot 웹 프레임워크
* [Maven](https://maven.apache.org/) - 의존성 관리 프로그램
* [Tomcat](http://tomcat.apache.org/) - 웹 애플리케이션 서버
* [Mybatis](http://www.mybatis.org/mybatis-3/ko/index.html) - SQL 지원 Persistence 프레임워크
* [IntelliJ IDEA](https://www.jetbrains.com/idea/) - IDE
* [MySql](https://www.mysql.com/) - DataBase
* [Redis](https://redis.io/) - DataBase
* [bootstrapk](http://bootstrapk.com/) - CSS 도우미
* [Apache poi](https://poi.apache.org/) - java API for MS Documents
* [AWS EC2](https://aws.amazon.com/ko/ec2/?sc_channel=PS&sc_campaign=acquisition_KR&sc_publisher=google&sc_medium=english_ec2_b&sc_content=ec2_e&sc_detail=aws%20ec2&sc_category=ec2&sc_segment=177228231544&sc_matchtype=e&sc_country=KR&s_kwcid=AL!4422!3!177228231544!e!!g!!aws%20ec2&ef_id=WkRozwAAAnO-lPWy:20180412120123:s) - 클라우드 환경 컴퓨팅 시스템
* [AWS RDS](https://aws.amazon.com/ko/rds/) - 클라우드 환경 데이터베이스 관리 시스템
* [AWS S3](https://aws.amazon.com/ko/s3/?sc_channel=PS&sc_campaign=acquisition_KR&sc_publisher=google&sc_medium=english_s3_b&sc_content=s3_e&sc_detail=aws%20s3&sc_category=s3&sc_segment=177211245240&sc_matchtype=e&sc_country=KR&s_kwcid=AL!4422!3!177211245240!e!!g!!aws%20s3&ef_id=WkRozwAAAnO-lPWy:20180412120059:s) - 클라우드 환경 데이터 저장소
* [AWS ElastiCache](https://aws.amazon.com/ko/elasticache/?sc_channel=PS&sc_campaign=acquisition_KR&sc_publisher=google&sc_medium=english_elasticache_b&sc_content=aws_redis_e&sc_detail=aws%20redis&sc_category=elasticache&sc_segment=161192411413&sc_matchtype=e&sc_country=KR&s_kwcid=AL!4422!3!161192411413!e!!g!!aws%20redis&ef_id=WkRozwAAAnO-lPWy:20180412123345:s) - 클라우드 환경 인 메모리 데이터 스토어

## 저자

* **배다슬** - [bghgu](https://github.com/bghgu)
* **국중서**
* **주상원**
* **김보미** - [BBBOMi](https://github.com/BBBOMi)
* **박소희** 


[기여자 목록](https://github.com/bghgu/project_vote_main/contributors)을 확인하여 이 프로젝트에 참가하신 분들을 보실 수 있습니다.

## 감사 인사

* **이준우** - [chucky6413](https://github.com/chucky6413)
* **이승기** - [sjaqjwor](https://github.com/sjaqjwor)
* **원일준** - [iljun](https://github.com/iljun)
* 구글의 모든 Spring 관련 블로그

## 수상

- 2018년 제 10회 소프트웨어공학과 경진대회 지정주제 부 3위

---



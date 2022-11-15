-- 영화 리뷰 플랫폼 DB테이블

drop table w_reply;
drop table w_write;
drop table reply;
drop table image;
drop table coment;
drop table notice;
drop table write;
drop table star;
drop table member;
drop table movie;
drop table singo;
drop table free_reply;
drop table free_write;

-- 영화 테이블
create table movie(
    movie_num number primary key,          -- 영화 번호
    movie_title varchar2(100),             -- 영화 제목
    movie_cont varchar2(4000),             -- 영화 내용
    movie_time varchar2(100),              -- 영화 시간   
    movie_date varchar2(100),              -- 영화 제작년도
    movie_age varchar2(100),               -- 연령 등급 
    movie_genre varchar2(100),             -- 영화 장르
    movie_country varchar2(30),            -- 영화 국가
    movie_director varchar2(100),          -- 영화 감독
    movie_video varchar2(500),             -- 동영상 경로
    movie_count number(10) default 0,      -- 코멘트개수
    movie_hit number(10) default 0     -- 조회수
);
insert into movie values(1, '블랙팬서', '와칸다를 지켜라! 거대한 두 세계의 충돌, 운명을 건 최후의 전투가 시작된다! 국왕이자 블랙 팬서인 티찰라의 죽음 이후 수많은 강대국으로부터 위협을 받게 된 와칸다. 라몬다, 슈리 그리고 나키아, 오코예, 음바쿠는 각자 사명감을 갖고 와칸다를 지키기 위해 외로운 싸움을 이어간다.', '2시간', '2022', '15', '액션', '미국', '라이언', 'https://www.youtube.com/embed/ku9l1fHo5XE', 0, 0);
insert into movie values(2, '동감', '1999년, 용은 첫눈에 반하게 된 한솔을 사로잡기 위해 친구에게 HAM 무전기를 빌린다. 2022년, 무늬는 인터뷰 과제를 위해 오래된 HAM 무전기를 작동시킨다.', '2시간', '2022', '15', '로맨스', '한국', '서은영', 'https://www.youtube.com/embed/X8b3KvxybA4', 0, 0);
insert into movie values(3, '데시벨', '소음이 커지는 순간 폭.발.한.다  물이 끓는 주전자 소리, 창문 여는 소리, 놀이터 아이들의 웃음 소리… 잠시 후, 거대한 굉음과 함께 단독 주택이 폭발했다는 뉴스 속보가 전해진다.', '2시간', '2022', '18', '범죄', '미국', '황인호', 'https://www.youtube.com/embed/RvSIIqKumkY', 0, 0);
insert into movie values(4, '자백', '제대로 함정에 빠졌다! 불륜 사실을 폭로하겠다는 협박을 받고 호텔로 간 유민호는 누군가의 공격을 받고 쓰러진다. ', '2시간', '2020', '15', '범죄', '한국', '윤종석', 'https://www.youtube.com/embed/M-OsBtkztpQ', 0, 0);
insert into movie values(5, '폴:600미터', '사상 최초 고공 서바이벌  지상에서 가장 높은 600m 타워  내려갈 단 하나의 길이 끊겼다!', '3시간', '2022', '15', '액션', '영국', '스콧 만', 'https://www.youtube.com/embed/zdJQUe3e5L4', 0, 0);
insert into movie values(6, '에브리씽 에브리웨어', '미국에 이민 와 힘겹게 세탁소를 운영하던 에블린은 세무당국의 조사에 시달리던 어느 날 남편의 이혼 요구와 삐딱하게 구는 딸로 인해 대혼란에 빠진다', '4시간', '2022', '15', '로맨스', '영국', '댄콴', 'https://www.youtube.com/embed/EwG6X54F8kg', 0, 0);
insert into movie values(7, '올빼미', '그날 밤, 세자가 죽었다. 맹인이지만 뛰어난 침술 실력을 지닌 경수는 어의 ‘이형익’에게 그 재주를 인정받아 궁으로 들어간다.', '2시간', '2021', '15', '범죄', '한국', '다카하시와타루', 'https://www.youtube.com/embed/eRX5_KUyx7c', 0, 0);
insert into movie values(8, '짱구는못말려', '짱구와 친구들, 명문학교에 입학하다?! 명문 엘리트 양성학교에 체험 입학하게 된 짱구와 친구들! 좋은 성적을 내서 학교에 정식 입학하고 싶은 철수와 장난만 치려는 짱구는 크게 싸우게 된다.', '3시간', '2021', '15', '액션', '한국', '안태진', 'https://www.youtube.com/embed/qAPdFL_Z1ck', 0, 0);
insert into movie values(9, '소드아트온라인', '세계 최초의 VRMMORPG <소드 아트 온라인>이 데스 게임으로 변하면서, 1만 명의 플레이어들이 게임 세계에 갇혀 버린 이후, 이미 한 달 이상이 경과했다', '3시간', '2022', '15', '액션', '미국', '코노 아야코', 'https://www.youtube.com/embed/t3NHHvFNPME', 0, 0);
insert into movie values(10, '같은속옷입는두여자', '여느 날과 다름없이 다투던 중, 마트 주차장에서 ‘수경’이 탄 차가 ‘이정’을 덮치는 사고가 발생한다.', '3시간', '2020', '15', '로맨스', '한국', '김세인', 'https://www.youtube.com/embed/Yx6zrMfh71o', 0, 0);
insert into movie values(11, '리멤버', '“부서진 차… 손에 묻은 피… 권총 한 자루… 내가 왜 여기에 있는 거지?”  뇌종양 말기, 80대 알츠하이머 환자인 한필주. 일제강점기 때 친일파들에게 가족을 모두 잃었다.', '1시간', '1994', '15', '범죄', '한국', '두정철', 'https://www.youtube.com/embed/DVSSYfyXy9s', 0, 0);
insert into movie values(12, '인생은아름다워', '내 생애 가장 빛나는 선물  모든 순간이 노래가 된다! ', '2시간', '1998', '15', '로맨스', '한국', '이일형', 'https://www.youtube.com/embed/4AbRKg95JyU', 2, 11);
insert into movie values(13, '친한친구의아침식사', '“가슴이 두근대는 느낌 알아?” 세상 종말이 와도 먹는 것을 멈출 수 없는 귀요미 먹방 요정, 웨이신. 좋아하는 친구에게 1년 동안 아침 조공을 하는 댕댕이 조공 소년', '1시간', '2021', '15', '로맨스', '한국', '최국희', 'https://www.youtube.com/embed/vyGE4yADjNI', 0, 0);
insert into movie values(14, '블랙아담', '누구도 막을 수 없다! 기원전 가장 번성하고 위대한 고대 국가였지만 현재는 국제 군사 조직 인터갱의 독재 국가로 전락한 칸다크. ', '2시간', '1999', '15', '액션', '미국', '이마이시 히로유키', 'https://www.youtube.com/embed/FuPLLwH4lp4', 0, 0);
insert into movie values(15, '프로메어', '모든 것이 불타버릴 인류에 닥친 최대 위기! 지구의 운명이 걸린 거대한 불꽃 전쟁이 펼쳐진다! 불을 다스리는 돌연변이 ‘버니시’의 습격을 받은 지 30년', '2시간', '2021', '15', '액션', '미국', '이상문', 'https://www.youtube.com/embed/EKimdETpg54', 0, 0);
insert into movie values(16, '고속도로가족', '“지갑을 잃어버려서 그러는데, 2만 원만 빌려주시겠어요?” 고속도로 휴게소에서 텐트를 집, 밤하늘의 달을 조명 삼아 살고 있는 기우(정일우)와 가족들', '3시간', '2022', '15', '범죄', '한국', '자움 콜렛세라', 'https://www.youtube.com/embed/m5DHjm2rErU', 0, 0);
insert into movie values(17, '살인청부업자', '인정사정없는 살인청부업자의 날 것 그대로의 인간 사냥이 시작된다! 목표를 정하면 수단과 방법을 가리지 않고 박멸시키는 철칙을 가진 ‘기술자’', '2시간', '2022', '15', '범죄', '한국', '김한민', 'https://www.youtube.com/embed/zZ0o9pHFFzM', 0, 0);
insert into movie values(18, '한산리덕스', '나라의 운명을 바꾼 승리의 전투 못다 한 이야기가 밝혀진다! 1592년, 임진왜란 발발 후 15일만에 한양을 빼앗긴 절체절명의 위기에 놓인 조선. ', '1시간', '2021', '15', '범죄', '미국', '일리야 막시모프', 'https://www.youtube.com/embed/GduEtmvwcI0', 0, 0);
insert into movie values(19, '아인보', '신비의 숲 아마존 깊은 곳에 위치한 칸다모 마을. 생명과 자연의 아름다움이 넘치던 칸다모는 전설 속 악령 야쿠루나의 끔찍한 저주로 위험에 빠진다.', '3시간', '2022', '15', '액션', '한국', '강태호', 'https://www.youtube.com/embed/3TUgRn6XUIM', 0, 0);
insert into movie values(20, '걸리버리턴즈', '제작진의 자이언트 어드벤처! 돌아온 거인 ‘걸리버’의 새로운 모험! 안녕! 난 세계 최고의 모험가 걸리버야! 위험에 빠진 릴리풋 왕국을 도와주러 왔지', '2시간', '2021', '15', '로맨스', '미국', '호세 젤라다', 'https://www.youtube.com/embed/leeo3OsKJnk', 0, 0);
insert into movie values(21, '알카라스의여름', '해가 내리쬐는 작은 마을, 알카라스 매 여름마다 복숭아를 수확하기 위해 3대째 모이는 솔레 가족은 찬란한 계절을 누린다. ', '2시간', '2020', '15', '범죄', '미국', '카를라시몬', 'https://www.youtube.com/embed/SZj1FaPG5AQ', 0, 0);
insert into movie values(22, '미혹', '셋째 아이의 비극적인 죽음 후, 현우(박효주)와 석호(김민재) 부부는 새로운 아이의 입양을 결심한다. ', '2시간', '2022', '15', '로맨스', '한국', '김진영', 'https://www.youtube.com/embed/3vqwbLet2o0', 0, 0);
insert into movie values(23, '가재가노래하는곳', '습지 소녀로 불리는 한 여자, 살인사건의 유력한 용의자로 지목되다.  어렸을 때 가족에게 버림받고 자연만이 유일한 친구였던 카야. ', '1시간', '2021', '15', '로맨스', '한국', '올리비아 뉴먼', 'https://www.youtube.com/embed/BYD7PBv2MZk', 0, 0);
insert into movie values(24, '태일이', '16살, 태일이는 평화시장에서 미싱사 보조로 취직했다. 집에 갈 차비로 동생 같은 여공들에게 풀빵을 사다 주고, 새벽 이슬을 맞으며 집까지 걸어가는 마음 따뜻한 사람이다.', '3시간', '2022', '15', '액션', '일본', '홍준표', 'https://www.youtube.com/embed/EBRf5RSRwz8', 0, 0);
insert into movie values(25, '탑', '중년의 영화감독이 오랜만에 만난 그의 딸과 함께 인테리어 디자인하는 여자의 건물을 찾는다. 딸이 인테리어 디자인을 배우고 싶어 해서 그녀에게 도움을 얻기 위해서다.', '1시간', '2021', '15', '범죄', '미국', '홍상수', 'https://www.youtube.com/embed/nDTo9s8la0o', 0, 0);
insert into movie values(26, '유루캠', '이것은 조금 먼 미래의 겨울부터 시작되는 이야기 시마 린은 고향인 야마나시를 떠나, 나고야의 작은 출판사에 취직해 혼자서 생활하고 있었다.', '2시간', '2022', '15', '액션', '중국', '쿄고쿠 요시아키', 'https://www.youtube.com/embed/hiSPrJDYyH4', 0, 0);
insert into movie values(27, '헤어질 결심', '일본인 사위를 극구 반대하던 부모님. 엄마는 오사카로 처음 인사 오는 일본인 사위를 위해 터질 만큼 속을 꽉 채운 닭 백숙을 정성껏 끓입니다. ', '2시간', '2022', '15', '로맨스', '한국', '박강', 'https://www.youtube.com/embed/1aGmufixPK4', 0, 0);
insert into movie values(28, '수프와이데올로기', '아기가 태어난 지 얼마 안 된 초보 아빠 우진(서현우)은 현관문에 금줄을 쳐서 외부인의 출입을 막고, 금기사항을 철저히 지키는 아내가 이해되지 않는다. ', '3시간', '2020', '15', '범죄', '미국', '벤르윈', 'https://www.youtube.com/embed/y87DedfZNHI', 0, 0);
insert into movie values(29, '피가로~피가로', '“늘 오페라 가수가 되고 싶었어요, 펀드 매니저만 하다 죽고 싶지 않아요”  런던의 잘나가는 펀드 매니저 밀리는 오래 전부터 꿈꿔왔던 오페라 가수에 도전하기 위해...', '1시간', '2019', '15', '액션', '미국', '제임스 맥테이그', 'https://www.youtube.com/embed/6rRn8kM4-ds', 0, 0);
insert into movie values(30, '세이레', '제 3차 세계대전 후 완벽하게 통제된 미래 V가 돌아왔다 <매트릭스> 워쇼스키 형제가 만들어낸 또 다른 가상현실!', '3시간', '2018', '15', '로맨스', '미국', '양영희', 'https://www.youtube.com/embed/c-olAbd6w_U', 0, 0);

-- 회원 테이블
create table member(
    member_num number(5),                       -- 회원번호
    member_id varchar2(100) primary key,        -- 회원 아이디
    member_name varchar2(30),                   -- 회원 이름
    member_pwd varchar2(100),                   -- 회원 비밀번호
    member_profile varchar2(2000),              -- 회원 프로필
    member_birth varchar2(1000),                -- 회원 생년월일
    member_regdate varchar(100),                -- 회원 가입일
    member_image varchar2(2000) default '프로필로고.png',                  -- 회원 프로필 이미지
    member_use number(5),
    member_email varchar2(200)
);
insert into member VALUES(1,'test1','테스트','1234','안녕하세요 테스트입니다 ','1996-01-12',sysdate,'프로필로고.png','1','soopwe2@naver.com');
insert into member VALUES(2,'test2','홍길동','1234','안녕하세요 홍길동입니다','1998-11-15', sysdate, '프로필로고.png','1','wjdgus8576@naver.com');
insert into member VALUES(3,'test3','길동이','1234','안녕하세요 길동이입니다.','2006-10-18',sysdate,'프로필로고.png','1','soopwe1127@daum.net');


-- 게시판 테이블
create table write(
    write_num number(5) primary key,
    write_cont varchar2(4000),
    write_title varchar2(2000),
    write_pwd varchar(100),
    write_hit number(10) default 0,
    write_date date,
    write_radio number(3) default 0,
    write_reply number(3) default 0,
    member_id varchar2(100) references member(member_id) ON DELETE CASCADE  
);
insert into write values(1, '게시판글내용1', '게시판글제목1', '1234', default, '1995-10-10', 0, 0,'test1');
insert into write values(2, '게시판글내용2', '게시판글제목2', '1234', 0, '1995-11-11', 0, 0,'test2');
insert into write values(3, '게시판글내용3', '게시판글제목3', '1234', 0, '1995-12-12', 0, 0,'test3');

-- 게시판 답변테이블
create table reply(
    reply_num number(5) primary key,
    reply_cont varchar2(4000),
    reply_date date,
    write_num number(5) references write(write_num)
    on delete cascade
);
insert into reply values(1, '답변내용1', '1995-04-04', 1);
insert into reply values(2, '답변내용2', '1995-05-05', 2);
insert into reply values(3, '답변내용3', '1995-06-06', 3);

-- 코멘트 게시판 테이블
create table coment(
    coment_num number(5),                                   -- 코멘트 게시글 번호
    movie_num number references movie(movie_num) ON DELETE CASCADE,           -- 영화테이블 번호 fk참조
    member_id varchar2(100) references member(member_id) ON DELETE CASCADE,   -- 회원테이블 아이디 fk참조
    movie_coment varchar2(4000),                            -- 영화 코멘트
    coment_num_son number(20) default 0,                    -- 코멘트 자식 댓글
    coment_hit number(5) default 0,                         -- 코멘트 좋아요
    coment_nohit number(5) default 0,                       -- 코멘트 싫어요
    cocoment_likelist varchar2(4000),                       -- 댓글좋아요 아이디 리스트
    cocoment_hatelist varchar2(4000)                        -- 댓글싫어요 아이디 리스트
);
insert into coment values(1, 1, 'test1', '재미있다' , '', 0, 0, '', '');
insert into coment values(2, 2, 'test1', '재미없다' , 0, 0, 0, '', '');
insert into coment values(3, 3, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(4, 4, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(5, 5, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(6, 6, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(7, 7, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(8, 8, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(9, 9, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(10, 10, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(11, 11, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(12, 12, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(13, 13, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(14, 14, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(15, 15, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(16, 16, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(17, 17, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(18, 18, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(19, 19, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(20, 20, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(21, 21, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(22, 22, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(23, 23, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(24, 24, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(25, 25, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(26, 26, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(27, 27, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(28, 28, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(29, 29, 'test1', '졸리다' , 0, 0, 0, '', '');
insert into coment values(30, 30, 'test1', '졸리다' , 0, 0, 0, '', '');



-- 공지사항 테이블
create table notice(
    notice_num number(5) primary key,                        -- 글번호
    notice_title varchar2(100),                              -- 글제목
    notice_content varchar2(4000),                           -- 글내용
    notice_hit number(5) default 0 not null,                          -- 글 조회수
    notice_date varchar2(100)                                -- 글 작성일자
);
insert into notice values(1, '공지사항 제목 1', '공지사항 내용 1', 0, '2022-11-01');
insert into notice values(2, '공지사항 제목 2', '공지사항 내용 2', 1, '2022-10-01');
insert into notice values(3, '공지사항 제목 3', '공지사항 내용 3', 2, '2022-10-05');

-- 별점 좋아요 보는중 테이블
create table star(
    movie_num number references movie(movie_num),           -- 영화테이블 번호 fk참조
    member_id varchar2(100) references member(member_id),   -- 회원테이블 회원 아이디 fk참조
    movie_star number(5),                                   -- 영화 별점
    movie_heart number(1) default 0,                        -- 영화 찜(보고싶어요)
    movie_watch number(1) default 0                        -- 영화 보는중
);
insert into star values(1, 'test1', '4', 1,1);
insert into star values(2, 'test1', '3', 1,1);
insert into star values(3, 'test1', '1', 1,1);
insert into star values(4, 'test1', '2', 1,1);
insert into star values(5, 'test1', '4', 1,1);
insert into star values(6, 'test1', '3', 1,1);
insert into star values(7, 'test1', '3', 1,1);
insert into star values(8, 'test1', '1', 1,1);
insert into star values(9, 'test1', '2', 1,1);
insert into star values(10, 'test1', '2', 1,1);
insert into star values(11, 'test1', '3', 1,1);
insert into star values(12, 'test1', '4', 1,1);
insert into star values(13, 'test1', '4', 1,1);
insert into star values(14, 'test1', '2', 1,1);
insert into star values(15, 'test1', '1', 1,1);
insert into star values(16, 'test1', '2', 1,1);
insert into star values(17, 'test1', '1', 1,1);
insert into star values(18, 'test1', '3', 1,1);
insert into star values(19, 'test1', '1', 1,1);
insert into star values(20, 'test1', '2', 1,1);
insert into star values(21, 'test1', '3', 1,1);
insert into star values(22, 'test1', '5', 1,1);
insert into star values(23, 'test1', '1', 1,1);
insert into star values(24, 'test1', '2', 1,1);
insert into star values(25, 'test1', '4', 1,1);
insert into star values(26, 'test1', '2', 1,1);
insert into star values(27, 'test1', '1', 1,1);
insert into star values(28, 'test1', '3', 1,1);
insert into star values(29, 'test1', '4', 1,1);
insert into star values(30, 'test1', '2', 1,1);
insert into star values(1, 'test2', '1', 1,1);
insert into star values(2, 'test2', '4', 1,1);
insert into star values(3, 'test2', '2', 1,1);
insert into star values(4, 'test2', '3', 1,1);
insert into star values(5, 'test2', '1', 1,1);
insert into star values(6, 'test2', '2', 1,1);
insert into star values(7, 'test2', '3', 1,1);
insert into star values(8, 'test2', '4', 1,1);
insert into star values(9, 'test2', '4', 1,1);
insert into star values(10, 'test2', '2', 1,1);
insert into star values(11, 'test2', '1', 1,1);
insert into star values(12, 'test2', '5', 1,1);
insert into star values(13, 'test2', '3', 1,1);
insert into star values(14, 'test2', '5', 1,1);
insert into star values(15, 'test2', '2', 1,1);
insert into star values(16, 'test2', '1', 1,1);
insert into star values(17, 'test2', '3', 1,1);
insert into star values(18, 'test2', '2', 1,1);
insert into star values(19, 'test2', '1', 1,1);
insert into star values(20, 'test2', '5', 1,1);
insert into star values(21, 'test2', '2', 1,1);
insert into star values(22, 'test2', '3', 1,1);
insert into star values(23, 'test2', '2', 1,1);
insert into star values(24, 'test2', '3', 1,1);
insert into star values(25, 'test2', '1', 1,1);
insert into star values(26, 'test2', '1', 1,1);
insert into star values(27, 'test2', '2', 1,1);
insert into star values(28, 'test2', '2', 1,1);
insert into star values(29, 'test2', '4', 1,1);
insert into star values(30, 'test2', '3', 1,1);




-- 이미지 파일 테이블
create table image(
    movie_num number references movie(movie_num),            -- 영화테이블 영화번호 fk참조
    image_loc varchar2(100),                                 -- 영화 이미지 경로
    image_temp varchar2(100),                                -- 임시 컬럼(필요예상.)
    director_image varchar(100)                              -- 감독 이미지
);
insert into image values(1, '와칸다.jpg', '와칸다갤러리1.jpg,와칸다갤러리2.jpg,와칸다갤러리3.jpg', '감독1.jpg');
insert into image values(2, '동감.jpg', '동감갤러리1.jpg,동감갤러리2.jpg,동감갤러리3.jpg', '감독2.jpg');
insert into image values(3, '데시벨.jpg', '데시벨갤러리1.jpg,데시벨갤러리2.jpg,데시벨갤러리3.jpg', '감독3.jpg');
insert into image values(4, '자백.jpg', '자백갤러리1.jpg,자백갤러리2.jpg,자백갤러리3.jpg', '감독4.jpg');
insert into image values(5, '폴600.jpg', '폴600갤러리1.jpg,폴600갤러리2.jpg,폴600갤러리3.jpg', '감독5.jpg');
insert into image values(6, '에브리씽.jpg', '에브리씽갤러리1.jpg,에브리씽갤러리2.jpg,에브리씽갤러리3.jpg', '감독6.jpg');
insert into image values(7, '올빼미.jpg', '올빼미갤러리1.jpg,올빼미갤러리2.jpg,올빼미갤러리3.jpg', '감독7.jpg');
insert into image values(8, '짱구.jpg', '짱구갤러리1.jpg,짱구갤러리2.jpg,짱구갤러리3.jpg', '감독8.jpg');
insert into image values(9, '소아온.jpg', '소아온갤러리1.jpg,소아온갤러리2.jpg,소아온갤러리3.jpg', '감독9.jpg');
insert into image values(10, '같은.jpg', '같은갤러리1.jpg,같은갤러리2.jpg,같은갤러리3.jpg', '감독10.jpg');
insert into image values(11, '리멤버.jpg', '리멤버갤러리1.jpg,리멤버갤러리2.jpg,리멤버갤러리3.jpg', '감독11.jpg');
insert into image values(12, '인생은.jpg', '인생은갤러리1.jpg,인생은갤러리2.jpg,인생은갤러리3.jpg', '감독12.jpg');
insert into image values(13, '내친한.jpg', '내친한갤러리1.jpg,내친한갤러리2.jpg,내친한갤러리3.jpg', '감독13.jpg');
insert into image values(14, '블랙아담.jpg', '블랙아담갤러리1.jpg,블랙아담갤러리2.jpg,블랙아담갤러리3.jpg', '감독14.jpg');
insert into image values(15, '프로메어.jpg', '프로메어갤러리1.jpg,프로메어갤러리2.jpg,프로메어갤러리3.jpg', '감독15.jpg');
insert into image values(16, '고속도로1.jpg', '고속도로2.jpg,고속도로3.jpg,고속도로4.jpg', '감독16.jpg');
insert into image values(17, '살인청부업자1.jpg', '살인청부업자2.jpg,살인청부업자3.jpg,살인청부업자4.jpg', '감독17.jpg');
insert into image values(18, '한산1.jpg', '한산2.jpg,한산3.jpg,한산4.jpg', '감독18.jpg');
insert into image values(19, '아인보아마존의전설1.jpg', '아인보아마존의전설2.jpg,아인보아마존의전설3.jpg,아인보아마존의전설4.jpg', '감독19.jpg');
insert into image values(20, '걸리버리턴즈1.jpg', '걸리버리턴즈2.jpg,걸리버리턴즈3.jpg,걸리버리턴즈4.jpg', '감독20.jpg');
insert into image values(21, '알카라스의여름1.jpg', '알카라스의여름2.jpg,알카라스의여름3.jpg,알카라스의여름4.jpg', '감독21.jpg');
insert into image values(22, '미혹1.jpg', '미혹2.jpg,미혹3.jpg,미혹4.jpg', '감독22.jpg');
insert into image values(23, '가재가노래하는곳1.jpg', '가재가노래하는곳2.jpg,가재가노래하는곳3.jpg,가재가노래하는곳4.jpg', '감독23.jpg');
insert into image values(24, '태일이1.jpg', '태일이2.jpg,태일이3.jpg,태일이4.jpg', '감독24.jpg');
insert into image values(25, '탑1.jpg', '탑2.jpg,탑3.jpg,탑4.jpg', '감독25.jpg');
insert into image values(26, '극장판유루캠1.jpg', '극장판유루캠2.jpg,극장판유루캠3.jpg,극장판유루캠4.jpg', '감독26.jpg');
insert into image values(27, '헤어질결심1.jpg', '헤어질결심2.jpg,헤어질결심3.jpg,헤어질결심4.jpg', '감독27.jpg');
insert into image values(28, '수프와이데올로기1.jpg', '수프와이데올로기2.jpg,수프와이데올로기3.jpg,수프와이데올로기4.jpg', '감독28.jpg');
insert into image values(29, '피가로1.jpg', '피가로2.jpg,피가로3.jpg,피가로4.jpg', '감독29.jpg');
insert into image values(30, '세이레1.jpg', '세이레2.jpg,세이레3.jpg,세이레4.jpg', '감독30.jpg');




-- 1:1 게시판
create table w_write(
    w_num number(5) primary key,
    w_cont varchar2(4000),
    w_date date,
    w_file varchar2(1000),
    w_reply number(3) default 0 not null,
    member_id references member(member_id)
);
insert into w_write values(1, '내용내용1', '2022-11-01', '파일1', 0, 'test1');
insert into w_write values(2, '내용내용2', '2022-10-22', '파일2', 0, 'test2');
insert into w_write values(3, '내용내용3', '2022-08-16', '파일3', 0, 'test3');

-- 1:1 게시판 답변
create table w_reply(
    r_num number(5) primary key,
    r_cont varchar2(4000),
    r_date date,
    w_num references w_write(w_num)
    on delete cascade
);
insert into w_reply values(1, '답변답변1', '2022-11-02', '1');
insert into w_reply values(2, '답변답변2', '2022-10-23', '2');
insert into w_reply values(3, '답변답변3', '2022-08-18', '3');

create table free_write(

    free_num number primary key,
    free_title varchar2(1000),
    free_cont varchar2(4000) not null,
    free_hit number(10) default 0,
    free_date date,
    free_file varchar2(1000),
    free_radio number(3) default 0 not null,
    free_reply_num number(10) default 0,
    member_id varchar2(100) references member(member_id) 
    on delete cascade
);
create table free_reply(

    r_free_num number primary key,
    r_free_cont varchar2(2000),
    r_free_date date,
    free_num number references free_write(free_num)
    on delete cascade,
    member_id varchar2(100) references member(member_id)
    on delete cascade
);
create table singo(
    member_id references member(member_id),
    singo_count number(5) DEFAULT 0
);
alter table singo
add id_list varchar2(2000);
commit;


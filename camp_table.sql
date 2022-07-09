/*
 
----------------------
 �������� Ȯ�� /���� /������ ��ɾ�
----------------------
 --���� �������� Ȯ��
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER';
--�������ǻ���
ALTER TABLE mem_out DROP CONSTRAINT fk_mem_out_idx CASCADE;
 
 
 
 
-----------------------[  MEMBER ]------------------------------------------
 
--������
create sequence seq_member_mem_idx;

create table member
(
mem_idx				int,							--����Ϸù�ȣ
grade_idx			int				not null,		--����Ϸù�ȣ
mem_email			varchar2(200)	not null,		--����̸���
mem_pwd				varchar2(200)	not null,		--�����й�ȣ
mem_gender			varchar2(200)	not null,		--�������
mem_nickname		varchar2(200)	not null,		--����г���
mem_birth			varchar2(200),					--�������
mem_regdate			date,							--��������
mem_pic_filename	varchar2(200),					--�����ʻ���
mem_profile			varchar2(100),					--�ڱ�Ұ���
mem_status			int	     default '0' not null	--Ż���������   '0'->�Ϲ�ȸ��,'1'->Ż��ȸ�� 
)


--�⺻Ű
alter table member
 add constraint pk_member_mem_idx primary key(mem_idx);
 
--alter table member drop constraint fk_member_mem_idx;--�������ڵ�
 
--�ܷ�Ű
alter table member
 add constraint fk_member_mem_idx foreign key(grade_idx)
          							references grade(grade_idx);
          							
--�̸��� ����ũ ����  
alter table member
       add constraint unique_mem_email unique(mem_email);
       
--���� üũ ����       
alter table member 
	add constraint check_mem_gender check(mem_gender='����'or mem_gender='����');
 
--������� üũ ����       
alter table member 
	add constraint check_mem_status check(mem_status='0' or mem_status='1');
 
--�г��� ����ũ ���� 
alter table member
       add constraint unique_mem_nickname unique(mem_nickname);
 
-----------------------[  MEM_OUT ]------------------------------------------ 
 
 create sequence seq_mem_out_idx;
 
 create table mem_out
 (
 mem_out_idx		int,				--Ż��ȸ�� �Ϸù�ȣ
 mem_idx			int,				--����Ϸù�ȣ
 mem_out_regdate	date	not null	--Ż������
 )
 
--�⺻Ű
alter table mem_out
 add constraint pk_mem_out_idx primary key(mem_out_idx);
 
 --�ܷ�Ű
alter table mem_out
 add constraint fk_mem_out_idx foreign key(mem_idx)
          references member(mem_idx);
 
 
 
-----------------------[  GRADE ]------------------------------------------ 

--������ ����

create table grade
(
grade_idx			int,									--����Ϸù�ȣ
grade_name			varchar2(100)	default '�����' not null --��޺��̸�
)

--�⺻Ű
alter table grade
 add constraint pk_grade_grade_idx primary key(grade_idx);
 
 
-----------------------[  GRADEUP ]------------------------------------------ 

--������
create sequence seq_gradeup_idx;

create table gradeup
(
gradeup_idx			int,							--����Ϸù�ȣ
mem_idx				int,							--����Ϸù�ȣ
gradeup_reply_count	int		default 0 not null,		--�ش� ����� �� ��� ��
gradeup_post_count	int		default 0 not null,		--�ش� ����� �� �Խñ� ��
gradeup_like_count	int		default 0 not null		--�ش� ����� �� ���ƿ� ��
)


--�⺻Ű
alter table gradeup
 add constraint pk_gradeup_gradeup_idx primary key(gradeup_idx);


--�ܷ�Ű 
alter table gradeup
 add constraint fk_gradeup_gradeup_idx foreign key(mem_idx)
          references member(mem_idx);
          
           
-----------------------[  MSG ]------------------------------------------ 


--������
create sequence seq_msg_idx;

create table msg	
(
msg_idx				int,										--�޼��� �Ϸù�ȣ
msg_content			varchar2(200)	not null,					--�޼�������
msg_sender			int				not null,					--�޼��� �������
msg_receiver		int				not null,					--�޼��� �޴»��
msg_sendtime		date			not null,					--�޼��� �����ð�
msg_opentime		date,										--�޼��� �� �ð�
msg_read_check		varchar2(50)	default '���� ����' not null	--�޼��� �������� Ȯ��
)

--�⺻Ű
alter table msg
 add constraint pk_msg_msg_idx primary key(msg_idx);
 
 
-----------------------[  CATEGORY ]------------------------------------------ 

--����������

create table category
(
category_idx		int,							--ī�װ��Ϸù�ȣ
category_type		varchar2(50) default '����Խ���'	--ī�װ� ����
)


--�⺻Ű
alter table category
 add constraint pk_category_category_idx primary key(category_idx);


-----------------------[  REVIEW ]------------------------------------------ 


--������
create sequence seq_review_idx;


create table review
(
review_idx			int,									--����� �Ϸù�ȣ
category_idx		int,									--ī�װ� �Ϸù�ȣ
mem_idx				int,									--��� �Ϸù�ȣ
review_title		varchar2(100)	not null,				--����� ����
review_content		varchar2(100)	not null,				--����� ����
review_regdate		date			not null,				--����� �����
review_hit_count	int				default 0 not null,		--����� ��ȸ��
review_like_count	int				default 0 not null,		--����� ���ƿ� ��
review_thumbnail	varchar2(500),							--����� �����
review_ip			varchar2(100)	not null				--�۾� ���ip
)


--�⺻Ű
alter table review
 add constraint pk_review_review_idx primary key(review_idx);


--�ܷ�Ű
alter table review
 add constraint fk_review_review_idx foreign key(category_idx)
          references category(category_idx);
          
--�ܷ�Ű  
alter table review
 add constraint fk_review_review_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
          
-----------------------[  REVIEW_REPLY ]------------------------------------------ 


--������
create sequence seq_review_reply_idx;


create table review_reply
(
review_reply_idx		int,							--���� ��� �Ϸù�ȣ
mem_idx					int				not null,		--��� �Ϸù�ȣ
review_idx				int				not null,		--����� �Ϸù�ȣ
review_reply_content 	varchar2(500)	not null,		--������ ����
review_reply_regdate 	date			not null,		--������ ��Ͻð�
review_reply_ip			varchar2(100)	not null		--������ip
)


--�⺻Ű
alter table review_reply
 add constraint pk_review_review_reply_idx primary key(review_reply_idx);
 
--�ܷ�Ű
alter table review_reply
 add constraint fk_review_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--�ܷ�Ű
alter table review_reply
 add constraint fk_review_reply__idx foreign key(review_idx)
          references review(review_idx);
          
                    
          
-----------------------[  REVIEW_LIKE ]------------------------------------------ 


--������
create sequence seq_review_like_idx;
		
create table review_like
(
review_like_idx		int,							--����� ���ƿ� �Ϸù�ȣ
mem_idx				int		not null,				--��� �Ϸù�ȣ
review_idx			int		not null,				--����� �Ϸù�ȣ
review_like_check	int		default 0 not null		--����� ���ƿ� üũ
)


--�⺻Ű
alter table review_like
 add constraint pk_review_like_review_like_idx primary key(review_like_idx);


--�ܷ�Ű
alter table review_like
 add constraint fk_review_like_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--�ܷ�Ű
alter table review_like
 add constraint fk_review_like_idx foreign key(review_idx)
          references review(review_idx);
          
          
          
-----------------------[  REVIEW_REPLY_LIKE ]------------------------------------------           


--������
create sequence seq_review_reply_like_idx;       

      
create table review_reply_like
(
review_reply_like_idx	int,						--������ ���ƿ� �Ϸù�ȣ
mem_idx					int		not null,			--����Ϸù�ȣ
review_reply_idx		int		not null,			--������ �Ϸù�ȣ
review_reply_like_check int		default 0 not null	--����� ���ƿ� üũ
)


--�⺻��
alter table review_reply_like
 add constraint pk_review_reply_like_idx primary key(review_reply_like_idx);


--�ܷ�Ű
alter table review_reply_like
 add constraint fk_review_reply_like_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--�ܷ�Ű
alter table review_reply_like
 add constraint fk_review_reply_like_idx foreign key(review_reply_idx)
          references review_reply(review_reply_idx);
          
         
          
-----------------------[  CARPOOL ]------------------------------------------ 


--������
create sequence seq_carpool_idx;

create table carpool
(
carpool_idx			int,								--īǮ�� �Ϸù�ȣ
category_idx		int,								--ī�װ� �Ϸù�ȣ
mem_idx				int,								--��� �Ϸù�ȣ
carpool_title		varchar2(100)	not null,			--īǮ�� ����
carpool_content		varchar2(2000)	not null,			--īǮ�� ����
carpool_regdate		date			not null,			--īǮ�� �����
carpool_hit_count	int				default 0 not null,	--īǮ�� ��ȸ��
carpool_like_count	int				default 0 not null,	--īǮ�� ���ƿ� ��
carpool_ip			varchar2(100)	not null			--�۾� ��� ip
)

--�⺻��
alter table carpool
 add constraint pk_carpool_carpool_idx primary key(carpool_idx);

--�ܷ�Ű
alter table carpool
 add constraint fk_carpool_carpool_idx foreign key(category_idx)
          references category(category_idx);
         
--�ܷ�Ű
alter table carpool
 add constraint fk_carpool_carpool_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
         
-----------------------[  CARPOOL_REPLY ]------------------------------------------ 
 
--������ 
create sequence seq_carpool_reply_idx; 
                 
create table carpool_reply
(
carpool_reply_idx		int,							--īǮ ��� �Ϸù�ȣ
mem_idx					int		not null,				--��� �Ϸù�ȣ
carpool_idx				int		not null,				--īǮ�� �Ϸù�ȣ
carpool_reply_content 	varchar2(500)	not null,		--īǮ��� ����
carpool_reply_regdate 	date	not null,				--īǮ��� ��Ͻð�
carpool_reply_ip		varchar2(100)	not null		--īǮ���ip
)


--�⺻Ű
alter table carpool_reply
 add constraint pk_carpool_carpool_reply_idx primary key(carpool_reply_idx);

--�ܷ�Ű
alter table carpool_reply
 add constraint fk_carpool_reply_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--�ܷ�Ű
alter table carpool_reply
 add constraint fk_carpool_reply_idx foreign key(carpool_idx)
          references carpool(carpool_idx);
   
     
-----------------------[  CARPOOL_LIKE ]------------------------------------------ 
      
--������
create sequence seq_carpool_like_idx; 
  
create table carpool_like
(
carpool_like_idx	int,							--īǮ�� ���ƿ� �Ϸù�ȣ
mem_idx				int		not null,				--��� �Ϸù�ȣ
carpool_idx			int		not null,				--īǮ�� �Ϸù�ȣ
carpool_like_check	int		default 0 not null		--īǮ�� ���ƿ� üũ
)


--�⺻Ű
alter table carpool_like
 add constraint pk_carpool_like_idx primary key(carpool_like_idx);
 
--�ܷ�Ű
alter table carpool_like
 add constraint fk_carpool_like_mem_idx foreign key(mem_idx)
          references member(mem_idx);
 
--�ܷ�Ű
alter table carpool_like
 add constraint fk_carpool_like_idx foreign key(carpool_idx)
          references carpool(carpool_idx);
          
          
-----------------------[  CAPPOOL_REPLY_LIKE ]------------------------------------------ 
 
--������
create sequence seq_carpool_reply_like_idx;
 
create table carpool_reply_like
(
carpool_reply_like_idx		int,						--īǮ��� ���ƿ� �Ϸù�ȣ
mem_idx						int		not null,			--����Ϸù�ȣ
carpool_reply_idx			int		not null,			--īǮ��� �Ϸù�ȣ
carpool_reply_like_check	int		default 0 not null	--īǮ�� ���ƿ� üũ
)


--�⺻Ű
alter table carpool_reply_like
 add constraint pk_carpool_reply_like_idx primary key(carpool_reply_like_idx);
 
--�ܷ�Ű
alter table carpool_reply_like
 add constraint fk_carpool_reply_like_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--�ܷ�Ű
alter table carpool_reply_like
 add constraint fk_carpool_reply_like_idx foreign key(carpool_reply_idx)
          references carpool_reply(carpool_reply_idx);
          
          
          
-----------------------[  MARKET ]------------------------------------------ 


--������
create sequence seq_market_idx;


create table market
(
market_idx			int,								--���ϱ� �Ϸù�ȣ
category_idx		int,								--ī�װ� �Ϸù�ȣ
mem_idx				int,								--��� �Ϸù�ȣ
market_title		varchar2(100)	not null,			--���ϱ� ����
market_content		varchar2(2000)	not null,			--���ϱ� ����
market_regdate		date			not null,			--���ϱ� �����
market_hit_count	int				default 0 not null,	--���ϱ� ��ȸ��
market_like_count	int				default 0 not null,	--���ϱ� ���ƿ� ��
market_thumbnail	varchar2(500),						--���ϱ� �����
market_ip			varchar2(100)	not null,			--�۾� ���ip
market_buy_sell		varchar2(50)	not null			--��ϴ�/�˴ϴ�/����
)


--�⺻Ű
alter table market
 add constraint pk_market_market_idx primary key(market_idx);
 
--�ܷ�Ű
alter table market
 add constraint fk_market_idx foreign key(category_idx)
          references category(category_idx);
          
--�ܷ�Ű
alter table market
 add constraint fk_market_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--��ϴ� �˴ϴ� ���� üũ����
alter table market 
add constraint check_market_buy_sell check(market_buy_sell='��ϴ�'or market_buy_sell='�˴ϴ�' or market_buy_sell='����');


-----------------------[  MARKET_REPLY ]------------------------------------------ 


--������
create sequence seq_market_reply_idx;

create table market_reply
(
market_reply_idx		int,							--���� ��� �Ϸù�ȣ
mem_idx					int		not null,				--��� �Ϸù�ȣ
market_idx				int		not null,				--���ϱ� �Ϸù�ȣ
market_reply_content 	varchar2(500)	not null,		--���ϴ�� ����
market_reply_regdate 	date	not null,				--���ϴ�� ��Ͻð�
market_reply_ip			varchar2(100)	not null		--���ϴ��ip
)
--�⺻Ű
alter table market_reply
 add constraint pk_market_reply_idx primary key(market_reply_idx);
 
--�ܷ�Ű
alter table market_reply
 add constraint fk_market_reply_mem_idx foreign key(mem_idx)
          references member(mem_idx);
 
--�ܷ�Ű
alter table market_reply
 add constraint fk_market_reply_idx foreign key(market_idx)
          references market(market_idx);
          
          
          
-----------------------[ MARKET_LIKE ]------------------------------------------ 
--������
create sequence seq_market_like_idx;
create table market_like
(
market_like_idx		int,							--���ϱ� ���ƿ� �Ϸù�ȣ
mem_idx				int		not null,				--��� �Ϸù�ȣ
market_idx			int		not null,				--���ϱ� �Ϸù�ȣ
market_like_check	int		default 0  not null		--���ϱ� ���ƿ� üũ
)
--�⺻Ű
alter table market_like
 add constraint pk_market_like_idx primary key(market_like_idx);
 
--�ܷ�Ű
alter table market_like
 add constraint fk_market_like_mem_idx foreign key(mem_idx)
          references member(mem_idx);
--�ܷ�Ű
alter table market_like
 add constraint fk_market_like_idx foreign key(market_idx)
          references market(market_idx);
          
          
          
-----------------------[ MARKET_REPLY_LIKE ]------------------------------------------ 
--������
create sequence seq_market_reply_like_idx;
create table market_reply_like
(
market_reply_like_idx		int,						--���ϴ�� ���ƿ� �Ϸù�ȣ
mem_idx						int		not null,			--����Ϸù�ȣ
market_reply_idx			int		not null,			--���ϴ�� �Ϸù�ȣ
market_reply_like_check		int		default 0 not null	--���ϱ� ���ƿ� üũ
)

--�⺻Ű
alter table market_reply_like
 add constraint pk_market_reply_like_idx primary key(market_reply_like_idx);
--�ܷ�Ű
alter table market_reply_like
 add constraint fk_market_reply_like_mem_idx foreign key(mem_idx)
          references member(mem_idx);
          
--�ܷ�Ű
alter table market_reply_like
 add constraint fk_market_reply_like_idx foreign key(market_reply_idx)
          references market_reply(market_reply_idx);
          
          
*/
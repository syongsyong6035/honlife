-- =====================================================
-- honlife MySQL 8.0 Data (IDENTITY 전략 호환)
-- =====================================================


-- 1. MEMBER 테이블
INSERT INTO MEMBER (role, email, password, name, nickname, residence_experience, region1dept, region2dept, region3dept, is_verified, created_at, updated_at, is_active) VALUES
('ROLE_ADMIN', 'admin@test.com', '{bcrypt}$2a$10$iC0JoLYyZ1kflTuNTtVsr.3rKS0Hl7jaCe4xjSxMWbFcYd0DOb0AO', '관리자', '관리자', NULL, NULL, NULL, NULL, TRUE, NULL, NULL, TRUE);
INSERT INTO MEMBER (role, email, password, name, nickname, residence_experience, region1dept, region2dept, region3dept, is_verified, created_at, updated_at, is_active) VALUES
('ROLE_USER', 'user01@test.com', '{bcrypt}$2a$10$RScW/24nY32vqhHs6tlxYe7964v8rJLWPpnP1KSr6Np9oTfSYPd3C', '홍길동', '닉네임1', 'OVER_10Y', '서울특별시', '강북구', '미아동', TRUE, '2025-06-01 10:15:00', '2025-06-01 10:15:00', TRUE);
INSERT INTO MEMBER (role, email, password, name, nickname, residence_experience, region1dept, region2dept, region3dept, is_verified, created_at, updated_at, is_active) VALUES
('ROLE_USER', 'user02@test.com', '{bcrypt}$2a$10$4dTVUJL9Rp/b8.q3upjZIuIewKcu6cBTlzskYQnasQZfZoI5RtgMK', '김영희', '닉네임2', 'Y1_TO_3', '서울특별시', '강북구', '수유1동', TRUE, '2025-06-03 09:00:00', '2025-06-05 18:30:00', TRUE);
INSERT INTO MEMBER (role, email, password, name, nickname, residence_experience, region1dept, region2dept, region3dept, is_verified, created_at, updated_at, is_active) VALUES
('ROLE_USER', 'user03@test.com', '{bcrypt}$2a$10$RScW/24nY32vqhHs6tlxYe7964v8rJLWPpnP1KSr6Np9oTfSYPd3C', '박철수', '닉네임3', 'UNDER_1Y', '서울특별시', '강남구', '역삼동', TRUE, '2025-07-14 10:00:00', '2025-07-14 10:00:00', TRUE);

-- 2. CATEGORY 테이블 (개별 INSERT - MySQL이 순서대로 ID 부여)
-- [CATEGORY ID = INSERT 순번]
-- Member 1의 기본 카테고리:
--   INSERT 1번 = ID 1 = 청소/정리 (type=DEFAULT)
--   Insert 2번 = ID 2 = 세탁/의류 (type=DEFAULT)
--   Insert 3번 = ID 3 = 쓰레기/환경 (type=DEFAULT)
--   Insert 4번 = ID 4 = 요리 (type=DEFAULT)
--   Insert 5번 = ID 5 = 소비 (type=DEFAULT)
--   Insert 6번 = ID 6 = 행정 (type=DEFAULT)
--   Insert 7번 = ID 7 = 건강 (type=DEFAULT)
--   Insert 8번 = ID 8 = 자기개발 (type=DEFAULT)
--   Insert 9번 = ID 9 = 외출 (type=DEFAULT)
--   Insert 10번 = ID 10 = 기타 (type=DEFAULT)
-- Member 2의 커스텀 카테고리:
--   Insert 11번 = ID 11 = 화장실 청소 (parent_id=1 → 청소/정리)
--   Insert 12번 = ID 12 = 속옷 세탁 (parent_id=2 → 세탁/의류)
--   Insert 13번 = ID 13 = 음식물 쓰레기 (parent_id=3 → 쓰레기/환경)
--   Insert 14번 = ID 14 = 영양제 (parent_id=7 → 건강)
--   Insert 15번 = ID 15 = 강아지 산책 (parent_id=8 → 자기개발)
-- Member 3의 커스텀 카테고리:
--   Insert 16번 = ID 16 = 고양이 (type=MAJOR)
--   Insert 17번 = ID 17 = 헬스 (type=MAJOR)
--   Insert 18번 = ID 18 = 스트레칭 (parent_id=16 → 고양이)
--   Insert 19번 = ID 19 = 런닝 (parent_id=16 → 고양이)
--   Insert 20번 = ID 20 = 침구 정리 (parent_id=1 → 청소/정리)

INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '🧹', '청소/정리', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '🧺', '세탁/의류', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '♻️', '쓰레기/환경', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '🍳', '요리', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '💸', '소비', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '📄', '행정', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '🏃🏻', '건강', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '💡', '자기개발', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '👜', '외출', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (1, NULL, '🗃️', '기타', 'DEFAULT', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (2, 1, '🚽', '화장실 청소', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (2, 2, '👙', '속옷 세탁', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (2, 3, '🗑️', '음식물 쓰레기', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (2, 7, '💊', '영양제', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (2, 8, '🐶', '강아지 산책', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (3, NULL, '🐈', '고양이', 'MAJOR', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (3, NULL, '🏋', '헬스', 'MAJOR', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (3, 16, '🙆🏻‍♂️', '스트레칭', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (3, 16, '🏃🏻', '런닝', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO CATEGORY (member_id, parent_id, emoji, name, type, created_at, updated_at, is_active) VALUES (3, 1, '🛏️', '침구 정리', 'SUB', '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);

-- 3. ROUTINE_PRESET 테이블
-- category_id = CATEGORY INSERT 순번
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(1, '방 청소하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(2, '빨래하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(3, '분리수거하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(4, '아침 준비하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(5, '가계부 작성하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(6, '우편물 확인하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(7, '운동하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(8, '독서하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');
INSERT INTO ROUTINE_PRESET (category_id, content, is_active, created_at, updated_at, is_important, trigger_time, repeat_term, repeat_type, repeat_value) VALUES
(9, '산책하기', TRUE, '2025-01-01 00:00:00', '2025-01-01 00:00:00', FALSE, '08:00', 1, 'DAILY', '1');

-- 4. ROUTINE 테이블
-- category_id = CATEGORY INSERT 순번
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 7, '물 마시기', '눈 뜨자마자', TRUE, 'DAILY', NULL, TRUE, '2025-06-01', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 7, '일찍 자기', '23:00', TRUE, 'DAILY', NULL, TRUE, '2025-06-01', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 4, '아침 준비하기', '07:30', FALSE, 'WEEKLY', '1,3,5', TRUE, '2025-06-02', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 2, '빨래하기', '10:00', FALSE, 'WEEKLY', '7', TRUE, '2025-06-03', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 6, '공과금 납부하기', '10:00', TRUE, 'MONTHLY', '5', TRUE, '2025-06-07', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 9, '장보기', '11:00', FALSE, 'WEEKLY', '1,5', TRUE, '2025-06-09', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 1, '부엌 정리하기', '21:30', FALSE, 'WEEKLY', '3,7', TRUE, '2025-06-20', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 8, '명상하기', '06:30', TRUE, 'WEEKLY', '1,3,5', TRUE, '2025-06-23', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(2, 5, '가계부 작성하기', '21:00', FALSE, 'MONTHLY', '1,15', TRUE, '2025-06-08', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 7, '스트레칭하기', '07:00', TRUE, 'DAILY', NULL, TRUE, '2025-06-10', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 8, '일기 쓰기', '22:30', FALSE, 'DAILY', NULL, TRUE, '2025-06-10', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 1, '화장실 청소하기', '13:00', FALSE, 'WEEKLY', '7', TRUE, '2025-06-12', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 4, '설거지하기', '20:00', FALSE, 'DAILY', NULL, TRUE, '2025-06-11', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 2, '빨래 개기', '15:00', FALSE, 'WEEKLY', '1,4', TRUE, '2025-06-13', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 3, '쓰레기 버리기', '08:30', FALSE, 'WEEKLY', '2,5', TRUE, '2025-06-14', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 9, '산책하기', '17:30', TRUE, 'WEEKLY', '1,3,5,7', TRUE, '2025-06-15', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 8, '독서하기', '21:00', TRUE, 'WEEKLY', '6,7', TRUE, '2025-06-18', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 4, '저녁 준비하기', '18:30', TRUE, 'WEEKLY', '1,2,3,4,5', TRUE, '2025-06-21', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(3, 6, '우편물 확인하기', '09:00', FALSE, 'WEEKLY', '1', TRUE, '2025-06-22', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(4, 16, '고양이 화장실 청소', '09:00', FALSE, 'DAILY', NULL, TRUE, '2025-07-01', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(4, 17, '헬스장 가기', '18:00', TRUE, 'WEEKLY', '2,4,6', TRUE, '2025-07-03', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(4, 17, '스트레칭', '07:30', TRUE, 'DAILY', NULL, TRUE, '2025-07-04', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(4, 17, '런닝머신 뛰기', '08:00', FALSE, 'WEEKLY', '1,3,5', TRUE, '2025-07-05', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');
INSERT INTO ROUTINE (member_id, category_id, content, trigger_time, is_important, repeat_type, repeat_value, is_active, init_date, repeat_term, created_at, updated_at) VALUES
(4, 8, '고양이와 놀기', '20:00', FALSE, 'MONTHLY', '15', TRUE, '2025-07-07', 1, '2025-07-23 04:21:56', '2025-07-23 04:21:56');

-- 5. INTEREST_CATEGORY 테이블
-- category_id = CATEGORY INSERT 순번
INSERT INTO INTEREST_CATEGORY (member_id, category_id, created_at, updated_at, is_active) VALUES
(2, 1, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO INTEREST_CATEGORY (member_id, category_id, created_at, updated_at, is_active) VALUES
(2, 2, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO INTEREST_CATEGORY (member_id, category_id, created_at, updated_at, is_active) VALUES
(2, 3, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO INTEREST_CATEGORY (member_id, category_id, created_at, updated_at, is_active) VALUES
(3, 2, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO INTEREST_CATEGORY (member_id, category_id, created_at, updated_at, is_active) VALUES
(3, 5, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);

-- 6. MEMBER_POINT 테이블
INSERT INTO MEMBER_POINT (member_id, point, created_at, updated_at, is_active) VALUES
(2, 500, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO MEMBER_POINT (member_id, point, created_at, updated_at, is_active) VALUES
(3, 12500, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);

-- 7. POINT_POLICY 테이블
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
(NULL, 'ROUTINE', 50, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('CLEAN_BRONZE', 'BADGE', 100, '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('LAUNDRY_BRONZE', 'BADGE', 100, '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('HEALTH_BRONZE', 'BADGE', 100, '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('weekly_clean_count_1', 'WEEKLY', 50, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('weekly_clothes_count_2', 'WEEKLY', 50, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('weekly_health_count_3', 'WEEKLY', 50, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);
INSERT INTO POINT_POLICY (reference_key, type, point, created_at, updated_at, is_active) VALUES
('event_2025_summer_login', 'EVENT', 100, '2025-02-03 07:45:00', '2025-02-03 07:45:00', TRUE);

-- 8. WEEKLY_QUEST 테이블
-- category_id = CATEGORY INSERT 순번
--   INSERT 1번 = ID 1 = 청소/정리
--   INSERT 2번 = ID 2 = 세탁/의류
--   INSERT 3번 = ID 3 = 쓰레기/환경
--   INSERT 4번 = ID 4 = 요리
--   INSERT 5번 = ID 5 = 소비
--   INSERT 6번 = ID 6 = 행정
--   INSERT 7번 = ID 7 = 건강 ✓ (WEEKLY_QUEST category_id 7번이 참조하는 바로 그 카테고리)
--   INSERT 8번 = ID 8 = 자기개발
--   INSERT 9번 = ID 9 = 외출
INSERT INTO WEEKLY_QUEST (category_id, quest_key, name, type, target, created_at, updated_at, is_active) VALUES
(1, 'weekly_clean_count_1', '청소 루틴 1번 이상 완료', 'CATEGORY_COUNT', 1, NOW(), NOW(), TRUE);
INSERT INTO WEEKLY_QUEST (category_id, quest_key, name, type, target, created_at, updated_at, is_active) VALUES
(2, 'weekly_clothes_count_2', '세탁 루틴 2번 이상 완료', 'CATEGORY_COUNT', 2, NOW(), NOW(), TRUE);
INSERT INTO WEEKLY_QUEST (category_id, quest_key, name, type, target, created_at, updated_at, is_active) VALUES
(NULL, 'weekly_login_streak_3', '연속 3일 로그인', 'LOGIN_STREAK', 3, NOW(), NOW(), TRUE);
INSERT INTO WEEKLY_QUEST (category_id, quest_key, name, type, target, created_at, updated_at, is_active) VALUES
(NULL, 'weekly_complete', '하루 이상 루틴 완료율 100% 달성', 'COMPLETE_COUNT', 1, NOW(), NOW(), TRUE);
INSERT INTO WEEKLY_QUEST (category_id, quest_key, name, type, target, created_at, updated_at, is_active) VALUES
(7, 'weekly_health_count_3', '건강 루틴 3번 완료', 'CATEGORY_COUNT', 3, NOW(), NOW(), TRUE);

-- 9. EVENT_QUEST 테이블
-- category_id = CATEGORY INSERT 순번
INSERT INTO EVENT_QUEST (category_id, event_key, name, type, target, start_date, end_date, created_at, updated_at, is_active) VALUES
(NULL, 'event_2025_summer_login', '무더위에도 inúmer한 루틴 실천! 매일 출석 이벤트', 'LOGIN_COUNT', 7, '2025-07-24', '2025-07-31', NOW(), NOW(), TRUE);
INSERT INTO EVENT_QUEST (category_id, event_key, name, type, target, start_date, end_date, created_at, updated_at, is_active) VALUES
(1, 'event_summer_icebox', '여름철 식중독 예방을 위한 냉장고 정리 미션!', 'CATEGORY_COUNT', 7, '2025-07-24', '2025-07-31', NOW(), NOW(), TRUE);

-- 10. EVENT_QUEST_PROGRESS 테이블
INSERT INTO EVENT_QUEST_PROGRESS (member_id, event_quest_id, progress, is_done, created_at, updated_at, is_active) VALUES
(2, 1, 0, FALSE, '2025-07-27 23:59:59', '2025-07-27 23:59:59', TRUE);

-- 11. BADGE 테이블
-- category_id = CATEGORY INSERT 순번
INSERT INTO BADGE (category_id, badge_key, name, tier, message, requirement, info, created_at, updated_at, is_active) VALUES
(1, 'CLEAN_BRONZE', '먼지털이 초보', 'BRONZE', '청소/정리를 시작했어요!', 5, '청소/정리 루틴 5회 달성', '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO BADGE (category_id, badge_key, name, tier, message, requirement, info, created_at, updated_at, is_active) VALUES
(2, 'LAUNDRY_BRONZE', '빨래 초보', 'BRONZE', '빨래를 시작했어요!', 5, '세탁/의류 루틴 5회 달성', '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO BADGE (category_id, badge_key, name, tier, message, requirement, info, created_at, updated_at, is_active) VALUES
(7, 'HEALTH_BRONZE', '건강 새싹', 'BRONZE', '건강을 챙기기 시작했어요!', 5, '건강 루틴 5회 달성', '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO BADGE (category_id, badge_key, name, tier, message, requirement, info, created_at, updated_at, is_active) VALUES
(NULL, 'STREAK_BRONZE', '혼라이프 입문자', 'BRONZE', '3일 연속 접속! 시작이 반이죠!', 3, '연속 접속 3일 달성', '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);
INSERT INTO BADGE (category_id, badge_key, name, tier, message, requirement, info, created_at, updated_at, is_active) VALUES
(NULL, 'STREAK_SILVER', '혼라이프 루틴 요정', 'SILVER', '일주일 동안 빠짐없이 접속했어요!', 7, '연속 접속 7일 달성', '2025-07-01 00:00:00', '2025-07-01 00:00:00', TRUE);

-- 12. MEMBER_BADGE 테이블
-- badge_id = BADGE INSERT 순번
INSERT INTO MEMBER_BADGE (member_id, badge_id, created_at, updated_at, is_active) VALUES
(3, 1, NOW(), NOW(), TRUE);
INSERT INTO MEMBER_BADGE (member_id, badge_id, created_at, updated_at, is_active) VALUES
(2, 2, NOW(), NOW(), TRUE);
INSERT INTO MEMBER_BADGE (member_id, badge_id, created_at, updated_at, is_active) VALUES
(2, 3, NOW(), NOW(), TRUE);

-- 13. ITEM 테이블
INSERT INTO ITEM (item_key, name, price, type, created_at, updated_at, is_active, is_listed, description) VALUES
('top_item_01', '청소 상의', 100, 'TOP', '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE, TRUE, '먼지가 달라 붙지 않아요!');
INSERT INTO ITEM (item_key, name, price, type, created_at, updated_at, is_active, is_listed, description) VALUES
('top_item_02', '요리 상의', 100, 'TOP', '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE, TRUE, '셰프의 혼이 깃든 귀여운 요리를 만들어줘요');
INSERT INTO ITEM (item_key, name, price, type, created_at, updated_at, is_active, is_listed, description) VALUES
('bottom_item_01', '청소 바지', 100, 'BOTTOM', '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE, TRUE, '활동성이 뛰어난 청소 전용 바지');
INSERT INTO ITEM (item_key, name, price, type, created_at, updated_at, is_active, is_listed, description) VALUES
('bottom_item_02', '요리 바지', 100, 'BOTTOM', '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE, TRUE, '주방에서 빛나는 요리사의 바지');
INSERT INTO ITEM (item_key, name, price, type, created_at, updated_at, is_active, is_listed, description) VALUES
('accessory_item_01', '청소 마스크', 100, 'ACCESSORY', '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE, TRUE, '먼지 하나 용납 못하는 클린 마스크');
INSERT INTO ITEM (item_key, name, price, type, created_at, updated_at, is_active, is_listed, description) VALUES
('accessory_item_02', '요리 후라이팬', 100, 'ACCESSORY', '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE, TRUE, '이걸로 요리하면 무조건 맛있어요');

-- 14. MEMBER_ITEM 테이블
-- item_id = ITEM INSERT 순번
INSERT INTO MEMBER_ITEM (item_id, member_id, is_equipped, created_at, updated_at, is_active) VALUES
(1, 2, FALSE, '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE);
INSERT INTO MEMBER_ITEM (item_id, member_id, is_equipped, created_at, updated_at, is_active) VALUES
(2, 2, FALSE, '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE);
INSERT INTO MEMBER_ITEM (item_id, member_id, is_equipped, created_at, updated_at, is_active) VALUES
(3, 2, FALSE, '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE);
INSERT INTO MEMBER_ITEM (item_id, member_id, is_equipped, created_at, updated_at, is_active) VALUES
(4, 2, FALSE, '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE);
INSERT INTO MEMBER_ITEM (item_id, member_id, is_equipped, created_at, updated_at, is_active) VALUES
(5, 2, FALSE, '2025-04-04 21:30:00', '2025-04-10 06:15:00', TRUE);

-- 15. NOTIFICATION 테이블
INSERT INTO NOTIFICATION (member_id, is_quest, is_routine, is_badge) VALUES
(2, TRUE, TRUE, TRUE);
INSERT INTO NOTIFICATION (member_id, is_quest, is_routine, is_badge) VALUES
(3, TRUE, TRUE, TRUE);
INSERT INTO NOTIFICATION (member_id, is_quest, is_routine, is_badge) VALUES
(4, TRUE, TRUE, TRUE);

-- 16. BADGE_PROGRESS 테이블
INSERT INTO BADGE_PROGRESS (member_id, progress_type, progress_key, count_type, count_value, last_date, created_at, updated_at, is_active) VALUES
(2, 'CATEGORY', '1', 'CUMULATIVE', 100, '2025-01-20', NOW(), NOW(), TRUE);
INSERT INTO BADGE_PROGRESS (member_id, progress_type, progress_key, count_type, count_value, last_date, created_at, updated_at, is_active) VALUES
(2, 'CATEGORY', '2', 'CUMULATIVE', 1, '2025-01-20', NOW(), NOW(), TRUE);
INSERT INTO BADGE_PROGRESS (member_id, progress_type, progress_key, count_type, count_value, last_date, created_at, updated_at, is_active) VALUES
(2, 'LOGIN', 'DAILY', 'STREAK', 7, '2025-01-25', NOW(), NOW(), TRUE);

-- 17. WITHDRAW_REASON 테이블
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-05-25 18:30:44.000000', '1입니다', 'ETC');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-05-25 18:31:44.000000', '2입니다', 'ETC');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-25 18:34:44.000000', '5입니다', 'ETC');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-25 19:30:44.000000', '11입니다', 'ETC');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-25 19:30:44.000000', NULL, 'TOO_MUCH_EFFORT');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-25 19:30:44.000000', NULL, 'ROUTINE_MISMATCH');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-25 19:30:44.000000', NULL, 'UX_ISSUE');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-25 19:30:44.000000', NULL, 'NO_MOTIVATION');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-01 10:30:00', NULL, 'TOO_MUCH_EFFORT');
INSERT INTO WITHDRAW_REASON (created_at, reason, type) VALUES
('2025-07-02 15:20:00', '앱 사용이 복잡해요', 'ETC');

-- 18. NOTIFY_LIST 테이블
INSERT INTO notify_list (type, name, is_read, member_id, created_at, updated_at, is_active) VALUES
('BADGE', '물 30일 연속 마기기 업적을 달성했습니다!', FALSE, 2, '2025-07-28 10:00:00', '2025-07-28 10:00:00', TRUE);
INSERT INTO notify_list (type, name, is_read, member_id, created_at, updated_at, is_active) VALUES
('ROUTINE', '오늘 완료하지 않은 루틴이 2개 있습니다', FALSE, 2, '2025-07-28 12:00:00', '2025-07-28 12:00:00', TRUE);
INSERT INTO notify_list (type, name, is_read, member_id, created_at, updated_at, is_active) VALUES
('QUEST', '주간 퀘스트 "일찍 자기"를 완료했어요!', FALSE, 2, '2025-07-27 09:00:00', '2025-07-27 09:00:00', TRUE);

-- 19. LOGIN_LOG 테이블
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-01 09:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-01 14:20:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-07-01 19:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-02 08:15:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-02 16:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-03 10:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-07-03 18:20:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-04 11:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-04 15:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-07-04 20:10:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-05 07:50:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-05 13:25:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-06-28 09:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-06-29 14:20:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-06-30 19:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-25 09:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-25 14:20:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-07-25 19:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-26 08:15:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-26 16:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-27 10:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-07-27 18:20:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (2, '2025-07-28 11:30:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (3, '2025-07-28 15:45:00');
INSERT INTO LOGIN_LOG (member_id, time) VALUES (4, '2025-07-29 09:20:00');

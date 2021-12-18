
-- 2-1. film 테이블을 활용하여 film 테이블의 100개의 row만 확인해보세요.
select *
from film f
limit 100

-- 2-2. actor의 성(last_name)이 Jo로 시작하는 사람의 id 값이 가장 낮은 사람 한 사람에 대하여, 사람의 id 값과 이름, 성을 알려주세요.
select actor_id , first_name , last_name 
from actor a
where last_name like 'Jo%' 
order by actor_id 
limit 1

-- 2-3. film 테이블을 이용하여, film 테이블의 아이디 값이 1~10 사이에 있는 모든 컬럼을 확인해주세요.
-- 1과 10도 포함인지 불포함인지 모호하다.
-- between은 범위 양 끝 수도 포함한다.
select *
from film f 
where film_id between 1 and 10 

-- 2-4. country 테이블을 이용하여, country 이름이 A로 시작하는 country를 확인해주세요.
-- 테이블과 컬럼명이 모두 country로 같아서, 테이블의 모든 정보를 출력하는 것인지 country 컬럼만 출력하는 것인지 모호하다.
select *
from country c 
where country like 'A%'

-- 2-5. country 테이블을 이용하여, country 이름이 s로 끝나는 country를 확인해주세요.
select *
from country c 
where country like '%s'
-- 대문자 S로 끝나는 데이터도 확인하고 싶다면 lower() 적용 
select *
from country c 
where lower(country) like '%s'


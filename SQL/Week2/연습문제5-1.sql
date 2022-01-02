
-- 5-1. 영화 배우가 영화 180분 이상의 길이의 영화에 출연하거나,영화의 rating이 R인 등급에 해당하는 영화에 출연한 영화 배우에 대해서, 영화 배우 ID와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.
-- film_actor 테이블와 film 테이블을 이용하세요.
-- union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
-- actor_id가 동일한 flag값이 여러 개 나오지 않도록 해주세요.
select actor_id , 'length_flag' as flag
from film_actor fa 
where film_id in (
select film_id 
from film f
where length>=180)
union 
select actor_id , 'rating_flag' as flag 
from film_actor fa2
where film_id in (
select film_id 
from film f2
where rating='R')


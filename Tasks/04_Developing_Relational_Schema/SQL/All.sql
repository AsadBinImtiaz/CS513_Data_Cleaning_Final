-- Consolidate Dish Names
DROP TABLE IF EXISTS Dish_Temp
;

CREATE TABLE IF NOT EXISTS Dish_Temp AS 
select  
          name 
        , id old_id 
        , min(id) over (partition by name order by id) new_id 
        , menus_appeared 
        , max(menus_appeared) over (partition by name ) new_menus_appeared 
        , times_appeared  
        , max(times_appeared) over (partition by name ) new_times_appeared  
        , first_appeared  
        , min(case when first_appeared = 0 then 9999 else first_appeared end) over (partition by name ) new_first_appeared  
        , last_appeared      
        , max(last_appeared) over (partition by name ) new_last_appeared   
        , lowest_price     
        , min(lowest_price) over (partition by name ) new_lowest_price   
        , highest_price     
        , max(highest_price) over (partition by name ) new_highest_price       
from Dish_New 
WHERE name not like '%"%' 
and name in 
( 
        select name from dish group by 1 having count(*) > 1 
)  
; 

WITH X as 
( 
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name <'A' 
) 
UPDATE MenuItem_New 
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id) 
where id IN (Select id from X) 
; 

WITH X as 
( 
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id
        where D.name >='A'
        and D.name < 'B' 
) 
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='B'
        and D.name < 'D'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='D'
        and D.name < 'F'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='F'
        and D.name < 'H'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='H'
        and D.name < 'K'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='K'
        and D.name < 'M'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='M'
        and D.name < 'P'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='P'
        and D.name < 'S'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='S'
        and D.name < 'W'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='W'
        and D.name < 'Z'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='Z'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

DELETE FROM Dish_New where Id in
(select old_id from Dish_Temp where old_id <> new_id)
;

DELETE FROM Dish_Temp where old_id <> new_id
;

WITH X as
(
        Select old_id, new_id, new_menus_appeared, new_times_appeared, new_first_appeared, new_last_appeared, new_lowest_price, new_highest_price 
        from Dish_Temp
)
UPDATE Dish_New
SET menus_appeared = (select new_menus_appeared from X where X.Old_Id = dish_New.id)
,times_appeared = (select new_times_appeared from X where X.Old_Id = dish_New.id)
,first_appeared = (select new_first_appeared from X where X.Old_Id = dish_New.id)
,last_appeared  = (select new_last_appeared  from X where X.Old_Id = dish_New.id)
,lowest_price   = (select new_lowest_price   from X where X.Old_Id = dish_New.id)
,highest_price  = (select new_highest_price  from X where X.Old_Id = dish_New.id)
where id in (Select old_id from X)
;




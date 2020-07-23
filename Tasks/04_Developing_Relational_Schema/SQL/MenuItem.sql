DROP TABLE IF EXISTS MenuItem_New
;

CREATE TABLE IF NOT EXISTS MenuItem_New
(
        id INTEGER NOT NULL PRIMARY KEY, 	
        menu_page_id INTEGER NOT NULL, 
        price NUMERIC NULL,
        high_price NUMERIC NULL,
        dish_id	INTEGER NOT NULL,
        created_at Timestamp(0) NULL,
        updated_at Timestamp(0) NULL,	
        xpos NUMERIC NULL, 	
        ypos NUMERIC NULL,
        FOREIGN KEY (menu_page_id) REFERENCES menupage (id) ,
        FOREIGN KEY (dish_id) REFERENCES dish (id) 
)
;


INSERT INTO MenuItem_New
SELECT
         id
        ,menu_page_id
        ,price
        ,high_price
        ,dish_id
        ,created_at
        ,updated_at
        ,xpos
        ,ypos
FROM MenuItem
;

UPDATE MenuItem_New
SET high_price = price
WHERE price > high_price
;

UPDATE MenuItem_New
SET updated_at = created_at
WHERE created_at > updated_at
;

UPDATE MenuItem_New
SET high_price = price
WHERE high_price is null
and price is not null
;

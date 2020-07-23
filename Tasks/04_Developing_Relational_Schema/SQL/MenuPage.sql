DROP TABLE IF EXISTS MenuPage_New
;

CREATE TABLE IF NOT EXISTS MenuPage_New
(
        id INTEGER NOT NULL PRIMARY KEY, 	
        menu_id  INTEGER NOT NULL, 
        page_number INTEGER NOT NULL,
        image_id INTEGER NULL,
        full_height INTEGER NULL,
        full_width  INTEGER NULL,
        uuid TEXT NULL, 	
        FOREIGN KEY (menu_id) REFERENCES menu (id) 
)
;

DELETE FROM MenuPage_New
;

INSERT INTO MenuPage_New
SELECT
         id
        ,menu_id
        ,page_number
        ,NULLIF(image_id,'')
        ,NULLIF(full_height,'')
        ,NULLIF(full_width,'')
        ,uuid
FROM MenuPage
;


WITH X as
(
        select id, Row_Number() over (partition by menu_id order by id) new_page_id
        from menupage_new x where page_number = -1
)
Update menupage_new
SET Page_number = (select new_page_id from X where menupage_new.id = X.id)
where id in (select id from x)
;


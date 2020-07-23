drop table IF EXISTS Menu_New 
;

CREATE TABLE IF NOT EXISTS Menu_New 
(
  id INTEGER NOT NULL PRIMARY KEY, 
  name TEXT NULL,
  sponsor TEXT NULL,
  event TEXT NULL,
  venue TEXT NULL,
  place TEXT NULL,
  physical_description TEXT NULL,
  occasion TEXT NULL,
  notes TEXT NULL,
  call_number TEXT NULL,
  date date NULL,
  location TEXT NULL,
  currency TEXT NULL,
  currency_symbol TEXT NULL,
  status TEXT Not NULL,
  page_count INTEGER,
  dish_count INTEGER  
)
;

DELETE FROM Menu_New
;

INSERT INTO Menu_New 
SELECT 
 id
,NULLIF(name,'')
,NULLIF(sponsor,'')
,NULLIF(event,'')
,NULLIF(venue,'')
,NULLIF(place,'')
,NULLIF(physical_description,'')
,NULLIF(occasion,'')
,NULLIF(notes,'')
,NULLIF(call_number,'')
,date
,NULLIF(location,'')
,NULLIF(currency,'')
,NULLIF(currency_symbol,'')
,status
,page_count
,dish_count
FROM Menu
;

UPDATE Menu_New
Set Sponsor = '[Not Given]'
where 1=0
OR TRIM(sponsor) = '?'
OR TRIM(sponsor) = ''
;

UPDATE Menu_New
Set name = '[Not Given]'
where 1=0
OR TRIM(name) = '?'
OR TRIM(name) = ''
;

UPDATE Menu_New
Set Sponsor = name
where name is not null
and TRIM(sponsor) = '[Not Given]'
and TRIM(name) <> '[Not Given]'
;

UPDATE Menu_New
Set name = Sponsor 
where sponsor is not null
and COALESCE(TRIM(name), '[Not Given]') = '[Not Given]'
and TRIM(sponsor) <> '[Not Given]'
;

UPDATE Menu_New
Set name = location 
where location is not null
and TRIM(location) <> '[Not Given]'
and coalesce(TRIM(name) , '[Not Given]') = '[Not Given]'
;

UPDATE Menu_New
Set name = place
where place is not null
and TRIM(place) <> '[Not Given]'
and TRIM(place) <> '?'
and TRIM(place) <> ''
and coalesce(TRIM(name) , '[Not Given]') = '[Not Given]'
;

UPDATE Menu_New
Set name = '[Not Given]'
where name is null
;

UPDATE Menu_New
Set Sponsor = '[Not Given]'
where Sponsor is null
;

DROP TABLE IF EXISTS Dish;
CREATE TABLE Dish (id INTEGER NOT NULL, name TEXT NOT NULL, description TEXT, menus_appeared INTEGER, times_appeared INTEGER, first_appeared INTEGER, last_appeared INTEGER, lowest_price NUMERIC, highest_price NUMERIC, PRIMARY KEY (id));

DROP TABLE IF EXISTS Menu;
CREATE TABLE Menu (id INTEGER NOT NULL, name TEXT NOT NULL, sponsor TEXT, event TEXT, venue TEXT, place TEXT, physical_description TEXT, occasion TEXT, notes TEXT, call_number TEXT, keywords TEXT, language TEXT, date TEXT, location TEXT, location_type TEXT, currency TEXT, currency_symbol TEXT, status TEXT, page_count INTEGER, dish_count INTEGER, PRIMARY KEY (id));

DROP TABLE IF EXISTS MenuItem;
CREATE TABLE MenuItem (id INTEGER NOT NULL, menu_page_id INTEGER, price NUMERIC, high_price NUMERIC, dish_id INTEGER, created_at TEXT, updated_at TEXT, xpos NUMERIC, ypos NUMERIC, PRIMARY KEY (id));

DROP TABLE IF EXISTS MenuPage;
CREATE TABLE MenuPage (id INTEGER NOT NULL, menu_id INTEGER, page_number INTEGER, image_id TEXT, full_height INTEGER, full_width INTEGER, updated_at TEXT, uuid TEXT, PRIMARY KEY (id), UNIQUE (uuid));

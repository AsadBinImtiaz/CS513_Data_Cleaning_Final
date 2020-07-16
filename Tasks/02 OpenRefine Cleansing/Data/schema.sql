DROP TABLE Dish;
CREATE TABLE Dish (id INTEGER NOT NULL, name UNKNOWN_TYPE_STRING NOT NULL, menus_appeared INTEGER NOT NULL, times_appeared INTEGER NOT NULL, first_appeared INTEGER NOT NULL, last_appeared INTEGER NOT NULL, lowest_price NUMERIC, highest_price NUMERIC, PRIMARY KEY (id));
DROP TABLE MenuItem;
CREATE TABLE MenuItem (id INTEGER NOT NULL, menu_page_id INTEGER NOT NULL, price NUMERIC, high_price NUMERIC, dish_id INTEGER, created_at TEXT NOT NULL, updated_at TEXT NOT NULL, xpos NUMERIC NOT NULL, ypos NUMERIC NOT NULL, PRIMARY KEY (id));

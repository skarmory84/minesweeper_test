# README

This app was developed with the next technologies.

* Rails version 5.2.6

* Ruby version 2.5.3

Gems used were:

* factory_bot_rails

* Rspec

Database used were

* SQLite

Important decision before starting the app

* I used 2 main models: Minefield and Square

* I won't use a login system

* The game will be indentified with an **UUID**

* It can be endend at any time

## MODELS

### Minefield

It will be the field. It also works as the game itself. It saves information like the game **UUID**, the size of the field, number of mines, etc.

### Square

It works as the squares in the field. They have information like the visualization status, or if there is a mine or an empty space.

## ENDPOINTS

This is an endpoints list

* **POST /minefields{x_size:int, y_size:int, mines_number:int}**. This is where the game starts. 

* **DELETE /minefields/:uuid**. Ends the game. You will lose.

* **PUT /minefields/:uuid/toggle_pause_resume**. Toggle to pause or resume the game.

* **PUT /minefields/:uuid/squares{x:int, y:int}**. Flips a square. The endpoint responds if the game was won, lost, or continue.

* **PUT /minefields/:uuid/squares/red_flag{x:int, y:int}**. Marks a square with a red flag

* **PUT /minefields/:uuid/squares/question_mark{x:int, y:int}**. Marks a square with a question mark

## TIMEOUT

There where a few point I could not finish

* We cannot toggle from red flag/question mark to normal again

* Adjacent squares won't flip if they were no mines
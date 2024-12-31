# **_TheCredits_**

TheCredits is a super simple and barebones scrolling credits library for LÖVE2D.

----------------------

## Example
```lua
local  creds = require "TheCredits"
  

function  test()
	print("I'm ran once from a callback function parameter!")
end

  

function love.load()
	font = love.graphics.getFont()
	creditTable = {
	"TITLE",
	"Caption 1;Credit1",
	"Caption 2;Credit2",
	"Caption 3;Credit3",
	"Caption 4;Credit4",
	"Caption 5;Credit5",
	"Caption 6;Credit6",
	"ANOTHER TITLE",
	"Caption 7;Credit7",
	"Caption 8;Credit8",
	"Caption 9;Credit9",
	"Caption 10;Credit 10",
	"Caption 11;Credit 11",
	"FM;And the final message!"
}

c = creds:New(
	creditTable, -- Credits table (table)
	font, -- Font (Font)
	test, -- Callback Function (function)
	nil, -- Wait Time (number)
	nil, -- Speed (number)
	"vertical" -- draw mode (string ["horizontal" OR "vertical"])
)
end

function love.update()
	c:update()
end

function love.draw()
	c:draw()
end
```

### Usage
First, require the 'TheCredits'  file from wherever you have it located:
```lua
TheCredits = require "path.to.lib"
``` 
Next, create a table of your credits, something like this:
```lua
creditTable = {
	"TITLE",
	"Caption 1;Credit1",
	"Caption 2;Credit2",
	"Caption 3;Credit3",
	"Caption 4;Credit4",
	"Caption 5;Credit5",
	"Caption 6;Credit6",
	"ANOTHER TITLE",
	"Caption 7;Credit7",
	"Caption 8;Credit8",
	"Caption 9;Credit9",
	"Caption 10;Credit 10",
	"Caption 11;Credit 11",
	"FM;And the final message!"
}
```
Inside the table, you can have 3 different types of strings. 

A string without a semicolon is a title:
```lua
"I AM A TITLE"
```
A string with a semicolon is regular text; with the caption being on the left of the semicolon, and the right being the credit to the caption:
```lua
"Caption;Credit"
```
Or a string with ```"FM"``` followed by a semicolon is a final message shown at the bottom of the credits (as long as its the last element in the table. if its not, then its just gonna render in the order of its position in the table)
```lua
"FM;Thank you for playing!"
```
Next, you need to create a new credits object:
```lua
credits = TheCredits:New(CREDITS_TABLE, FONT, CALLBACK_FUNCTION, WAIT_TIME, SPEED, DRAW_TYPE)
```
```CREDITS_TABLE``` - (table) A table of all credits (all elements must be strings, see above for more info).
```FONT``` - (Font) The font being used.
```CALLBACK_FUNCTION``` - (function) A function called once after credits are finished.
```WAIT_TIME``` - (number) The amount of time elapsed before and after credits.
```SPEED``` - (number) The speed the credits scroll at.
```DRAW_TYPE``` - (string) The way the credits are rendered (must be either "vertical" or "horizontal"; default is "horizontal")

Lastly, make sure to call the ```update()``` function in ```love.update()``` and ```draw()``` in ```love.draw()```

```lua
function love.update()
	credits:update()
end

function love.draw()
	credits:draw()
end
```

## Draw types
Credits can be rendered 2 ways (see above for more). First (and the default) is ```horizontal```, which looks like this:

The second way is ```vertical```, which looks like this":

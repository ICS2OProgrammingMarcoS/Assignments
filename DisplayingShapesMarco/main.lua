-- Course: ICS2O
-- Name: Marco Sterlini
-- This program displays shapes in Lua
-- Title: Displaying Shapes In Lua
-- date: September 28, 2018

-- Write locals for the triangle
local triangle
local textsize = 50
local triangleText 
local triangleX = 150
local triangleY = 200 
local verticesTriangle = { 150, 100, 50, 200, 250, 200 }
local triangle = display.newPolygon( triangleX, triangleY, verticesTriangle )

-- Set outside of the triangle width
triangle.strokeWidth = 10
-- Set outside of the triangle colour
triangle:setStrokeColor( 0, 0, 1 )
-- Set text over the triangle and say "This is a triangle"
triangleText = display.newText( "This is a triangle", 200, 100, Arial, textsize)
-- Set triangle fill colour
triangle:setFillColor(0.1, 0.8, 0.6)
triangleText:setTextColor(50/255, 107/255, 99/255)


-- Write locals for the pentogan
local pentogan
local textsizePentogan = 45
local pentoganText 
local pentoganX = 612
local pentoganY = 468
local verticesPentogan = { 1024, 250, 1300, 250, 1400, 450, 1150, 625, 924, 450 }
local pentogan = display.newPolygon( pentoganX, pentoganY, verticesPentogan )

display.setDefault("background", 0/255, 215/255, 0/255)

-- Set outside of the pentagon width 
pentogan.strokeWidth = 10
-- Set outside of the pentagon colour
pentogan:setStrokeColor( 1, 0, 0 )
-- Set text over the pentogan and say "This is a pentagon"
pentoganText = display.newText ( "This is a pentagon", 575, 192, Arial, textsizePentogan)
-- Set Pentagon fill colour
pentogan:setFillColor(0.9, 0.2, 0.6)
-- Write locals for the hexogan
pentoganText:setTextColor(100/255, 150/255, 230/255)

local hexogan
local hexoganText 
local hexoganX = 256	
local hexoganY = 535
local verticesHexogan = { 160, 420, 270, 420, 330, 515, 270, 600, 160, 600, 100, 515 }
local hexogan = display.newPolygon( hexoganX, hexoganY, verticesHexogan )

-- Set outside of the hexogan
hexogan.strokeWidth = 10
-- Set outside of the hexogan colour
hexogan:setStrokeColor( 0, 1, 1 )
-- Set text under the hexogan and say "This is a hexogan"
hexoganText = display.newText ( "This is a hexogan", 250, 680, Arial, textsizePentogan)
-- set hexogan fill color
hexogan:setFillColor(0.6, 0.2, 0.4)

hexoganText:setTextColor(150/255, 100/255, 245/255)

local authorText
authorText = display.newText ( "By: Marco Sterlini", 700, 100, Arial, 50)
authorText:setTextColor( 1, 0, 0 )

local rocketship = display.rocketship( 25, 75, 50, 50 )
rocketship:setFillColor( 1, 1, 1 )
 

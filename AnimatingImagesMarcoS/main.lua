-- Title: AnimatingImages
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program display images that react to a person's finger

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-- set the background image and the rocketship
local backgroundImage = display.newImageRect("Images/space-1124070.jpg", 2048, 1536)
local rocketship = display.newImageRect("Images/Rocketship.png", 200, 200)
-- make a text size
local textsize1 = 50
-- set the text, make it say Animating Images and add a red text colour 
local titleText
titleText = display.newText("Animating Images", 512, 100, Arial, textsize1)
titleText:setTextColor(255/255, 0/255, 0/255)

-- set the scroll speed and the transparency
scrollSpeed = 3
rocketship.alpha = 0
-- set the x and y of the rocketship
rocketship.x = 1024
rocketship.y = display.contentHeight*2/3
-- move rocketship
local function MoveRocketship(event)
	-- add the scroll speed to the x value of the ship
	rocketship.x = rocketship.x - scrollSpeed
	rocketship.alpha = rocketship.alpha + 0.006
	-- if the x-value of the rocketship is greater than 1000 then
	-- change the scrollSpeed to be negative
	if (rocketship.x <= 10) then
		-- change the scrollSpeed value
		scrollSpeed = -3
	end
		-- make rocketship bounce off the wall
	if (rocketship.x >= 1000) then
		-- change the scrollSpeed value
		scrollSpeed = 3
	end
end
-- make local function work
Runtime:addEventListener("enterFrame", MoveRocketship)
-- display car
local car = display.newImageRect("Images/car.png", 200, 200)
-- set speed of the car and transparency of the car
scrollSpeed2 = -4
car.alpha = 1
-- set trhe car x and y
car.x = 0
car.y = display.contentHeight*1/3
-- move the car
local function MoveCar(event)
	-- add the scroll speed to the x value of the ship
	car.x = car.x - scrollSpeed2

	-- if the x-value of the car is greater than 1000 then
	-- change the scrollSpeed to be negative 
	if (car.x >= 1000) then
		-- change the scrollSpeed value of car and the transparency 
		scrollSpeed2 = 3
		car.alpha = car.alpha + 0.10
	end
	-- make the acr bounce off the wall
	if (car.x <= 10) then
		-- change the scrollSpeed value of car
		scrollSpeed2 = -3
		car:scale(0.89, 0.89)
	end
end
-- make local function work
Runtime:addEventListener("enterFrame", MoveCar)
-- display the phone
local phone = display.newImageRect("Images/phone.png", 200, 200)
-- set the speed of the car and transparency of the car
scrollSpeed3 = 3
phone.alpha = 1
-- set phone x and y
phone.x = 0
phone.y = 0
-- make the phone move
local function MovePhone(event)
	-- add the scroll speed to the x value of the ship and scale of the phone
	phone.x = phone.x + scrollSpeed3
	phone.y = phone.y + scrollSpeed3
	phone:scale(1.002, 1.002)
	phone.alpha = phone.alpha - 0.00000000000001
end
-- make local function work
Runtime:addEventListener("enterFrame", MovePhone)

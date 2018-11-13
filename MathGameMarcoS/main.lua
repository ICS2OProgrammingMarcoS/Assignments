-- Title: Math quiz
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield
-- terminal.
------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 0/255, 255/255, 0/255)

-- Local varibles 

local questionObject

local correctObject
local incorrectObject

local numericField

-- random numbers for calculations
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer 
local randomOperator
local correctAnswers = 0
local temp
-- Points
local pointSystem = 0
local pointsTextObject

-- varibles for timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

-- lives and hearts
local lives = 4
local heart1
local heart2
local heart3
local heart4
 
local gameOver

---------------------------------------------------------------------
-- sounds
---------------------------------------------------------------------
local bkgSound = audio.loadSound( "Sounds/bkg.mp3" )
local bkgSoundChannel = audio.play(bkgSound)
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local endGameSound =  audio.loadSound( "Sounds/gameOverSound.mp3" )
local endGameSoundChannel
local winGameSound = audio.loadSound( "Sounds/winGameSound.mp3" )
local correctSoundChannel
---------------------------------------------------------------------
-- local functions
---------------------------------------------------------------------
local function AskQuestion()
	-- generate 2 random questions between a max. and a min. number
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)
	randomNumber3 = math.random(1, 10)
	randomNumber4 = math.random(1, 10)
	randomNumber5 = math.random(1, 10)
	randomNumber6 = math.random(1, 10)
	randomOperator = math.random(1, 6)

	-- add addition
	if (randomOperator == 1) then
		-- ask the question
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
		-- set the correct answer
		correctAnswer = randomNumber1 + randomNumber2
	-- add multiplication
	elseif (randomOperator == 2) then
		-- ask the question
		questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "
		-- set the correct answer
		correctAnswer = randomNumber3 * randomNumber4

-- switching varibles if randomNumber2 is greater than randomNumber1 
		
	-- add subtraction
	elseif (randomOperator == 3) then
		-- switching varibles if randomNumber2 is greater than randomNumber1 
		-- switching varibles if randomNumber2 is greater than randomNumber1 
		if ( randomNumber1 < randomNumber2) then
			-- set the correct answer
			correctAnswer = randomNumber2 - randomNumber1
			-- ask the question
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
			
			
		end
		-- add division
	elseif (randomOperator == 4) then
		-- make temp = randomNumber5 multiplied by randomNumber6
		temp = randomNumber5 * randomNumber6
		-- set the correct answer
		correctAnswer = temp / randomNumber6
		-- ask the question
		questionObject.text = temp .. " / " .. randomNumber6 .. " = "
		-- add exponants
	elseif (randomOperator == 5) then
		-- set the random numbers
		randomNumber7 = math.random(1,5)
		randomNumber8 = math.random(1,4)
		-- make exponant equal to math power with random numbers
		exponant = math.pow(randomNumber7, randomNumber8)
		-- set the correct answer
		correctAnswer = exponant
		-- ask the question
		questionObject.text = randomNumber7 .. " ^ " .. randomNumber8 .. " = "
		-- set the correct answer
		correctAnswer = randomNumber7 ^ randomNumber8
		-- add square root
	elseif(randomOperator == 6) then
		-- get a random number
		randomNumber9 = math.random(1, 10)
		-- spuare the random number
		temp = randomNumber9 * randomNumber9
		-- get the correct answer
		correctAnswer = math.sqrt(temp)
		-- make the question in the text object
		questionObject.text = temp .. " sqrt"
	end
end
-- make a function that decreses lives
local function DecreaseLives()
	-- If there are no lives left, play a you lose sound, add a you lose image
	-- cancel the you lose timer remove the third heart
	-- if lives = 2 then the heart 3 is not visible and it calls the function AskQuestion()
	if (lives == 2) then	
		heart3.isVisible = false
		AskQuestion()
	-- if lives = 1 then the second heart is  not visble and calls the function AskQuestion()
	elseif (lives == 1) then 
		heart2.isVisible = false
		AskQuestion()
	-- if lives = 0 then the last heart is not visble and calls the function AskQuestion()
	elseif (lives == 0) then
		heart1.isVisible = false
		AskQuestion()
	--timer.cancel( countDownTimer )
		-- play the incorrect sound
		incorrectSoundChannel = audio.play(incorrectSoundChannel)
		-- display game over
		gameOver = display.newImage("Images/gameOver.png")
		-- display where it is on the screen
		gameOver.height = display.contentHeight
		gameOver.width = display.contentWidth
		gameOver.y = display.contentHeight/2
		gameOver.x = display.contentWidth/2
	end
end
-- update the time
local function UpdateTime()
	-- make the seconds go down by one second
	secondsLeft = secondsLeft - 1
	-- add the clock text
	clockText.text = "Time remaining: " .. secondsLeft
	-- if seconds left = 0 then it does this
	if (secondsLeft == 0) then
		-- makes seconds left = to total seconds
		secondsLeft = totalSeconds
		-- makes lives - 1
		lives = lives - 1
		-- calls the function decrese lives
		DecreaseLives()
		-- calls the function ask question
		AskQuestion()
		-- plays the speed sound
		speedSoundChannel = audio.play(speedSound)
		-- calls the function hide speed after 2 seconds
		timer.performWithDelay(2000, HideSpeed)
	-- when lives = 1 then it does this
	elseif (lives == 0) then
		-- makes the numeric field invisible
		numericField.isVisible = false
		-- plays the end game sound
		endGameSoundChannel =  audio.play(endGameSound)
	end
end
-- make a start time function
local function StartTimer()
	-- create a countdown timer loops infinitley
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
-- makes a win game function
local function WinGame()
	-- if point system = 5 then it does the folowing
	if (pointSystem == 5) then
		-- makes you win image visible
		youWin.isVisible = true
		-- makes the clock text invisible
		clockText.isVisible = false
		-- makes the numeric field invisible
		numericField.isVisible = false
		-- makes points text invisible
		pointsTextObject.isVisible = false
		-- makes the question invisible
		questionObject.isVisible = false
		-- makes the correct answer invisible
		correctObject.isVisible = false
		-- makes the incorrect answer invisible
		incorrectObject.isVisible = false
	end
end
-- makes the function and makes correct object invisiblen and calls the function ask question
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end
-- make the function and hides the incorrect answer and calls the function ask question
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


-- add the numeric text field 
local function NumericFieldListener( event )

	-- User begins edting "numericField"
	if ( event.phase == "began" ) then
	-- if the user submitts the answer it does the following
	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			-- makes the correct varible visible
			correctObject.isVisible = true
			-- plays the correct sound
			correctSoundChannel = audio.play(correctSound)
			-- calls the function hide correct after a second
			timer.performWithDelay(1000, HideCorrect)
			-- adds a point
			pointSystem = pointSystem + 1 
			-- asks the question
			pointsTextObject.text = "Points = " .. pointSystem
			-- cllears the text field
			event.target.text = ""
			-- adds a correct answer
			correctAnswers = correctAnswers + 1	
			-- calls the function update time
			UpdateTime()
			-- makes seconds left = to total seconds
			secondsLeft = totalSeconds
			-- calls the function win game
			WinGame()
		else
			-- displays incorrect text
			incorrectObject.text =  "Incorrect the correct answer was " .. correctAnswer
			-- makes the incorrect varible visible
			incorrectObject.isVisible = true
			-- plays the incorrect sound
			incorrectSoundChannel = audio.play(incorrectSound)
			-- clears the text field
			event.target.text = ""
			-- calls the function hide incorrect after a second
			timer.performWithDelay(1000, HideIncorrect)
			-- makes lives subtract 1
			lives = lives - 1
			-- calls the function decrease lives
			DecreaseLives()
			-- calls the function update time
			UpdateTime()
			-- makes seconds left = total seconds
			secondsLeft = totalSeconds
		end
	end
end

------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7
-- displays heart 2 and where it is on the ipad
heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
-- displays heart 3 and where is is on the ipad
heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7
-- displays the image you win and its x and y
youWin = display.newImage("Images/youWin.png")
		youWin.height = display.contentHeight
		youWin.width = display.contentWidth
		youWin.y = display.contentHeight/2
		youWin.x = display.contentWidth/2
-- makes the you win image invisible
youWin.isVisible = false
-- Object Creation
-- displays the points object text
pointsTextObject = display.newText ( "Points = " .. pointSystem, 735, 255, nil, 60)
-- displays a question and sets the colour\
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/3, nil, 45)
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct", display.contentWidth/2, display.contentHeight*2/4, nil, 50)
correctObject:setTextColor(200/255, 0/255, 0/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/4, nil, 50)
incorrectObject:setTextColor(0/255, 0/255, 200/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/3, 150, 90 )
numericField.inputType = "number"
-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)
-- displays the clock text and where it is on the screen 
clockText = display.newText ( " Time remaining: " .. secondsLeft, 512, 500, nil, 50 )
-- sets the colour of the clock text
clockText:setTextColor(0/255, 0/255, 200/255)
-- Function Calls

-- call the function to ask the question
AskQuestion()
-- call the function to ask the question
StartTimer()





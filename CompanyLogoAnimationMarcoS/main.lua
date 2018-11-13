-- Title: CompanyLogoAnimation
-- Name: Marco Sterlini
-- Course: ICS2O
-- This program displays our company logo on the ipad

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- make local functions
local vampire
local vampireWaving

-- sounds
local bkgSound = audio.loadSound( "Sounds/CreepySound.mp3" )
local bkgSoundChannel = audio.play(bkgSound)
-- local functions
function DisplayVampireWaving()
	-- made vampire waving visible
	vampireWaving.isVisible = true
	-- made vampire visible
	vampire.isVisible = false
	-- called the display vampire function
	timer.performWithDelay(500, DisplayVampire)
	-- scaled the vampire
	vampireWaving:scale(0.89, 0.89)
	-- made vampire fade out
	vampireWaving.alpha = vampire.alpha - 0.17
end

function DisplayVampire()
	-- made vampire visible
	vampire.isVisible = true
	-- made vampire waving invisible
	vampireWaving.isVisible = false
	-- called the function display vampire waving
	timer.performWithDelay(500, DisplayVampireWaving)
	-- scaled the vampire
	vampire:scale(0.89, 0.89)
	-- shrunk the vampire
	vampire.alpha = vampire.alpha - 0.17
end

-- Images
vampire = display.newImage("Images/Vampire.PNG")
vampire.x = display.contentWidth/2
vampire.y = display.contentHeight/2

vampire.height = display.contentHeight
vampire.width =  display.contentWidth
-- vampire invisible
vampire.isVisible = false

vampireWaving = display.newImage("Images/VampireWaving.PNG")
vampireWaving.y = display.contentHeight/2
vampireWaving.x = display.contentWidth/2

vampireWaving.height = display.contentHeight
vampireWaving.width = display.contentWidth
-- vampire waving invisible
vampireWaving.isVisible = false
-- called the function display vampire
DisplayVampire()

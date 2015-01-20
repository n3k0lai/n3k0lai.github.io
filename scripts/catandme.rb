
    #===========================================================================
    #background
    #/sunset
    #//start
    class Sunset
        initialize
            startSunsetImage = new Image()
            startSunsetImage.src = "_data/startSunsetImage.png"

            canvas = document.getElementById("idleSunset")
            canvas = document.getElementById("startSunset")
            canvas.width = 500
            canvas.height = 300
            #//idle
            idleSunsetImage = new Image()
            idleSunsetImage.src = "_data/idleSunsetImage.png"

            @start = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: startSunsetImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @idle = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: idleSunsetImage
                numberOfFrames: ?
                ticksPerFrame: i
            )
        end
    end

    #/stars
    #//start
    class Star
        initialize
            startStarImage = new Image()
            startStarImage.src = "_data/startStarImage.png"
            idleStarImage = new Image()
            idleStarImage.src = "_data/idleStarImage.png"
            canvas = document.getElementById("startStar")
            canvas = document.getElementById("idleStar")
            canvas.width = 500
            canvas.height = 300

            @start = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: startStarImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @idle = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: idleStarImage
                numberOfFrames: ?
                ticksPerFrame: i
            )
            #//dance
        end
    end

    #===============================================================================
    #environment
    #/clouds
    #//start   // May be unneeded
    class Cloud
        initialize
            startCloudImage = new Image()
            startTowerImage.src = "_data/startCloudImage.png"
            idleCloudImage = new Image()
            idleTowerImage.src = "_data/idleCloudImage.png"

            canvas = document.getElementById("startCloud")
            canvas = document.getElementById("idleCloud")

            canvas.width = 100
            canvas.height = 50

            @start = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: startCloudImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @idle = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: idleCloudImage
                numberOfFrames: ?
                ticksPerFrame: i
            )
        end
    end


    #/towers
    #//start
    class Tower
        def initialize
            startTowerImage = new Image()
            startTowerImage.src = "_data/startTowerImage.png"
            idleTowerImage = new Image()
            idleTowerImage.src = "_data/idleTowerImage.png"

            canvas = document.getElementById("startTower")
            canvas = document.getElementById("idleTower")

            canvas.width = 100
            canvas.height = 200

            @start = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: startTowerImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @idle = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: idleTowerImage
                numberOfFrames: ?
                ticksPerFrame: i
            )
        end
    end
    #/letters
    class Letter
        def initialize
            startLetterImage = new Image()
            startLetterImage.src = "_data/startLetterImage.png"
            idleLetterImage = new Image()
            idleLetterImage.src = "_data/idleLetterImage.png"
            damageLetterImage = new Image()
            damageLetterImage.src = "_data/idleLetterImage.png"
            fixLetterImage = new Image()
            fixLetterImage.src = "_data/idleLetterImage.png"

            canvas = document.getElementById("startLetter")
            canvas = document.getElementById("idleLetter")
            canvas = document.getElementById("damageLetter")
            canvas = document.getElementById("fixLetter")

            canvas.width = 100
            canvas.height = 200

            @start = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: startLetterImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @idle = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: idleLetterImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @damage = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: damageLetterImage
                numberOfFrames: ?
                ticksPerFrame: i
            )

            @fix = sprite(
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: fixLetterImage
                numberOfFrames: ?
                ticksPerFrame: i
            )
        end
    end

    #===========================================================================
    #characters
    #/me
class Me
    def initialize
    #//start
    #//idle
    #//dance
    #//interrupt
    end
end


    #/cat
class Cat
    def initialize

    #//start
    #//idle
    #//dance
    #//interrupt
end

    #/birds

class Bird
    def initialize

    #//start
    #//idle
    #//dance
end
    #===========================================================================
    #===========================MAIN=EVENT=LOOP=================================
    #===========================================================================

	#//Towers and Letters sprite length / t; for tn++ iterate Towers and Letters
    #//for tn in t move Towers and Letters from start location to idle location

    #Main loop @T is the clock time for canvas refresh
    #/if Focused
    #//Check for Dance flag
    #//Check for user click
    #//for S in sprite
    #///if !click and !dance
    #////render state.next
    #///if Dance and state.current != Dance
    #////render state.next(dance)
    #///if Dance and state.current == Dance
    #////render state.next
    #///if Click and state.current != Click
    #////render state.next(click)
    #///if Click and state.current == Click
    #////render state.next
    #////add to click queue
    #/if not focused
    #//while not focused
    #///render clouds
    #////render cloudImage[floor(cloud.sprite.length * T)]
    # Get canvas
    canvas = document.getElementById("coinTapGame"); #gen background
    canvas.width = 460;
    canvas.height = 230;
    #spawn sprites
    gameLoop = () ->
        window.requestAnimationFrame(gameLoop)
        # Clear the canvas
        canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height)

        for i in coins
            coins[i].update()
            coins[i].render()

    gameLoop();

    canvas.addEventListener("touchstart", tap);
    canvas.addEventListener("mousedown", tap);
    canvas.addEventListener("dance", dance);

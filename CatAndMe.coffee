(() ->
    # http://paulirish.com/2011/requestanimationframe-for-smart-animating/
    # http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating
    # requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel
    # MIT license
    # Converted to coffeescript by Nicholai Goodall

    lastTime = 0
    vendors = ['ms', 'moz', 'webkit', 'o']
    for x in vendors 
        if not window.requestAnimationFrame
            window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame']
            window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] or window[vendors[x] + 'CancelRequestAnimationFrame']

    if not window.requestAnimationFrame
        window.requestAnimationFrame = (callback, element) ->
            currTime = new Date().getTime()
            timeToCall = Math.max(0, 16 - (currTime - lastTime))
            id = window.setTimeout(
                () -> callback(currTime + timeToCall)
                timeToCall
            )
            lastTime = currTime + timeToCall
            return id

    if not window.cancelAnimationFrame
        window.cancelAnimationFrame = (id) -> clearTimeout(id)
)


( () ->
    class sprite #gives a Sprite Object
        constructor: (options) ->
            frameIndex = 0
            tickCount = 0
            ticksPerFrame = ticksPerFrame or 0
            numberOfFrames = options.numberOfFrames or 1
            @context = options.context
            @width = options.width
            @height = options.height
            @x = 0
            @y = 0
            @image = options.image
            @scaleRatio = 1
    
        update: ->
            tickCount += 1
            if tickCount > ticksPerFrame) 
                tickCount = 0
                # If the current frame index is in range
                if frameIndex < numberOfFrames - 1 then frameIndex += 1 else frameIndex = 0
                    # Go to the next frame

        render: ->
            # Draw the animation
            @context.drawImage(
                @image
                frameIndex * @width / numberOfFrames
                0
                @width / numberOfFrames
                @height
                @x
                @y
                @width / numberOfFrames * @scaleRatio
                @height * @scaleRatio
            )

        getFrameWidth: ->
            return @width / numberOfFrames
            
    #===========================================================================
    #background
    #/sunset
    #//start
    class Sunset:
        constructor: ->
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
    
    
    #/stars
    #//start
    class Star:
        constructor: ->
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
    
    #===============================================================================
    #environment
    #/clouds
    #//start   // May be unneeded
    class Cloud:
        constructor: ->
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
            
            @idle = sprite({
                context: canvas.getContext("2d")
                width: canvas.width
                height: canvas.height
                image: idleCloudImage
                numberOfFrames: ?
                ticksPerFrame: i
            )
    
    
    #/towers
    #//start
    class Tower:
        constructor: ->
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
    #/letters
    class Letter:
        constructor: ->
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
    
    #===========================================================================
    #characters
    #/me
    class Me:
        constructor: ->
            
    #//start
    #//idle
    #//dance
    #//interrupt
    #/cat
    class Cat:
        constructor: ->
            
    #//start
    #//idle
    #//dance
    #//interrupt
    #/birds
    class Bird:
        constructor: ->
            
    #//start
    #//idle
    #//dance
    
    #===========================================================================
    #===========================MAIN=EVENT=LOOP=================================
    #===========================================================================
    
    destroyCoin = (coin) ->
		for i in coins then if coins[i] is coin
			coins[i] = null
			coins[i..1] #is this a proper slice
			break #is break legit
	
	spawnCoin = () ->
		# Create sprite sheet
		coinImg = new Image()
		coinIndex = coins.length
		
		# Create sprite
		coins[coinIndex] = sprite(
			context: canvas.getContext("2d")
			width: 1000
			height: 100
			image: coinImg
			numberOfFrames: 10
			ticksPerFrame: i
		)
		
		coins[coinIndex].x = Math.random() * (canvas.width - coins[coinIndex].getFrameWidth() * coins[coinIndex].scaleRatio)
		coins[coinIndex].y = Math.random() * (canvas.height - coins[coinIndex].height * coins[coinIndex].scaleRatio)
		
		coins[coinIndex].scaleRatio = Math.random() * 0.5 + 0.5
		
		# Load sprite sheet
		coinImg.src = "images/coin-sprite-animation.png"
	}
	
	getElementPosition = (element) ->
        parentOffset,
        pos =
            x: element.offsetLeft
            y: element.offsetTop 
           
        if element.offsetParent
           parentOffset = getElementPosition(element.offsetParent)
           pos.x += parentOffset.x
           pos.y += parentOffset.y
       return pos;
	
	distance = (p1, p2) ->
		dx = p1.x - p2.x
		dy = p1.y - p2.y
			
		return Math.sqrt(dx * dx + dy * dy)
	
    tap = (e) ->
        loc = {}
		clickList = []
		pos = getElementPosition(canvas)
		tapX = e.targetTouches ? e.targetTouches[0].pageX : e.pageX
		tapY = e.targetTouches ? e.targetTouches[0].pageY : e.pageY
		canvasScaleRatio = canvas.width / canvas.offsetWidth

		loc.x = (tapX - pos.x) * canvasScaleRatio
		loc.y = (tapY - pos.y) * canvasScaleRatio
			
		for i in coins 
            # Distance between tap and coin
			dist = distance(
			    {
    				x: (coins[i].x + coins[i].getFrameWidth() / 2 * coins[i].scaleRatio)
    				y: (coins[i].y + coins[i].getFrameWidth() / 2 * coins[i].scaleRatio)
    			}
    			{
    				x: loc.x,
    				y: loc.y
    			}
			
			# Check for tap collision with coin		
			if dist < coins[i].getFrameWidth() / 2 * coins[i].scaleRatio then clickList.push(coins[i])
			
		# mark as clicked
		for i in clickList
			score += parseInt(coinsToDestroy[i].scaleRatio * 10, 10)
			destroyCoin(coinsToDestroy[i])	
			setTimeout(spawnCoin, 1000)
		
		if clickList.length then document.getElementById("score").innerHTML = score
		
	
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

NUM_HORZ_CELLS = 40
NUM_VERT_CELLS = 40
TICK_DELAY = 200

require  ['lib/domready','lib/bean','kernel','board','input'], (domready,bean,setupKernel,setupBoard,setupInput)->

  setup = (paper)->
    bounds = [NUM_HORZ_CELLS,NUM_VERT_CELLS]

    window.board = setupBoard(paper,bounds)
    kernel = setupKernel(board,bounds)
    kernel.tick('none')

    inputIndicator = document.getElementById('input-indicator')

    mostRecentCommand = 'none'

    handleNextTurn = ->
      kernel.tick( mostRecentCommand )
      mostRecentCommand = 'none'
      inputIndicator.innerHTML = ""

    eventLoop = ->
      handleNextTurn()
      window.setTimeout( eventLoop, TICK_DELAY )
    eventLoop()

    onInput = (dir)->
      mostRecentCommand = dir

    input = setupInput()
    bean.add input, {
      'up': -> 
        inputIndicator.innerHTML = "UP"
        onInput 'up'
      'down': -> 
        inputIndicator.innerHTML = "DOWN"
        onInput 'down'
      'left': -> 
        inputIndicator.innerHTML = "LEFT"
        onInput 'left'
      'right': -> 
        inputIndicator.innerHTML = "RIGHT"
        onInput 'right'
      'space': ->
        handleNextTurn()
    }

  domready ->
    Raphael "game", 400, 400, ->
      setup(this)


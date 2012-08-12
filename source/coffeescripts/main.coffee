require  ['lib/domready','lib/bean','kernel','board','input'], (domready,bean,setupKernel,setupBoard,setupInput)->

  setup = (paper)->

    window.board = setupBoard(paper)
    kernel = setupKernel(board)

    inputIndicator = document.getElementById('input-indicator')

    mostRecentCommand = 'none'

    handleNextTurn = ->
      kernel.tick( mostRecentCommand )
      mostRecentCommand = 'none'
      inputIndicator.innerHTML = ""

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


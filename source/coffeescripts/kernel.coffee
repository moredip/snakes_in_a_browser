define ->
  
  wrap = (position,max)->
    if position < 0
      max
    else if position > max
      position = 0
    else
      position

  normalizeLocation = (next, bounds)->
    [
      wrap(next[0],bounds[0]-1),
      wrap(next[1],bounds[1]-1)
    ]

  nextHead = (currentHead, dir, bounds)->
    next = switch dir
      when 'left' then [currentHead[0]-1,currentHead[1]]
      when 'right' then [currentHead[0]+1,currentHead[1]]
      when 'up' then [currentHead[0],currentHead[1]-1]
      when 'down' then [currentHead[0],currentHead[1]+1]

    normalizeLocation( next, bounds )


  renderSnake = (snake,board)->
    board.clear()
    _.each snake, ([x,y])->
      board.paintSnake(x,y)

  updateSnake = (snake,dir,bounds)->
    head = snake[snake.length-1]
    newHead = nextHead(head, dir,bounds)
    snake.push( newHead )
    snake.shift()

  setupKernel = (board,bounds)->
    snake = [[13,33],[14,33],[15,33]]
    dir = 'right'

    tick = (newDir)->
      dir = newDir unless newDir == 'none'
      updateSnake(snake,dir,bounds)
      renderSnake(snake,board)

    {
      tick: tick 
    }


  setupKernel

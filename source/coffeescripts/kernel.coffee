define ->

  randomCoordWithin = ([maxX,maxY])->
    x = Math.floor( Math.random() * maxX )
    y = Math.floor( Math.random() * maxY )
    [x,y]
  
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

  headOf = (snake)-> snake[snake.length-1]
  coordsSame = ([lx,ly],[rx,ry])-> lx == rx && ly == ry

  renderSnakeAndFood = (snake,food,board)->
    board.clear()
    board.paintFood(food[0],food[1])
    _.each snake, ([x,y])->
      board.paintSnake(x,y)

  updateSnake = (snake,dir,growSnake,bounds)->
    head = headOf(snake)
    newHead = nextHead(head, dir,bounds)
    snake.push( newHead )
    snake.shift() unless growSnake

  setupKernel = (board,bounds)->
    food = randomCoordWithin(bounds)
    snake = [[13,33],[14,33],[15,33]]
    dir = 'right'
    snakeWantsToGrow = false

    snakeEatsFood = ()->
      console.log( 'yum!')
      snakeWantsToGrow = true
      food = randomCoordWithin(bounds)

    tick = (newDir)->
      dir = newDir unless newDir == 'none'
      updateSnake(snake,dir,snakeWantsToGrow, bounds)
      snakeWantsToGrow = false
      snakeEatsFood() if coordsSame( headOf(snake), food )
      renderSnakeAndFood(snake,food,board)

    {
      tick: tick 
    }


  setupKernel

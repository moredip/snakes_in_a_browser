define ->

  nextHead = (currentHead, dir)->
   switch dir
     when 'left' then [currentHead[0]-1,currentHead[1]]
     when 'right' then [currentHead[0]+1,currentHead[1]]
     when 'up' then [currentHead[0],currentHead[1]-1]
     when 'down' then [currentHead[0],currentHead[1]+1]


  renderSnake = (snake,board)->
    board.clear()
    _.each snake, ([x,y])->
      board.paint(x,y)

  updateSnake = (snake,dir)->
    head = snake[snake.length-1]
    newHead = nextHead( head, dir )
    snake.push( newHead )
    snake.shift()

  setupKernel = (board)->
    snake = [[13,33],[14,33],[15,33]]
    dir = 'right'


    tick = (newDir)->
      dir = newDir unless newDir == 'none'
      updateSnake(snake,dir)
      renderSnake(snake,board)

    {
      tick: tick 
    }


  setupKernel

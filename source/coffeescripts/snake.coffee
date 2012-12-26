define ->

  snakeHeadings = 
    N:
      name: 'N'
      move: (x,y)-> [x,y+1]
      L: -> snakeHeadings.W
      R: -> snakeHeadings.E
    E:
      name: 'E'
      move: (x,y)-> [x+1,y]
      L: -> snakeHeadings.N
      R: -> snakeHeadings.S
    S: 
      name: 'S'
      move: (x,y)-> [x,y-1]
      L: -> snakeHeadings.E
      R: -> snakeHeadings.W
    W:
      name: 'W'
      move: (x,y)-> [x-1,y]
      L: -> snakeHeadings.S
      R: -> snakeHeadings.N

  headOf = (body)-> body[body.length-1]

  moveBody = (body,heading)->
    currHead = headOf(body)
    nextHead = heading.move(currHead[0],currHead[1])

    nextBody = body.slice(1)
    nextBody.push( nextHead )
    nextBody

  adjustHeading = (currHead, headingChange)->
    if headingChange == 'S'
      currHead
    else
      currHead[headingChange]()

  createSnake = ( body, heading )->
    elements: -> 
      body
    head: ->
      headOf(body)
    heading: -> 
      heading.name
    move: (headingChange='S')-> 
      nextHeading = adjustHeading(heading,headingChange)
      createSnake( moveBody(body,nextHeading), nextHeading )

  createSnakeWithHead = (head=[0,0],headingStr='N')->
    createSnake( [head], snakeHeadings[headingStr] )

  createSnakeWithHead

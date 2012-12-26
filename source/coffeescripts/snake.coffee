define ->
  headOf = (body)-> body[body.length-1]

  nextHeadFor = 
    N: (x,y)-> [x,y+1]
    E: (x,y)-> [x+1,y]
    S: (x,y)-> [x,y-1]
    W: (x,y)-> [x-1,y]

  moveBody = (body,heading)->
    currHead = headOf(body)
    nextHead = nextHeadFor[heading](currHead[0],currHead[1])

    nextBody = body.slice(1)
    nextBody.push( nextHead )
    nextBody

  nextHeadingFor = 
    N: 
      S: 'N'
    E: 
      S: 'E'
    S: 
      S: 'S'
    W: 
      S: 'W'
      L: 'S'
      R: 'N'

  adjustHeading = (currHead, headingChange)->
    nextHeadingFor[currHead][headingChange]

  createSnake = ( body=[0,0], heading='N')->
    elements: -> 
      body
    head: ->
      headOf(body)
    heading: -> 
      heading
    move: (headingChange='S')-> 
      nextHeading = adjustHeading(heading,headingChange)
      createSnake( moveBody(body,nextHeading), nextHeading )

  createSnakeWithHead = (head,heading)->
    createSnake( [head], heading )

  createSnakeWithHead

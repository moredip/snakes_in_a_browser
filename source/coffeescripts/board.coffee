define ->

  NUM_HORZ_CELLS = 40
  NUM_VERT_CELLS = 40

  renderPixel = ( x, y, paper, color )->
    x_size = "#{(0.90/NUM_HORZ_CELLS)*100}%"
    y_size = "#{(0.90/NUM_VERT_CELLS)*100}%"

    x_offset = "#{(x/NUM_HORZ_CELLS)*100}%"
    y_offset = "#{(y/NUM_VERT_CELLS)*100}%"

    rect = paper.rect( x_offset, y_offset, x_size, y_size ).attr('fill',color)


  createBoard = (paper)->

    clear = ->
      paper.clear()

    paint = (x,y,color)->
      renderPixel(x,y,paper,color)

    paintSnake = (x,y)-> paint(x,y,'hotpink')
    
    {
      clear: clear
      paintSnake: paintSnake
    }

  createBoard

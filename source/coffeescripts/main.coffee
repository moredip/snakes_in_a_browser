NUM_HORZ_CELLS = 40
NUM_VERT_CELLS = 40

generatePixels = (paper)->
  pixels = []
  x_size = "#{(0.90/NUM_HORZ_CELLS)*100}%"
  y_size = "#{(0.90/NUM_VERT_CELLS)*100}%"

  for x in [0..(NUM_VERT_CELLS-1)]
    pixels[x] = []
    x_offset = "#{(x/NUM_HORZ_CELLS)*100}%"

    for y in [0..(NUM_HORZ_CELLS-1)]
      y_offset = "#{(y/NUM_VERT_CELLS)*100}%"
      rect = paper.rect( x_offset, y_offset, x_size, y_size ).attr('fill',Raphael.getColor())
      pixels[x][y] = rect

  pixels

createBoard = (paper)->
  pixels = generatePixels(paper)


  clear = ->
    _.each  _.flatten(pixels), (r)->
      r.attr('fill','none')

  paint = (x,y)->
    pixels[x][y].attr('fill', 'hotpink')
  
  {
    clear: clear,
    paint: paint
  }

domready ->
  Raphael "game", 400, 400, ->
    window.board = createBoard(this)




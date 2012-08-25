define ['board'], (createBoard)->
  describe 'board', ->
    beforeEach ->
      @spyPaper = {
        clear: sinon.spy()
        rect: sinon.spy()
      }
      @bounds = [10,10]
      @board = createBoard(@spyPaper,@bounds)

    describe '.clear', ->
      it 'clears the paper then draws a rect', ->
        @board.clear()
        expect( @spyPaper.clear ).toHaveBeenCalled()
        expect( @spyPaper.rect ).toHaveBeenCalled()
        sinon.assert.callOrder( @spyPaper.clear, @spyPaper.rect )

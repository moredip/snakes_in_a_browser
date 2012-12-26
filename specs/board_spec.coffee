requirejs = require('requirejs')

requirejs ['cs!board'], (createBoard)->
  describe 'board', ->
    before ->
      @spyPaper = {
        clear: sinon.spy()
        rect: sinon.spy()
      }
      @bounds = [10,10]
      @board = createBoard(@spyPaper,@bounds)

    describe '.clear', ->
      it 'clears the paper then draws a rect', ->
        @board.clear()
        expect( @spyPaper.clear ).to.have.been.called
        expect( @spyPaper.rect).to.have.been.called
        expect( @spyPaper.rect).to.have.been.calledAfter(@spyPaper.clear)

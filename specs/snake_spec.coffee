requirejs = require('requirejs')

requirejs ['cs!snake'], (createSnake)->

  require('chai').use (chai,utils)->
    chai.Assertion.addMethod 'heading', (expectedHeading)->
      snake = @_obj
      new chai.Assertion(snake.heading).a('function')
      new chai.Assertion(snake.heading()).equal(expectedHeading)
    chai.Assertion.addMethod 'singleElementSnake', (expectedHead, expectedHeading)->
      snake = @_obj
      new chai.Assertion(snake.elements).a('function')
      new chai.Assertion(snake.head).a('function')
      new chai.Assertion(snake.elements()).length(1)
      new chai.Assertion(snake.head()).deep.equal(expectedHead)
      if expectedHeading?
        new chai.Assertion(snake).heading(expectedHeading)



  describe 'Snake', ->
    it 'exists', ->
      expect(createSnake).to.be.a('function')

    it 'creates a snake with a single body element', ->
      snake = createSnake([5,12])
      expect(snake).singleElementSnake([5,12])
      expect(snake.elements()[0]).deep.equal([5,12])


    it 'creates a snake which is heading in the right direction', ->
      snake = createSnake([5,12],'N')
      expect(snake).heading('N')

    it 'moves a snake by creating a new snake', ->
      snake = createSnake([5,12])
      origSnakeElements = snake.elements()
      nextSnake = snake.move()
      expect(snake.elements()).deep.equal(origSnakeElements)
      expect(nextSnake.elements()).not.deep.equal(origSnakeElements)

    describe 'moving forwards', ->
      it 'moves a snake heading north', ->
        snake = createSnake([5,12],'N').move()
        expect(snake).singleElementSnake([5,13],'N')

      it 'moves a snake heading west', ->
        snake = createSnake([5,12],'W').move()
        expect(snake).singleElementSnake([4,12],'W')

      it 'moves a snake heading south', ->
        snake = createSnake([5,12],'S').move()
        expect(snake).singleElementSnake([5,11],'S')

      it 'moves a snake heading east', ->
        snake = createSnake([5,12],'E').move()
        expect(snake).singleElementSnake([6,12],'E')

    describe 'turning', ->
    it 'turns left from west', ->
      snake = createSnake([5,12],'W').move('L')
      expect(snake).singleElementSnake([5,11],'S')

    it 'turns right from west', ->
      snake = createSnake([5,12],'W').move('R')
      expect(snake).singleElementSnake([5,13],'N')


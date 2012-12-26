requirejs = require('requirejs')

requirejs ['cs!snake'], (createSnake)->
  describe 'Snake', ->
    it 'exists', ->
      expect(createSnake).to.be.a('function')

    it 'creates a snake with a single body element', ->
      snake = createSnake([5,12])
      expect(snake.elements()).length(1)
      expect(snake.elements()[0]).deep.equal([5,12])

    it 'reports a snakes head', ->
      snake = createSnake([5,12])
      expect(snake.head()).deep.equal([5,12])


    it 'creates a snake which is heading in the right direction', ->
      snake = createSnake([5,12],'N')
      expect(snake.heading()).equal('N')

    it 'moves a snake by creating a new snake', ->
      snake = createSnake([5,12])
      origSnakeElements = snake.elements()
      nextSnake = snake.move()
      expect(snake.elements()).deep.equal(origSnakeElements)
      expect(nextSnake.elements()).not.deep.equal(origSnakeElements)

    describe 'moving forwards', ->
      it 'moves a snake heading north', ->
        snake = createSnake([5,12],'N').move()

        expect(snake.heading()).equal('N')
        expect(snake.elements()).length(1)
        expect(snake.head()).deep.equal([5,13])

      it 'moves a snake heading west', ->
        snake = createSnake([5,12],'W').move()

        expect(snake.heading()).equal('W')
        expect(snake.elements()).length(1)
        expect(snake.head()).deep.equal([4,12])

      it 'moves a snake heading south', ->
        snake = createSnake([5,12],'S').move()

        expect(snake.heading()).equal('S')
        expect(snake.elements()).length(1)
        expect(snake.head()).deep.equal([5,11])

      it 'moves a snake heading east', ->
        snake = createSnake([5,12],'E').move()

        expect(snake.heading()).equal('E')
        expect(snake.elements()).length(1)
        expect(snake.head()).deep.equal([6,12])

    describe 'turning', ->
    it 'turns left from west', ->
      snake = createSnake([5,12],'W').move('L')

      expect(snake.heading()).equal('S')
      expect(snake.elements()).length(1)
      expect(snake.head()).deep.equal([5,11])

    it 'turns right from west', ->
      snake = createSnake([5,12],'W').move('R')

      expect(snake.heading()).equal('N')
      expect(snake.elements()).length(1)
      expect(snake.head()).deep.equal([5,13])

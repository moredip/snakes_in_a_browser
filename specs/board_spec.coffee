define ['board'], (board)->
  describe 'board', ->
    it 'has a passing test', ->
      expect(1+1).toBe(2)

    it 'has a failing test', ->
      expect(1+1).toBe(3)

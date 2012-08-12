define ->
  setupKernel = ->
    tick = (dir)->
      console.log( "tick: #{dir}" ) 

    {
      tick: tick 
    }


  setupKernel

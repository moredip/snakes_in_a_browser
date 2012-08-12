define  ['lib/bean'], (bean)->
  ->
    input = {}
    _.each ['up','down','left','right','space'], (ev)->
      key ev, -> bean.fire(input,ev)
    input

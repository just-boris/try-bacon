inputAsStream = (input) ->
  input
    .asEventStream "keyup"
    .map (event) -> ($ event.target).val()
    .map (v) -> parseFloat v or 0
    .toProperty 0
$ ->
  a = inputAsStream $ "input[name=a]"
  b = inputAsStream $ "input[name=b]"

  Bacon.combineWith ((a, b) -> a + b), a, b
    .assign ($ '.result'), 'text'
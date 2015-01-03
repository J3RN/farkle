$ ->

  $(".roll_button").click ->
    $.getJSON('./roll', {num_dice: 6}, (data) ->
      $(".results").html(data)
    )


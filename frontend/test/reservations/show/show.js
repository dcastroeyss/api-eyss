const reservation_id = 4

$(document).ready(function() {
  getReservation()
})

const getReservation = () => {
  $.ajax({
    url: `${ip}/reservations/${reservation_id}`,
    data: {token: token},
    success: function(data) {
      printReservation(data.reservation)
    },
    error: function(error) {
      console.log('error', error)
    }
  })
}

const printReservation = reservation => {
  $('#reservations').html('')
  $('#reservations').append(
    $('<tr/>').append(
      $('<td/>').html( reservation.user.email ),
      $('<td/>').html( reservation.room.type_room.name ),
      $('<td/>').html( reservation.date_begin ),
      $('<td/>').html( reservation.date_end )
    )
  )
  $('#reservations').parents().fadeIn('slow')
}
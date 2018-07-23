const reservation_id = new URL(window.location.href).searchParams.get("id");

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
  $('#date_begin').val(reservation.date_begin)
  $('#date_end').val(reservation.date_end)
  $('#room').append( $('<option/>', {value: reservation.room.id}).html(reservation.room.type_room.name) )
  $('#room').val(reservation.room_id)
}

const deleteReservation = () => {
  $.ajax({
    method: 'DELETE',
    url: `${ip}/reservations/${reservation_id}`,
    data: {token: token},
    success: function() {
      document.location.href = '../'
    },
    error: function(error) {
      alert('hubo un error..')
    }
  })
}
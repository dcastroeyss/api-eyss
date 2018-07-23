$(document).ready(function() {
  getReservations()
})

const getReservations = () => {
  $.ajax({
    url: `${ip}/reservations`,
    data: {token: token},
    success: function(data) {
      printReservations( data.reservations )
    },
    error: function(error) {
      alert('error de comunicacion con el API')
    }
  })
} 

const printReservations = reservations => {
  let bodyTable = $('#reservations')
  bodyTable.html('')
  reservations.forEach( reservation => {
    bodyTable.append(
      $('<tr/>').append(
        $('<td/>').html( reservation.user.email ),
        $('<td/>').html( reservation.room.type_room.name ),
        $('<td/>').html( reservation.date_begin ),
        $('<td/>').html( reservation.date_end ),
        $('<td/>').html( $('<a/>', {href:`edit?id=${reservation.id}`}).html('Editar') ),
        $('<td/>').html( $('<a/>', {href:`delete?id=${reservation.id}`}).html(' Eliminar') )
      )
    )
  })

  bodyTable.parents().fadeIn('slow')
}
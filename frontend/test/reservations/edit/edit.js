const reservation_id = new URL(window.location.href).searchParams.get("id");

$(document).ready(function() {
  getRooms()
})

const getRooms = () => {
  $.ajax({
    url: `${ip}/rooms`,
    data: {token: token},
    success: function(data) {
      data.room.forEach( room => {
        $('#room').append(
          $('<option/>', {value: room.id} ).html( room.type_room.name )
        )
      })
      getReservation()
    }
  })
}

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
  $('#room').val(reservation.room_id)
}

const saveReservation = () => {
  if ( validations() ) {
    let data = {
      room_id : $('#room').val(),
      date_begin : $('#date_begin').val(),
      date_end : $('#date_end').val(),
      token : token,
      user_id : 1
    }

    $.ajax({
      method: 'PUT',
      url : `${ip}/reservations/${reservation_id}`,
      data : data, 
      success: function(data) {
        document.location.href = `../show?id=${reservation_id}`
      },
      error: function(error) {
        console.log('hubo un error', error)
      }
    })
  }
}

const validations = () => {
  let aux = true; 
  if ( $('#room').val() === null || $('#room').val() === '' ) {
    alert('Por favor seleccione la habitacion')
    aux = false; 
  } else if ( $('#date_begin').val() === null || $('#date_begin').val() === '' ) {
    alert('Por eliga la fecha de inicio')
    aux = false
  } else if ( $('#date_end').val() === null || $('#date_end').val() === '' ) {
    alert('Por favor eliga la fecha final')
    aux = false 
  }
  return aux;
}
  $(function() {
  $('#quiz-form').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      dataType: 'json',
      data: $(this).serialize(),
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    })


    .done(function(data){
      if(data.status === 'success'){
        $('#question').text(data.question);
        $('#quiz-form').attr('action', '/quizzes/' + data.id + '/check_answer');
        $('#answer').val('');
      } else if (data.status == 'finished'){
        $('body').html('<h1>おめでとうございます！</h1><span>全てのの問題を解答しました！</span>');
      } else if (data.status === 'error'){
        alert(data.message);
      }
    })
    .fail(function(){
      alert('再度トライしてください。')
    })
  })
})
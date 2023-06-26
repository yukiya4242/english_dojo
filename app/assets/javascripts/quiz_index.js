$(function() {
  $('.quiz-genre').click(function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr('href'),
      type: 'GET',
      dataType: 'json',
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    })
    .done(function(data) {
      $('#question').text(data.question);
      $('#quiz-form').attr('action', '/quizzes/' + data.id + '/check_answer');
      $('#quiz-image').attr('src', data.image_url);
      $('#quiz-div').show();
      $('#how-many-quizzes').text('残り問題数: ' + data.remember_quizzes);
    })
    .fail(function() {
      alert('問題の取得に失敗しました。');
    });
  });

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
    .done(function(data) {
      $('#total-score').text(data.total_score);

      if (data.status === 'success') {
        $('#quiz-div').css('background-color', '#ADFF2F');
        $('#quiz-div').fadeOut(500, function() {
          $('#quiz-div').css('background-color', '#FFFFFF');
          $('#question').text(data.question);
          $('#quiz-form').attr('action', '/quizzes/' + data.id + '/check_answer');
          $('#quiz-image').attr('src', data.image_url);
          $('#answer').val('');
          $('#quiz-div').fadeIn(500, function() {
            $('#total-score').text(data.total_score);
            $('#how-many-quizzes').text('残り問題数: ' + data.remember_quizzes);
          });
        });
      } else if (data.status === 'error') {
        alert(data.message);
        $('#total-score').text(data.total_score);
      } else if (data.status == 'finished') {
        $('body').html('<h1>おめでとうございます！</h1><span>全ての問題を解答しました！</span><br><a href="' + data.user_path + '" class="btn">マイページに戻る</a>');
      }
    })
    .fail(function() {
      alert('再度トライしてください。')
    });
  });
});

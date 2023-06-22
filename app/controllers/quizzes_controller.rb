class QuizzesController < ApplicationController

  def index
     quiz_data = Quiz.random_question
     @quiz = Quiz.find_by(content: quiz_data[:answer])
     @question = quiz_data[:question]
     @answer = quiz_data[:answer]
  end

  def show
  end

  def check_answer
    @quiz = Quiz.find(params[:id]) #問題のIDを取得
    answer = answer_params
    if @quiz.content.downcase == params[:answer].downcase
       #ユーザー出した答え(params[:answer])とDBに保存されている正解(@questions.answer)を比較している
       @next_quiz = Quiz.where("id > ?", @quiz.id).first
       #正解したら次の問題(@question.id)に1を加える
       if @next_quiz
         question = hide_random_char(@next_quiz.content)
         render json: { status: 'success', question: question, id: @next_quiz.id }
       else
         render json: { status: 'finished' }
       end
    else
      render json: { status: 'error', message: '不正解です。もう1度挑戦しよう!!'}
    end
  end

  def finished
  end

  private

  def hide_random_char(content)
    replace_count = (content.length.to_f / 2).ceil
    replace_count.times do
      random_index = rand(content.length)
      while content[random_index] == '_'
        random_index = rand(content.length)
      end
      content[random_index] = '_'
    end
    content
  end

  def answer_params
    params.require(:answer)
  end
end

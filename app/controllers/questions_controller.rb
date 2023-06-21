class QuizzesController < ApplicationController

  def index
  end

  def show
    @quiz = Quiz.random_question
  end

  def check_answer
    @quiz = Quiz.find(params[:id]) #問題のIDを取得
    if @quiz.answer.downcase == params[:answer].downcase
       #ユーザー出した答え(params[:answer])とDBに保存されている正解(@questions.answer)を比較している
       @next_quiz = Quiz.find_by(id: @quiz.id + 1)
       #正解したら次の問題(@question.id)に1を加える
       if @next_quiz
         render json: { status: 'success', question: @next_quiz.question, id: @next_quiz.id }
       else
         render json: { status: 'finished' }
       end
    else
      render json: { status: 'error', message: '不正解です。もう1度挑戦しよう!!'}
    end
  end

  def finished
  end
end

class QuestionsController < ApplicationController

  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def check_answer
    @question = Question.find(params[:id]) #問題のIDを取得
    if @question.answer.downcase == params[:answer].downcase
       #ユーザー出した答え(params[:answer])とDBに保存されている正解(@questions.answer)を比較している
       @next_question = Question.find_by(id: @question.id + 1)
       #正解したら次の問題(@question.id)に1を加える
       if @next_question
         render json: { status: 'success', question: @next_question.question, id: @next_question.id }
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

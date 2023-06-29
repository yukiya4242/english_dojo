class QuizzesController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show, :check_answer, :finished]

  def index
    @genre = params[:genre]
    if @genre
      all_quiz_ids = Quiz.where(genre: @genre).pluck(:id)
      answered_quiz_ids = current_user.scores.where(quiz_id: all_quiz_ids).pluck(:genre_id)
      remember_quiz_ids = all_quiz_ids - answered_quiz_ids
      @remember_quizzes = remember_quiz_ids.size

      if remember_quiz_ids.empty?
        # すべての問題が終了したときの処理
        # （ここでは、スコアをリセットしてリダイレクトする例）
        current_user.scores.where(quiz_id: all_quiz_ids).destroy.all
        return
      end

      quiz_id = remember_quiz_ids.sample
    else
      quiz_id = Quiz.pluck(:id).sample
    end

    quiz_data = Quiz.random_question_by_id(quiz_id)
    @quiz = Quiz.find(quiz_data[:id])
    @question = quiz_data[:question]
    @answer = quiz_data[:answer]
    @total_score = 0
    @image_url = @quiz.image_url

     #JSONレスポンスを返す
     respond_to do |format|
       format.html
         format.json do
           render json: {
             id: @quiz.id,
             question: @question,
             total_score: @total_score,
             image_url: @image_url,
             remember_quizzes: @remember_quizzes
           }
         end
      end
  end



  # def index
  #   if params[:genre]
  #     quiz_data = Quiz.random_question(params[:genre])
  #   else
  #     quiz_data = Quiz.random_question
  #   end
  #   @quiz = Quiz.find(quiz_data[:id])
  #   @question = quiz_data[:question]
  #   @answer = quiz_data[:answer]
  #   @total_score = 0
  #   @image_url = @quiz.image_url
  # end

  def show
  end

  def check_answer
    @quiz = Quiz.find(params[:id]) #問題のIDを取得
    answer = answer_params

    if @quiz.content.downcase == params[:answer].downcase
       #ユーザー出した答え(params[:answer])とDBに保存されている正解(@questions.answer)を比較している
       score = current_user.scores.create(point: 10, quiz_id: @quiz.id)
       @next_quiz = Quiz.where("id > ?", @quiz.id).first #正解したら次の問題(@question.id)に1を加える
       total_score = current_user.scores.sum(:point)

       if @next_quiz
         all_quiz_ids = Quiz.where(genre: @quiz.genre).pluck(:id)
         answered_quiz_ids = current_user.scores.where(quiz_id: all_quiz_ids).pluck(:quiz_id)
         remember_quiz_ids = all_quiz_ids - answered_quiz_ids

         question = hide_random_char(@next_quiz.content)
         render json: {
           status: 'success',
           question: question,
           id: @next_quiz.id,
           total_score: total_score,
           image_url: @next_quiz.image_url, #画像URL追加
           remember_quizzes: remember_quiz_ids.size, #この理問題数を追加
           meaning: @quiz.meaning #英単語クイズの意味
           }
       else
         render json: {
           status: 'finished',
           user_path: user_path(current_user)
           }
       end
    else
      score = current_user.scores.create(point: -10, quiz_id: @quiz.id)
      @next_quiz = Quiz.where("id > ?", @quiz.id).first
      total_score = current_user.scores.sum(:point)
      render json: { status: 'error', message: '不正解です。もう1度挑戦しよう!!',
      total_score: total_score,
      meaning: @quiz.meaning
      }
    end
  end

  def start
    current_user.scores.destroy_all
    redirect_to quizzes_path
  end

  def finished
  end

  private

  def hide_random_char(content) #引数contentは置き換える文字列のこと
    replace_count = (content.length.to_f / 2).ceil #contentのlength(長さ)を取得しそれを浮動小数点(to_f)に変換
    #ceilメソッドは小数点切り上げ。この結果文字列の長さの半分以上がreplace_countに代入される
    replace_count.times do
      random_index = rand(content.length) #0からcontentの長さまでのランダムな整数を生成
      while content[random_index] == '_' #ループ開始
        random_index = rand(content.length) #ランダムなインデックスを生成し代入
      end
      content[random_index] = '_' #random_indexの位置にある文字を"_"に置き換え
    end
    content #置き換えが行われた結果の文字列か返される
  end

  def answer_params
    params.require(:answer)
  end
end

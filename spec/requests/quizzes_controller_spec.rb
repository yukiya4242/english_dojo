require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  describe 'POST #check_answer' do
    let(:user) { create(:user) } #テストユーザーを作成
    let(:quiz) { create(:quiz) } #テストクイズを作成

    before { sign_in user } #テストユーザをsign_inさせる

    context 'クイズに正解したら' do
      let(:valid_answer) { quiz.content } #正しい答えを設定します

      it '成功、次のステータスを返す場合' do
        post "/quizzes/#{quiz.id}/check_answer", params: { answer: 'your_ansswer' }

        expect(response).to have_http_status(:success)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(200)

      end
    end

    # context '答えが不正解の場合' do
    #   let(:invalid_answer) { 'incorrect_answer' } #不正解の答えを設置

    #   it 'エラーステータスとエラーメッセージを返す' do
    #     post "/quizzes/#{quiz.id}/check_answer", params: { amswer: 'your_answer' }

    #     expect(response).to have_http_status(:success)
    #     expect(response).to have_http_status(200)
    #     expect(response).to have_http_status(200)
    #     expect(response).to have_http_status('不正解です。もう1度挑戦しよう!!')
    #   end
    # end
  end
end
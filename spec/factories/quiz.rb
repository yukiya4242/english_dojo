 #書き方
# FactoryBot.define do
  #  factory :モデル名 do
  #  カラム名 (name)                 　 {"テストユーザー"}
  #  email     例                  　   {"test@example.com"}
  #  password  例                       {"password"}
  #  password_confirmarion　例          {"password"}


FactoryBot.define do
  factory :quiz do
    content    { "sample content" }        #クイズ内容
    hint       { "sample hint" }           #ヒント
    questions  { "sample questions" }      #質問
    answers    { "sample answer" }         #解答
  end
end

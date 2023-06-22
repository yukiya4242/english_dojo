FactoryBot.define do

  #書き方
  #  factory :モデル名 do
  #  カラム名 (name)                  {"テストユーザー"}
  #  email                            {"test@example.com"}
  #  password                         {"password"}
  #  password_confirmarion            {"password"}



  factory :user do
    username                  {"テストユーザー"}
    email                     {"test@example.com"}
    password                  {"password"}
    password_confirmation     {"password"}
  end

end

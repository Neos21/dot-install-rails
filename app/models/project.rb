class Project < ActiveRecord::Base
  
  # Title の Validation
  validates :title,
    presence: { message: "入力してください。" },      # 必須入力
    length:   { minimum: 3, message: "短すぎます。"}  # 3文字以上 (全角も1文字とみなしてくれる)
  
end

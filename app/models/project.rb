class Project < ActiveRecord::Base
  
  # Task との関連付け
  has_many :tasks
  
  # Title の Validation
  validates :title,
    presence: { message: "入力してください。" },      # 必須入力
    length:   { minimum: 3, message: "短すぎます。"}  # 3文字以上 (全角も1文字とみなしてくれる)
  
end

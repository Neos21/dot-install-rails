class Task < ActiveRecord::Base
  belongs_to :project
  
  # Title の空欄登録を許容しない
  validates :title, presence: true
end

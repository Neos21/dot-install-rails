class Project < ActiveRecord::Base
  
  # Title を必須入力とする Validation
  validates :title, presence: true
  
end

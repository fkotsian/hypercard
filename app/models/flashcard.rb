class Flashcard < ActiveRecord::Base
  validates :title, :question, :answer, presence: true
  
  belongs_to :user
  # belongs_to :category
  # has_many :tags
end

class Answer < ApplicationRecord

  MAX_ANSWERS_VALIDATION = 4

  belongs_to :question

  scope :correct_answer, -> { where(correct: true)}

  validates :validate_answers, on: :create

  def validate_answers
    errors.add(:answer) 
    if question.answers.size >= MAX_ANSWERS_VALIDATION
  end

end

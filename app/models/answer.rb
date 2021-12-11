class Answer < ApplicationRecord
  MAX_ANSWERS_VALIDATION = 4

  belongs_to :question

  scope :correct, -> { where(correct: true)}

  validate :validate_answers, on: :create

  private

  def validate_answers
    errors.add(:base, "Answers must be from 1 to 4") if question.answers.count >= MAX_ANSWERS_VALIDATION
  end

end

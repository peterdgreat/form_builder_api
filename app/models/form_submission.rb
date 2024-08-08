class FormSubmission < ApplicationRecord
  belongs_to :form
  validates :data, presence: true
end

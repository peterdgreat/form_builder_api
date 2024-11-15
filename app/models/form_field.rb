class FormField < ApplicationRecord
  serialize :options, coder: JSON
  validates :field_type, :label, presence: true
  # belongs_to :user
  belongs_to :form

end

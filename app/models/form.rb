class Form < ApplicationRecord
  belongs_to :user
  has_many :form_fields, dependent: :destroy
end

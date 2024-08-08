class Form < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :form_fields, dependent: :destroy
  has_many :form_fields, dependent: :destroy
  has_many :form_submissions, dependent: :destroy

end

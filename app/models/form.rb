class Form < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :form_submissions, dependent: :destroy
  validates :form_fields, presence: true
  has_many :form_fields, dependent: :destroy


end

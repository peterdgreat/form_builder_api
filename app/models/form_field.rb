class FormField < ApplicationRecord
  belongs_to :form
  serialize :options, JSON
end

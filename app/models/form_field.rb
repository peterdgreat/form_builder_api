class FormField < ApplicationRecord
  belongs_to :form
  serialize :options, Array
end

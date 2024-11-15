class AddFormIdToFormFields < ActiveRecord::Migration[7.1]
  def change
    add_reference :form_fields, :form, foreign_key: true
  end
end

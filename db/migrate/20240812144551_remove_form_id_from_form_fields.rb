class RemoveFormIdFromFormFields < ActiveRecord::Migration[7.1]
  def change
    remove_reference :form_fields, :form, null: false, foreign_key: true
  end
end

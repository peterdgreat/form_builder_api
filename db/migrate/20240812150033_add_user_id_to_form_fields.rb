class AddUserIdToFormFields < ActiveRecord::Migration[7.1]
  def change
    add_reference :form_fields, :user, foreign_key: true
  end
end

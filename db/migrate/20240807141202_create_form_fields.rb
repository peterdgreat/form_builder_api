class CreateFormFields < ActiveRecord::Migration[7.1]
  def change
    create_table :form_fields do |t|
      t.references :form, null: false, foreign_key: true
      t.string :field_type
      t.string :label
      t.boolean :required
      t.text :options

      t.timestamps
    end
  end
end

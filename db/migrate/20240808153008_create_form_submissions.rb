class CreateFormSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :form_submissions do |t|
      t.references :form, null: false, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end

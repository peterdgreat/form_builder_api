class AddSlugToForms < ActiveRecord::Migration[7.1]
  def change
    add_column :forms, :slug, :string
    add_index :forms, :slug, unique: true
  end
end

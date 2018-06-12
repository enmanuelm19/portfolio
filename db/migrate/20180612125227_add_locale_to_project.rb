class AddLocaleToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :locale, :integer, default: 0
  end
end

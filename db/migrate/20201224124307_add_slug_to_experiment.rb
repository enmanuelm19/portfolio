class AddSlugToExperiment < ActiveRecord::Migration[6.0]
  def change
    add_column :experiments, :slug, :string
  end
end

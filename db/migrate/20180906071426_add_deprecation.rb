class AddDeprecation < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :deprecated, :boolean, :default => true, :null => false
  end
end

class AddProjectPrecedence < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :precedence, :integer, :default => 0, :null => false
  end
end

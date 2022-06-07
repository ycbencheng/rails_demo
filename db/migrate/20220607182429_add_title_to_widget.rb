class AddTitleToWidget < ActiveRecord::Migration[6.1]
  def change
    add_column :widgets, :title, :string
  end
end

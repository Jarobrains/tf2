class CommetToContents < ActiveRecord::Migration
  def change
    rename_column :thoughts, :comment, :contents
  end
end

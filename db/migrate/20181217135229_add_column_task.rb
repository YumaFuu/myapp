class AddColumnTask < ActiveRecord::Migration[5.2]
  def change
    add_column:tasks,:description,:text
    add_column:tasks,:priority,:integer
    add_column:tasks,:status,:text
    add_column:tasks,:label,:text
    add_column:tasks,:deadline,:date
  end
  
end

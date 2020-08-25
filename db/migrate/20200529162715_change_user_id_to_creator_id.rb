class ChangeUserIdToCreatorId < ActiveRecord::Migration[5.2] 
  def change
    remove_index :events, :user_id
  
    rename_column :events, :user_id, :creator_id
  
    add_index  :events, :creator_id
  end
end

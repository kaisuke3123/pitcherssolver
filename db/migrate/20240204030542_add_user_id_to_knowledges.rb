class AddUserIdToKnowledges < ActiveRecord::Migration[6.1]
  def change
    add_column :knowledges, :user_id, :integer
  end
end

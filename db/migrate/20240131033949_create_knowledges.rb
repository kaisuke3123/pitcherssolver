class CreateKnowledges < ActiveRecord::Migration[6.1]
  def change
    create_table :knowledges do |t|
      t.text :about

      t.timestamps
    end
  end
end

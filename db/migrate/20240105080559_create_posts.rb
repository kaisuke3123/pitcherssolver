class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :problem
      t.text :hypothesis

      t.timestamps
    end
  end
end

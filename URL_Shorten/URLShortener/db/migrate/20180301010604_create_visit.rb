class CreateVisit < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_url_id, null:false
    end
    add_index :visits, [:visitor_id, :visited_url_id], unique: true
  end
end

class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :name
      t.integer :value
    end    
  end
end

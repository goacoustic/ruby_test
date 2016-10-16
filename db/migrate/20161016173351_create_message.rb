class CreateMessage < ActiveRecord::Migration[5.0]
   def up
  	create_table :messages, {:id => false} do |t|
  		t.text :text
      t.string :id
  	end
  end

  def down
  	drop_table :messages
  end
end

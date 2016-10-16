class CreateMessage < ActiveRecord::Migration[5.0]
   def up
  	create_table :messages do |t|
  		t.string :text
      t.string :id
  	end
  end

  def down
  	drop_table :messages
  end
end

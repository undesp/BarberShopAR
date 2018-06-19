class CreateClients < ActiveRecord::Migration[5.2]
  def change
  	create_table :client do |t|
  		t.string :name
  		t.string :phone
  		t.timestamp :datestamp
  		t.string :barber
  		t.string :color

  		t.timestamps
  	end
  end
end

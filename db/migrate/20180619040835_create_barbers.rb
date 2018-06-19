class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
  	create_table :barbers do |t|
  		t.string :name
  		
  		t.timestamps
  	end
	Barber.create :name => 'Леся'
	Barber.create :name => 'Ольга'
	Barber.create :name => 'Юлия'

  end
end

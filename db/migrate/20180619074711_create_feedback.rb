class CreateFeedback < ActiveRecord::Migration[5.2]
  def change
  	 	create_table :feedbacks do |t|
  		t.text :message
		t.integer :user_id  		
  		t.timestamps
  	end
  end
end

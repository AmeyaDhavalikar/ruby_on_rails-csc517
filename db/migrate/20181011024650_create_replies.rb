class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer "inquiry_id"
      t.integer "user_id"
      t.string "reply_message"
      t.timestamps
    end
  end
end

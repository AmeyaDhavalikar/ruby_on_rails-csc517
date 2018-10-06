class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.text :message_content

      t.timestamps
    end
  end
end

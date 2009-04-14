class CreateMailLogs < ActiveRecord::Migration
  def self.up
    create_table :mail_logs do |t|
      t.string   :subject, :to, :from, :cc
      t.text     :body, :message
      t.timestamps
    end
    
    change_table :mail_logs do |t|
      t.index :subject
      t.index :to
      t.index :from
      t.index :created_at
    end
  end
  
  def self.down
    drop_table :mail_logs
  end
end

class AddTimestampsVotes < ActiveRecord::Migration
  def change
    add_timestamps :questions

    create_table :votes do |t|
      t.integer :answer_id
      t.integer :user_id
      t.string :vote
    end
  end
end

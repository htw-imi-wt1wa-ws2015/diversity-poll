class AddPollRefToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :poll, index: true, foreign_key: true
  end
end

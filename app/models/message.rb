class Message < ApplicationRecord
  validates :text, presence: true
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'

  before_create :update_last

  def update_last
    Message.where("((sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)) AND is_last = ?",
                  self.sender_id, self.receiver_id, self.receiver_id, self.sender_id, true).update_all(is_last: false)
  end
end

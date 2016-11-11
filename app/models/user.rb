class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :user_name, presence: true
  validates :user_name, uniqueness: true

  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'receiver_id', class_name: 'Message'


  def message_summery
    Message.includes(:sender, :receiver).where("(sender_id = ? OR receiver_id = ?) AND is_last = ?",
                                               self.id, self.id, true)
  end

  def messages_with(user_id)
    Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
                  self.id, user_id, user_id, self.id)
  end

end

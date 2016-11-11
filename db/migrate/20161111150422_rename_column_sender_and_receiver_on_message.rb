class RenameColumnSenderAndReceiverOnMessage < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :sender, :sender_id
    rename_column :messages, :receiver, :receiver_id
  end
end

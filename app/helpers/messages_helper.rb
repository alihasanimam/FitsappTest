module MessagesHelper
  def print_summery(message)
    %{
      <h4>
      #{messaging_with(message).name}
      </h4>
      #{message.text[0..20]}...
    }.html_safe
  end

  def messaging_with(message)
    message.sender.id == current_user.id ? message.receiver : message.sender
  end
end

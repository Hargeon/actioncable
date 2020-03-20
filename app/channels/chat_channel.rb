class ChatChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:owner])
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class MessagesController < ApplicationController
  def create
    user = User.find(message_params[:owner_id])
    ChatChannel.broadcast_to(user, message: message_params[:msg])
  end

  private

  def message_params
    params.require(:message).permit(:owner_id, :msg)
  end
end

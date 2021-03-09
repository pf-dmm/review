class NotificationsController < ApplicationController

  def destroy
    notification=Notification.find(params[:id])
    if notification.delete
      redirect_to request.referer
    end
  end
end

class StaticPagesController < ApplicationController
  def show_all
    if logged_in?
    	@status = current_user.statuses.build 
    	@feed_items = current_user.feeds.paginate(page: params[:page])
    end
  end

  def show
  	if logged_in?
    	@status = current_user.statuses.build 
    	@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end

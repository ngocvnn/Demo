class StatusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    # @statuses = Status.all
    @statuses = Status.paginate(page: params[:page])
  end
  
  def show
    @status = Status.find(params[:id])
  end

  def about
  end

  def help
  end
  
  def contact
  end

  def create
    @status = current_user.statuses.build(status_params)
    if @status.save
      flash[:success] = "Status created!"
      redirect_to feed_url
    else
      @feed_items = []
      render 'static_pages/show'
    end
  end

  def destroy
    Status.find(params[:id]).destroy
    flash[:success] = "Status deleted!"
    redirect_to feed_url
  end


  private

    def status_params
      params.require(:status).permit(:title,:content)
    end
end

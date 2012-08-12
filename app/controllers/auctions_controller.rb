class AuctionsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @auction = current_user.auctions.build(params[:auction])
    if @auction.save
      flash[:success] = "Auction created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @auction.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @auction = current_user.auctions.find_by_id(params[:id])
      redirect_to root_path if @auction.nil?
    end
end




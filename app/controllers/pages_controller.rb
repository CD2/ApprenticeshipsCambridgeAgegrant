class PagesController < ApplicationController
  
  def show
    @page = Page.friendly.find(params[:id] || 'home')
  end

end

class StaticPagesController < ApplicationController
  def index
    puts request.user_agent
    @mobile = (request.user_agent.include?('iPhone') || request.user_agent.include?('Android'))
    puts @mobile
    @categories = Category.all
  end
end

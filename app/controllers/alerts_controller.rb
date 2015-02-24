class AlertsController < ApplicationController
  before_action :require_user
  
  def index
    @alerts = Alert.all.order('created_at desc')
  end

  def new
    @alert = Alert.new
    @phrases = Phrase.all        
  end

  def create
    phrase = Phrase.find(params[:phrase_id]).body
    @alert = Alert.new(phrase: phrase)

    if @alert.save
      flash[:notice] = 'The alert was sent successfully'
      redirect_to user_path(current_user)
    else
      render :new
    end
  end 
end

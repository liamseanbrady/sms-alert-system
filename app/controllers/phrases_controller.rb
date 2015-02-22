class PhrasesController < ApplicationController
  before_action :require_user

  def new
    @phrase = Phrase.new
    @phrases = Phrase.all
  end

  def create
    @phrase = Phrase.new(phrase_params)

    if @phrase.save
      flash[:notice] = 'You created a new phrase'
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def phrase_params
    params.require(:phrase).permit(:body)
  end
end

class PhrasesController < ApplicationController
  before_action :require_user

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)

    if @phrase.save
      flash[:notice] = 'You created a new phrase'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'The phrase could not be created. Please try again.'
      render :new
    end
  end
end

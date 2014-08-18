class FlashcardsController < ApplicationController
  def index
    @cards = current_user.cards.all
  end

  def new
  end

  def create
    @card = current_user.cards.new(flashcard_params)
    if @card.save
      redirect_to @card
    else
      flash.now[:error] = @card.errors.full_messages.map(&:to_s)
      render :new
    end
  end

  def show
    @card = Flashcard.find(params[:id])
  end

  def edit
    @card = Flashcard.find(params[:id]) || Flashcard.new
  end

  def update
    @card = Flashcard.find(params[:id])
    if @card.update_attributes(flashcard_params)
      flash[:success] = "Successfully updated"
      redirect_to @card
    else
      flash[:error] = @card.errors.full_messages.map(&:to_s)
      render :edit
    end
  end

  def destroy
    @card = Flashcard.find(params[:id])
    if @card.destroy
      flash[:success] = "Flashcard deleted"
    else
      flash[:error] = "Could not delete card"
    end
    
    redirect_to :index
  end
  
  private
  def flashcard_params
    params.require(:flashcard).permit(:title, :question, :answer, :user_id)
  end
end

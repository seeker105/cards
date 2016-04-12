class CardsController < ApplicationController

  def index
    # byebug
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    # byebug
    redirect_to card_path(@card.id)

  end

  def show
    @card = Card.find(params[:id])
  end

  private
    def card_params
      params.require(:card).permit(:name, :value)
    end

end

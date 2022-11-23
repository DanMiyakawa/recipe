class Public::MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to menu_path(@menu.id)
  end

  def index
    @menu = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def menu_params
    params.require(:menu).permit(:user_id, :name, :introduction, :genre_id, :recipe_image, :status,
    ingredients_attributes:[:id, :name, :amount, :_destroy],
    steps_attributes:[:id, :number, :explanation, :_destroy])
  end

end

class Public::MenusController < ApplicationController

  def new
    @menu = Menu.new
   @menu.ingredients.build
    2.times {
    @menu.steps.build
    }
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menu_path(@menu.id)
    else
      render 'new'
    end
  end

  def index
    @menu = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:user_id, :name, :introduction, :genre_id, :menu_image, :status, ingredients_attributes:[:id, :menu_id, :name, :amount, :_destroy], steps_attributes:[:id, :menu_id, :number, :explanation, :_destroy])
  end

end

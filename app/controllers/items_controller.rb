class ItemsController < ApplicationController
  
  load_and_authorize_resource

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = current_user.items.new(item_params)
    if item.save
      redirect_to notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully updated.'
    else
       :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end

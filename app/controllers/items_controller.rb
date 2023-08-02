class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to recipes_path, success: 'セーブできました'
    else
      flash.now[:danger] = "セーブ失敗"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_image)
  end
end

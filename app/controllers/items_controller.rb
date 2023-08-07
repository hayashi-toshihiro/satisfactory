class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash.now[:success] = "セーブ成功"
      redirect_to recipes_path
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

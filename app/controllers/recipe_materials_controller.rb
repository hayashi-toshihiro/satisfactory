class RecipeMaterialsController < ApplicationController

  def new
    @form = Form::RecipeMaterialCollection.new
  end

  def create
    @form = Form::RecipeMaterialCollection.new(recipe_time_collection_params)
    if @form.save
      redirect_to recipes_path, notice: "登録できたよ"
    else
      flash.now[:alert] = "できんかった"
      render :new
    end
  end

  private

  def recipe_material_params
    params.require(:recipe_material).permit()
  end
end

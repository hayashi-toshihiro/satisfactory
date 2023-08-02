class RecipesController < ApplicationController

  def new
# 新しいレシピの登録
    @recipe = Recipe.new
# 同時に中間テーブルも作成する
    @recipe_material = @recipe.recipe_materials.build
    @recipe_product = @recipe.recipe_products.build
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
# 完成物(recipe_products)中間テーブル作成のための配列を取得
    @products = Item.where(id: params[:recipe][:recipe_products])
    recipe_products_times = params[:recipe][:recipe_products_time]
# @productsとrecipe_products_timeの配列を順番に合成  [["完成物１",10],["完成物２",20]]  と言う配列ができる。
  # @recipeのproducts配列に追加  同じく、@recipeのrecipe_products配列に追加。（products配列と順番が狂わないように場所の調整）（timeの未入力に対応）

    @products.zip(recipe_products_times) do |product, recipe_products_time|
      @recipe.products << [product]
      @recipe.recipe_products[@recipe.products.size - 1].product_time = recipe_products_time.to_i
    end

# 素材（recipe_materials)についても同様な処理を実行
    @materials = Item.where(id: params[:recipe][:recipe_materials])
    recipe_materials_times = params[:recipe][:recipe_materials_time]
    @materials.zip(recipe_materials_times) do |material, recipe_materials_time|
      @recipe.materials << [material]    
      @recipe.recipe_materials[@recipe.materials.size - 1].material_time = recipe_materials_time.to_i  
    end

    if @recipe.save
      flash[:success] = "セーブ完了！"
      redirect_to recipes_path
    else
      flash[:danger] = "セーブできていないよ"
      redirect_to recipes_path
    end
  end

  def index
# formが増えてもrecipe_cardを区別する為の変数
    $global = 0
# formの追加の場所を決める為の変数
    @count_a = 0
    @count_b = 0
    @count_c = 0
    @button_count = "#{@count_c}-#{@count_b}-#{@count_a}"
    @recipe = Recipe.find(1)
    if params[:recipe_id].present?
      @recipe = Recipe.find(params[:recipe_id])
    end
  end

  def card_update
# どのカードをupdateするか区別する
    @global = params[:global]
    @recipe = Recipe.find(params[:recipe_id])
# ajaxでupdate
    respond_to do |format|
      format.js
    end
  end

  def form_add
    $global += 1
    @recipe = Recipe.find(1)

    count_c, count_b, count_a = params[:button_count].split('-').map(&:to_i)
# どのボタンが押されたか区別し、場所に応じて追加場所を決定する。
    if count_b == 0 # 一列目のボタンであるなら ２列目用の@button_count_nと１列目用の@button_count_oを作成
      @button_count_n = "#{count_c}-#{count_b + 1}-#{count_a}"
      @button_count_o = "#{count_c}-#{count_b}-#{count_a + 1}"
    elsif count_b > 0 && count_c == 0 # ２列目で生成されたボタンなら
      @button_count_n = "#{count_c + 1}-#{count_b}-#{count_a}"
      @button_count_o = "#{count_c}-#{count_b + 1}-#{count_a}"
    end
    @button_count = "#{count_c}-#{count_b}-#{count_a}"
# ajaxで追加する
    respond_to do |format|
      format.js
    end
  end

  def destroy_form
    $global = params[:global].to_i
  end

private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :machine_id)
  end
end

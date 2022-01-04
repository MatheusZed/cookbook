class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @rt = RecipeType.all
    @cs = Cuisine.all
  end

  def create
    @recipe = Recipe.new(name:              params[:recipe][:name],
                         recipe_type_id:    params[:recipe][:recipe_type_id],
                         cuisine_id:        params[:recipe][:cuisine_id],
                         ingredients:       params[:recipe][:ingredients],
                         cook_method:       params[:recipe][:cook_method],
                         cook_time:         params[:recipe][:cook_time])
    @rt = RecipeType.all
    @cs = Cuisine.all

    if @recipe.save()
      redirect_to recipe_path(@recipe.id), notice: 'A receita foi salvo com sucesso!'
    else
      flash.now[:alert] = 'Nao foi possivel salvar a receita'
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @rt = RecipeType.all
    @cs = Cuisine.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @rt = RecipeType.all
    @cs = Cuisine.all

    if @recipe.update(name:              params[:recipe][:name],
                      recipe_type_id:    params[:recipe][:recipe_type_id],
                      cuisine_id:        params[:recipe][:cuisine_id],
                      ingredients:       params[:recipe][:ingredients],
                      cook_method:       params[:recipe][:cook_method],
                      cook_time:         params[:recipe][:cook_time])

      redirect_to recipe_path(@recipe.id), notice: 'A receita foi editada com sucesso!'
    else
      flash.now[:alert] = 'Nao foi possivel editar a receita'
      render 'edit'
    end
  end
end

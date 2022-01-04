class RecipeTypesController < ApplicationController
  def new
    @rt = RecipeType.new
  end

  def create
    type_params = params.require(:recipe_type).permit(:name)
    @rt = RecipeType.new(type_params)

    if @rt.save()
      redirect_to new_recipe_type_path, notice: 'O tipo da receita foi salvo com sucesso!'
    else
      flash.now[:alert] = 'Nao foi possivel salvar o tipo da receita'
      render 'new'
    end
  end
end
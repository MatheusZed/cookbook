class CuisinesController < ApplicationController
  def new
    @cs = Cuisine.new
  end

  def create
    type_params = params.require(:cuisine).permit(:name)
    @cs = Cuisine.new(type_params)

    if @cs.save()
      redirect_to new_cuisine_path, notice: 'O tipo da receita foi salvo com sucesso!'
    else
      flash.now[:alert] = 'Nao foi possivel salvar o tipo da receita'
      render 'new'
    end
  end
end

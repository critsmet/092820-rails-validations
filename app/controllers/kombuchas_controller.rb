class KombuchasController < ApplicationController

  def index
    @kombuchas = Kombucha.all
    # render :index
  end

  def show # '/kombuchas/:id'
    @kombucha = Kombucha.find_by(id: params[:id])
    # render :show
  end

  def new
    @kombucha = Kombucha.new
    # render :new
  end

  def create
    @kombucha = Kombucha.new(kombucha_params(params_array))
    if @kombucha.save
      redirect_to kombucha_path(@kombucha)
    else
      render :new
    end
    # redirect_to "/kombuchas/#{kombucha.id}"
  end

  def edit
    @kombucha = Kombucha.find_by(id: params[:id])
    # render :edit
  end

  def update
    @kombucha = Kombucha.find_by(id: params[:id])
    @kombucha.assign_attributes(kombucha_params(params_array))
    if @kombucha.save
      redirect_to kombucha_path(@kombucha)
    else
      render :edit
    end
  end

  def destroy
    kombucha = Kombucha.find_by(id: params[:id])
    kombucha.destroy
    redirect_to
  end

  private

  def kombucha_params(array_args)
    params.require(:kombucha).permit(array_args)
  end

  def params_array
    [:flavor, :notes, :brew_time]
  end

end

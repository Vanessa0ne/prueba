class LendersController < ApplicationController
  class ProspectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_lenders, only: %i[show edit update destroy]

  def index
    @lenders = lender.all
    respond_to do |format|
      format.html
    end
  end

  def list
  end

  def new
    @lender = lender.new
  end

  def create
    @lender = lender.new(lender_params)

    if @lender.save
      redirect_to lender_path
      flash[:notice] = "el lender #{@lender.name} ha sido creado exitosamente."
    else
       flash[:notice] = "el lender no pudo ser creado."
       render :new
    end
  end

  def show
    @lender = lender.new
  end

  def edit
  end

  def update
    if @lender = lender.new.update(@lender = lender.new_params)
        redirect_to @lender = lender.new_path
        flash[:notice] = "prestamista #{@@lender = lender.new.name} ha sido actualizado exitosamente."
    else
        render :edit
    end
  end

  def destroy
    @lender = lender.new.destroy
    redirect_to lenders_path
  end

    private

  def set_lender
    @lender = lender.find(params[:id])
  end

  def lender_params
    params.require(:lender).permit(:name, :description, :phone, :email, :state)
  end
end
end

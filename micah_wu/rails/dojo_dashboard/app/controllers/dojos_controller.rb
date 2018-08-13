class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def create
    dojo = Dojo.create(dojo_params)
    unless dojo.valid?
      flash[:notice] = dojo.errors.full_messages
      redirect_to "/dojos/new"
    else
      redirect_to "/dojos"
    end
  end
  
  def show
    @dojo = Dojo.find(params[:id])
    @students = Student.where("dojo_id = #{params[:id]}")
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    dojo = Dojo.find(params[:id])
    dojo.update(dojo_params)
    unless dojo.valid?
      flash[:notice] = dojo.errors.full_messages
      redirect_to "/dojos/#{params[:id]}/edit"
    else
      redirect_to "/dojos/#{params[:id]}"
    end
  end

  def delete
    Dojo.find(params[:id]).delete
    redirect_to "/"
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end

class StudentsController < ApplicationController
  def index
  end

  def new
  @dojos = Dojo.where.not(id: params[:dojo_id])
  @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    student = Student.create(student_params)
    unless student.valid?
      flash[:notice] = student.errors.full_messages
      redirect_to "/dojos/new"
    else
      redirect_to "/dojos"
    end
  end

  def show
    @dojos = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def edit
  end

  private
    def student_params
      puts params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end

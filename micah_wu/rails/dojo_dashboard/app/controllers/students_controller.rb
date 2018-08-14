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
      redirect_to "/dojos/#{params[:dojo_id]}/students/new"
    else
      redirect_to "/dojos/#{params[:dojo_id]}"
    end
  end

  def show
    @dojos = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def edit
    @dojos = Dojo.where.not(id: params[:dojo_id])
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    unless student.valid?
      flash[:notice] = student.errors.full_messages
      redirect_to "/dojos/#{params[:dojo_id]}/students/#{params[:id]}/edit"
    else
      redirect_to "/dojos/#{params[:dojo_id]}/"
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to "/dojos/#{params[:dojo_id]}"
  end

  private
    def student_params
      puts params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end

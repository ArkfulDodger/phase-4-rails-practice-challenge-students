class StudentsController < ApplicationController
  # assign @student variable based on params[:id]
  before_action :find_student, only: %i[show update destroy]

  # GET /students
  def index
    students = Student.all
    render json: students
  end

  # GET /students/:id
  def show
    render json: @student
  end

  # POST /students
  def create
    new_student = Student.create!(student_params)
    render json: new_student, status: :created
  end

  # PATCH /students/:id
  def update
    @student.update!(student_params)
    render json: @student, status: :accepted
  end

  # DELETE /students/:id
  def destroy
    @student.destroy

    # head :no_content
    render json: @student, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_student
    @student = Student.find(params[:id])
  end

  # permissible params to be used by create/update
  def student_params
    params.permit(:id, :name, :major, :age, :instructor_id)
  end
end

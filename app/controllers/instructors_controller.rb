class InstructorsController < ApplicationController
  # assign @instructor variable based on params[:id]
  before_action :find_instructor, only: %i[show update destroy]

  # GET /instructors
  def index
    instructors = Instructor.all
    render json: instructors
  end

  # GET /instructors/:id
  def show
    render json: @instructor
  end

  # POST /instructors
  def create
    new_instructor = Instructor.create!(instructor_params)
    render json: new_instructor, status: :created
  end

  # PATCH /instructors/:id
  def update
    @instructor.update!(instructor_params)
    render json: @instructor, status: :accepted
  end

  # DELETE /instructors/:id
  def destroy
    @instructor.destroy

    # head :no_content
    render json: @instructor, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_instructor
    @instructor = Instructor.find(params[:id])
  end

  # permissible params to be used by create/update
  def instructor_params
    params.permit(:id, :name)
  end
end

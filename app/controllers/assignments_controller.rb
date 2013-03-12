class AssignmentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @assignments = Assignment.all
    render json: @assignments
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.user = current_user

    if @assignment.save
      redirect_to photos_path, notice: 'Assignment was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /assignments/1
  def update
    @assignment = Assignment.find(params[:id])

    if @assignment.update_attributes(params[:assignment])
      redirect_to photos_path, notice: 'Assignment was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /assignments/1
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    redirect_to photos_path, notice: 'Assignment was successfully deleted.'
  end
end

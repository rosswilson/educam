class AssignmentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @assignments = Assignment.all
    render json: @assignments
  end

  def new
    @assignment = Assignment.new
    @existing_record = false

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @existing_record = true
  end

  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.user = current_user
    @existing_record = false

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to root_path, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    @existing_record = true

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to root_path, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Assignment was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end

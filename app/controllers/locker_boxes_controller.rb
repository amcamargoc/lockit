class LockerBoxesController < ApplicationController
  load_and_authorize_resource
  check_authorization
  before_action :set_locker_box, only: [:show, :edit, :update, :destroy]

  def index
    @locker_boxes = LockerBox.all
  end

  def show
  end

  def new
    @locker_box = LockerBox.new
  end

  def edit
  end

  def create
    @locker_box = LockerBox.new(locker_box_params)

    respond_to do |format|
      if @locker_box.save
        format.html { redirect_to @locker_box, notice: 'Locker box was successfully created.' }
        format.json { render :show, status: :created, location: @locker_box }
      else
        format.html { render :new }
        format.json { render json: @locker_box.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @locker_box.update(locker_box_params)
        format.html { redirect_to @locker_box, notice: 'Locker box was successfully updated.' }
        format.json { render :show, status: :ok, location: @locker_box }
      else
        format.html { render :edit }
        format.json { render json: @locker_box.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @locker_box.destroy
    respond_to do |format|
      format.html { redirect_to locker_boxes_url, notice: 'Locker box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locker_box
      @locker_box = LockerBox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locker_box_params
      params.require(:locker_box).permit(:identification, :name, :description)
    end
end

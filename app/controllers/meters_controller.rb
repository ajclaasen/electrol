class MetersController < ApplicationController
  before_action :set_meter, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  before_action :authorize_employee, only: %i[ new create ]

  # GET /meters or /meters.json
  def index
    @meters = Meter.all
  end

  # GET /meters/1 or /meters/1.json
  def show
  end

  # GET /meters/new
  def new
    @meter = Meter.new
  end

  # POST /meters or /meters.json
  def create
    @meter = Meter.new(meter_params)

    respond_to do |format|
      if @meter.save
        format.html { redirect_to @meter, notice: "Meter was successfully created." }
        format.json { render :show, status: :created, location: @meter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meters/1 or /meters/1.json
  def update
    respond_to do |format|
      if @meter.update(meter_params)
        format.html { redirect_to @meter, notice: "Meter was successfully updated." }
        format.json { render :show, status: :ok, location: @meter }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meters/1 or /meters/1.json
  def destroy
    @meter.destroy
    respond_to do |format|
      format.html { redirect_to meters_url, notice: "Meter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def authorize_employee
      unless current_user.employee?
        redirect_to root_path
      end
    end

    def authorize_manager
      unless current_user.manager?
        redirect_to root_path
      end
    end

    def set_meter
      @meter = Meter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meter_params
      trusted = params.require(:meter).permit(:name, :start, :finish, :interval, :unit, measurements_attributes: [:amount, :id])
      trusted[:interval] = Meter.interval_options[trusted[:interval].to_sym] if trusted[:interval].present?
      trusted
    end
end

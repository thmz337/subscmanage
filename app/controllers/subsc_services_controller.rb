class SubscServicesController < ApplicationController
  before_action :set_subsc_service, only: %i[ show edit update destroy ]

  def index
    @subsc_services = SubscService.all
  end

  def show
  end

  def new
    @subsc_service = SubscService.new
  end

  def edit
  end

  def create
    @subsc_service = SubscService.new(subsc_service_params)

    respond_to do |format|
      if @subsc_service.save
        format.html { redirect_to @subsc_service, notice: "Subsc service was successfully created." }
        format.json { render :show, status: :created, location: @subsc_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subsc_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsc_services/1 or /subsc_services/1.json
  def update
    respond_to do |format|
      if @subsc_service.update(subsc_service_params)
        format.html { redirect_to @subsc_service, notice: "Subsc service was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @subsc_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subsc_service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subsc_service.destroy!

    respond_to do |format|
      format.html { redirect_to subsc_services_path, notice: "Subsc service was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_subsc_service
      @subsc_service = SubscService.find(params.expect(:id))
    end

    def subsc_service_params
      params.expect(subsc_service: [ :name, :next_payment, :payment_interval, :payment_unit, :price ])
    end
end

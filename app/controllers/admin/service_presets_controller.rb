class Admin::ServicePresetsController < Admin::BaseController
  before_action :set_admin_service_preset, only: %i[ show edit update destroy ]

  # GET /admin/service_presets or /admin/service_presets.json
  def index
    @admin_service_presets = Admin::ServicePreset.all
  end

  # GET /admin/service_presets/1 or /admin/service_presets/1.json
  def show
  end

  # GET /admin/service_presets/new
  def new
    @admin_service_preset = Admin::ServicePreset.new
  end

  # GET /admin/service_presets/1/edit
  def edit
  end

  # POST /admin/service_presets or /admin/service_presets.json
  def create
    @admin_service_preset = Admin::ServicePreset.new(admin_service_preset_params)

    respond_to do |format|
      if @admin_service_preset.save
        format.html { redirect_to @admin_service_preset, notice: "Service preset was successfully created." }
        format.json { render :show, status: :created, location: @admin_service_preset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_service_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/service_presets/1 or /admin/service_presets/1.json
  def update
    respond_to do |format|
      if @admin_service_preset.update(admin_service_preset_params)
        format.html { redirect_to @admin_service_preset, notice: "Service preset was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_service_preset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_service_preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/service_presets/1 or /admin/service_presets/1.json
  def destroy
    @admin_service_preset.destroy!

    respond_to do |format|
      format.html { redirect_to admin_service_presets_path, notice: "Service preset was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_service_preset
      @admin_service_preset = Admin::ServicePreset.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_service_preset_params
      params.expect(admin_service_preset: [ :name, :payment_interval, :payment_unit, :price ])
    end
end

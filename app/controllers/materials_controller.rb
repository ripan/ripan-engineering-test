class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all

    render json: @materials
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    render json: @material
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    if @material.save
      render json: @material, status: :created, location: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    @material = Material.find(params[:id])
    @material.supplier = Supplier.find(params[:material][:supplier][:id])

    if @material.update(material_params)
      head :no_content
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy

    head :no_content
  end

  private

    def set_material
      @material = Material.find(params[:id])
    end

    def material_params
      params.require(:material).permit(:title, :episode, :year, :som, :eom, :aspect_ratio, :material_type, :delivery_channel_group, :supplier_id)
    end
end

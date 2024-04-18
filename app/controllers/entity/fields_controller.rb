class Entity::FieldsController < ApplicationController
  before_action :set_entity_field, only: [:show, :update, :destroy]

  def index
    @entity_fields = Entity::Field.all.page(params[:page]).per(params[:per] || 10)
  end

  def show
  end

  def create
    @entity_field = Entity::Field.new(entity_field_params)

    if @entity_field.save
      render :create, status: :created, location: @entity_field
    else
      render :create, status: :unprocessable_entity
    end
  end

  def update
    if @entity_field.update(entity_field_params)
      render :update, status: :ok
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @entity_field.destroy
  end

  private

  def set_entity_field
    @entity_field = Entity::Field.find(params[:id])
  end

  def entity_field_params
    params.require(:entity_field).permit(:label, :entity_fieldable_id, :entity_fieldable_type)
  end
end

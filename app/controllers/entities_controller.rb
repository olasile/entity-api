class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :update, :destroy]

  def index
    @entities = Entity.all.page(params[:page]).per(params[:per] || 10)
  end

  def show
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save
      render :create, status: :created, location: @entity
    else
      render :create, status: :unprocessable_entity
    end
  end

  def update
    if @entity.update(entity_params)
      render :update, status: :ok
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @entity.destroy
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name)
  end
end

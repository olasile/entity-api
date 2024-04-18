class Entity::RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @entity = Entity.find_by(name: params[:entity_name])
    if @entity.nil?
      render json: { error: "Entity not found" }, status: :not_found
    else
      if params[:field_labels]
        field_ids = Entity::Field.where(label: params[:field_labels].split(','), entity_fieldable: @entity).pluck(:id)

        @q = Entity::Record.includes(entity_values: :entity_field)
                           .where(entity: @entity, entity_values: { entity_field_id: field_ids })
                           .ransack(params[:q])

      else
        # Fallback to basic search if no field labels are specified
        @q = Entity::Record.includes(entity_values: :entity_field)
                           .where(entity: @entity)
                           .ransack(params[:q])
      end

      @entity_records = @q.result(distinct: true).page(params[:page]).per(params[:per] || 10)
    end
  end
end

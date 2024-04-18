class Entity::FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    entity = Entity.find_by(id: params[:entity_id])

    if entity.nil?
      render json: { error: 'Entity not found' }, status: :not_found
      return
    end

    entity_favourite = current_user.entity_favourites.build(entity: entity)

    if entity_favourite.save
      render json: { message: 'Entity added to favourites successfully.' }, status: :created
    else
      render json: { error: 'Failed to add entity to favourites.' }, status: :unprocessable_entity
    end
  end
end
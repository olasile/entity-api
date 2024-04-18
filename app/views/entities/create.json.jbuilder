if @entity.persisted?
  json.extract! @entity, :id, :name
  json.set! :status, 'created'
else
  json.errors @entity.errors.full_messages
end

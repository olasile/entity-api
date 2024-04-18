if @entity.errors.any?
  json.errors @entity.errors.full_messages
else
  json.extract! @entity, :id, :name
end

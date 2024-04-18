if @entity_field.errors.any?
  json.errors @entity_field.errors.full_messages
else
  json.extract! @entity_field, :id, :label
end

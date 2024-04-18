if @entity_field.persisted?
  json.extract! @entity_field, :id, :label
  json.set! :status, 'created'
else
  json.errors @entity_field.errors.full_messages
end

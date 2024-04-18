json.entity_fields @entity_fields do |entity_field|
  json.id entity_field.id
  json.label entity_field.label
  json.entity_fieldable do
    json.id entity_field.entity_fieldable.id
    json.name entity_field.entity_fieldable.name
  end
end

json.pagination do
  json.current_page @entity_fields.current_page
  json.total_pages @entity_fields.total_pages
  json.total_count @entity_fields.total_count
  json.per_page @entity_fields.limit_value
end

json.entity_records @entity_records do |record|
  json.id record.id
  json.entity_values record.entity_values do |entity_value|
    json.id entity_value.id
    json.value entity_value.value
    json.entity_field do
      json.id entity_value.entity_field.id
      json.label entity_value.entity_field.label
    end
  end
end

json.pagination do
  json.current_page @entity_records.current_page
  json.total_pages @entity_records.total_pages
  json.total_count @entity_records.total_count
  json.per_page @entity_records.limit_value
end

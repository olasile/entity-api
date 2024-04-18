json.entities @entities do |entity|
  json.id entity.id
  json.name entity.name
end

json.pagination do
  json.current_page @entities.current_page
  json.total_pages @entities.total_pages
  json.total_count @entities.total_count
  json.per_page @entities.limit_value
end

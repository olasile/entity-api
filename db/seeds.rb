require 'net/http'
require 'json'

url = URI('https://animechan.xyz/api/quotes')
response = Net::HTTP.get(url)
quotes = JSON.parse(response)

Entity.transaction do
  anime_quote_entity = Entity.create!(name: "Anime Quote")
  quote_field = anime_quote_entity.entity_fields.create!(label: 'quote', field_type: 'string')
  anime_field = anime_quote_entity.entity_fields.create!(label: 'anime', field_type: 'string')
  character_field = anime_quote_entity.entity_fields.create!(label: 'character', field_type: 'string')

  quotes.each do |quote_data|
    record = anime_quote_entity.entity_records.create!
    record.entity_values.create!(entity_field: quote_field, value: quote_data['quote'])
    record.entity_values.create!(entity_field: anime_field, value: quote_data['anime'])
    record.entity_values.create!(entity_field: character_field, value: quote_data['character'])
  end
end

user = User.create!(
  name: 'Jane Doe',
  email: 'janedoe@test.com',
  password: 'password123',
  password_confirmation: 'password123'
)

if user.persisted?
  user.create_token
  user.save!
end

puts 'Seeding complete.'

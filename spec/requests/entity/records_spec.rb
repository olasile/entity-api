require "rails_helper"

describe 'EntityFields' do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:entity) { create(:entity) }
  let(:entity_field) { create(:entity_field, entity_fieldable: entity) }

  describe 'create' do
    let(:entity) { create(:entity) }

    it 'creates an entity field successfully' do

      post entity_fields_path, params: {
        entity_field: {
          label: "Test Entity Field",
          entity_fieldable_id: entity.id,
          entity_fieldable_type: entity.class.name,
        }
      }, headers: auth_headers, as: :json

      expect(response).to have_http_status(:created)
    end
  end

  describe 'index' do
    let!(:entity_fields) { create_list(:entity_field, 2, entity_fieldable: entity) }

    it 'lists entity_fields successfully' do

      get entity_fields_path, headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['entity_fields'].map { |hash| hash['id'] }).to eq(entity_fields.map(&:id))
    end
  end

  describe 'show' do
    it 'shows an entity field' do

      get entity_field_path(entity_field.id), headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"id"=>1, "label"=>"Field 1"})
    end
  end

  describe 'update' do
    it 'updates an entity field' do

      put entity_field_path(entity_field.id), params: { entity_field: { label: "Field 1 Updated" } }, headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"id"=>1, "label"=>"Field 1 Updated"})
    end
  end

  describe 'destroy' do
    it 'deletes an entity field' do
      delete entity_field_path(entity_field.id), headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"message"=>"Entity Field deleted successfully"})
    end
  end
end
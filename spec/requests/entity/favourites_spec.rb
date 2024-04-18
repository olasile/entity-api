require "rails_helper"

describe 'Entities' do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }

  describe 'create' do
    let(:entity) { create(:entity) }

    it 'creates an entity successfully' do

      post entities_path, params: {
        entity: {
          name: "Test Entity"
        }
      }, headers: auth_headers, as: :json

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response["id"]).not_to be_nil
      expect(json_response["name"]).to eq("Test Entity")
    end

    it 'fails to create an entity successfully' do

      post entities_path, params: {
        entity: {
          name: ""
        }
      }, headers: auth_headers, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'index' do
    let!(:entities) { create_list(:entity, 2) }

    it 'lists entities successfully' do

      get entities_path, headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['entities'].map { |hash| hash['id'] }).to eq(entities.map(&:id))
    end
  end

  describe 'show' do
    let(:entity) { create(:entity) }

    it 'shows an entity' do

      get entity_path(entity.id), headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"id"=>1, "name"=>"Test Entity"})
    end
  end

  describe 'update' do
    let(:entity) { create(:entity) }

    it 'updates an entity' do

      put entity_path(entity.id), params: { entity: { name: "Test Entity Updated" } }, headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"id"=>1, "name"=>"Test Entity Updated"})
    end
  end

  describe 'destroy' do
    let(:entity) { create(:entity) }

    it 'deletes an entity' do
      delete entity_path(entity.id), headers: auth_headers, as: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"message"=>"Entity deleted successfully"})
    end
  end
end
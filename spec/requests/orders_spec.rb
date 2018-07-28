require 'rails_helper'

RSpec.describe OrdersController, type: :request do
  let(:body) do
    {
      email: 'kamp@rails.com',
      total: 64,
      status: 'pending'
    }
  end

  let(:fields) { %w(id email total status updated_at created_at) }

  def json
    JSON.parse(response.body)
  end

  def post_request
    post('/orders', params: body)
  end

  it 'should create order' do
    expect do
      post_request
    end.to change { Order.count }.by(1)
  end

  context 'return should' do
    before do
      post_request
    end

    it '200' do
      expect(response).to have_http_status(200)
    end

    it 'email' do
      expect(json['email']).to eq body[:email]
    end

    it 'status' do
      expect(json['status']).to eq body[:status]
    end

    it 'total' do
      expect(json['total'].to_f).to eq body[:total]
    end

    it 'fields' do
      expect(json.keys).to match_array(fields)
    end
  end
end

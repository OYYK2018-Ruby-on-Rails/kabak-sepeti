require 'rails_helper'

RSpec.describe OrdersController, type: :request do
  let(:body) do
    {
      email: 'kamp@rails.com',
      total: 64.0,
      status: :pending
    }
  end

  def post_request
    post('/orders', params: body)
  end

  it 'return should 200' do
    post_request
    expect(response).to have_http_status(200)
  end

  it 'should create order' do
    expect do
      post_request
    end.to change { Order.count }.by(1)
  end

  it 'return should email' do
    post_request
    expect(JSON.parse(response.body)['email']).to eq body[:email]
  end
end

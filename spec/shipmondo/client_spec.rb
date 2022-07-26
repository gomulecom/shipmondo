require 'securerandom'

describe Shipmondo::Client do
  let(:api_user) { SecureRandom.uuid }
  let(:api_key) { SecureRandom.uuid }

  it 'uses basic authentication' do
    user, key = SecureRandom.uuid, SecureRandom.uuid
    request = stub_request(:get, 'https://app.shipmondo.com/api/public/v3/')
      .with(headers: { 'Authorization' => "Basic #{Base64.strict_encode64("#{api_user}:#{api_key}")}" })

    http = Shipmondo::Client.new(api_user:, api_key:).http
    http.get

    assert_requested(request)
  end

  it 'returns service point client' do
    client = Shipmondo::Client.new(api_user:, api_key:)

    expect(client.service_points).to be_instance_of Shipmondo::ServicePoints::Client
  end

  it 'returns sales orders client' do
    client = Shipmondo::Client.new(api_user:, api_key:)

    expect(client.sales_orders).to be_instance_of Shipmondo::SalesOrders::Client
  end
end

require 'securerandom'

describe Shipmondo::ServicePoints::Client do
  subject { Shipmondo::Client.new(api_user: SecureRandom.uuid, api_key: SecureRandom.uuid).service_points }

  describe :pickup_points do
    let(:carrier_code) { 'gls' }
    let(:address) { 'Rosenkrantzgade 23, 4.' }
    let(:city) { 'Aarhus C' }
    let(:zipcode) { '8000' }
    let(:country_code) { 'DK' }
    let(:quantity) { 5 }

    before do
      stub_request(:get, 'https://app.shipmondo.com/api/public/v3/pickup_points')
        .with(query: { carrier_code:, address:, city:, zipcode:, country_code:, quantity: })
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate([
                     { id: '95558', name: 'Påskeløkkens Købmand', address: 'Paaskeløkkevej 11', zip_code: '5000', city: 'Odense C', country: 'DK' }
                   ]))
    end

    it 'can list pickup points neares the given address' do
      pickup_points = subject.pickup_points(carrier_code:, address:, city:, zipcode:, country_code:, quantity:)

      expect(pickup_points).to all(be_instance_of(Shipmondo::ServicePoints::ServicePoint))
    end
  end
end

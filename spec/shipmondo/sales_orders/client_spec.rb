require 'securerandom'

describe Shipmondo::SalesOrders::Client do
  subject { Shipmondo::Client.new(api_user: SecureRandom.uuid, api_key: SecureRandom.uuid).sales_orders }

  describe :find do
    let(:id) { 11227 }
    let(:order_id) { "27000" }

    before do
      stub_request(:get, "https://app.shipmondo.com/api/public/v3/sales_orders/#{id}")
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate({ id:, order_id: }))
    end

    it 'can find by id' do
      sales_order = subject.find(id)

      expect(sales_order).to be_instance_of Shipmondo::SalesOrders::SalesOrder
    end
  end

  describe :create do
    before do
      @create_request = stub_request(:post, 'https://app.shipmondo.com/api/public/v3/sales_orders')
        .with(body: File.read('spec/fixtures/create_sales_order.json').strip)
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate({ id: }))
    end

    let(:id) { 11227 }
    let(:sales_order) do
      Shipmondo::SalesOrders::SalesOrder.new(
        order_id: '27000',
        ship_to: Shipmondo::SalesOrders::ShipTo.new(name: 'Lene Hansen', address1: 'Skibhusvej 52', zipcode: '5000', city: 'Odense C', country_code: 'DK', email: 'lene@email.dk', mobile: '12345678', telephone: '12345678', instruction: 'Place on the front porch.'),
        bill_to: Shipmondo::SalesOrders::BillTo.new(name: 'Lene Hansen', address1: 'Skibhusvej 52', zipcode: '5000', city: 'Odense C', country_code: 'DK', email: 'lene@email.dk', mobile: '12345678', telephone: '12345678'),
        payment_details: Shipmondo::SalesOrders::PaymentDetails.new(amount_excluding_vat: '1600.0', amount_including_vat: '2000.0', authorized_amount: '2000.0', currency_code: 'DKK', vat_amount: '400.0', vat_percent: '0.25', payment_method: 'quickpay', transaction_id: '123456789', payment_gateway_id: '4012'),
        service_point: Shipmondo::ServicePoints::ServicePoint.new(id: '95558', name: 'Påskeløkkens Købmand', address1: 'Paaskeløkkevej 11', zipcode: '5000', city: 'Odense C', country_code: 'DK'),
        order_lines: [Shipmondo::SalesOrders::OrderLine.new(line_type: 'item', item_name: 'T-Shirt', item_sku: 'TS001-WH', item_variant_code: 'White', quantity: 2, unit_price_excluding_vat: '800.0', discount_amount_excluding_vat: '0.0', vat_percent: '0.25', currency_code: 'DKK', unit_weight: 2000, item_barcode: '12345678', item_bin: 'AB-001', image_url: 'http://example.com/image', cost_price: '50.0', country_code_of_origin: 'DK', customs_commodity_code: '123456', customs_description: 'Example contents')]
      )
    end

    it 'can create the order' do
      subject.create(sales_order)

      expect(@create_request).to have_been_made
    end

    it 'returns a instance of the sales order' do
      expect(subject.create(sales_order)).to be_instance_of Shipmondo::SalesOrders::SalesOrder
    end

    it 'returns a new instance of the sales order' do
      expect(subject.create(sales_order)).to_not eq sales_order
    end

    it 'merges the returned data with the given data' do
      expect(subject.create(sales_order).id).to eq 11227
    end

    it 'keeps the given data' do
      expect(subject.create(sales_order).order_id).to eq '27000'
    end

    describe :update_note do
      let(:id) { 11227 }
      let(:note) { 'Updated Note' }

      before do
        stub_request(:put, "https://app.shipmondo.com/api/public/v3/sales_orders/#{id}/order_note")
          .with(body: { order_note: note })
          .to_return(headers: { content_type: 'application/json' }, body: JSON.generate({ order_note: note }))
      end

      it 'updates sales order note' do
        expect(subject.update_note(id, note)['order_note']).to eq 'Updated Note'
      end
    end

    describe :search do
      let(:order_id) { '27000' }

      before do
        stub_request(:get, "https://app.shipmondo.com/api/public/v3/sales_orders?order_id=#{order_id}")
          .with(body: {})
          .to_return(headers: { content_type: 'application/json' },
                     body: File.read('spec/fixtures/search_sales_order.json').strip)
      end

      it 'searches for sales orders' do
        expect(subject.search(order_id).first).to be_instance_of Shipmondo::SalesOrders::SalesOrder
      end
    end
  end
end

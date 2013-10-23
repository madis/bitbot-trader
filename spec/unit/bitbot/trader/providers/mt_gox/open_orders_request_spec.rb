require "spec_helper"

describe Providers::MtGox::OpenOrdersRequest do
  describe "#call" do
    subject { request.call }

    let(:request)  { described_class.new(client) }
    let(:client)   { HttpRequestMock.new }

    let(:raw_open_orders) { {"data" => [raw_open_order]} }
    let(:raw_open_order)  { double("raw open order") }

    before do
      client.stub(:post).with("money/orders").and_return(raw_open_orders)
    end

    it "parses open orders" do
      Providers::MtGox::OpenOrderParser.should_receive(:new).
        with(raw_open_order).
        and_return(double(parse: "result"))
      expect(subject).to eq(["result"])
    end
  end
end
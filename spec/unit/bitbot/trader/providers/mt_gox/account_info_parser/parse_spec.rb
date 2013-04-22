require "spec_helper"

describe Providers::MtGox::AccountInfoParser, "#parse" do
  subject(:account) { described_class.new(data).parse }

  let(:data) {
    {
      "Wallets" => {
        "BTC" => {
          "Balance" => {"value_int" => "99470000", "currency" => "BTC"}
        },
        "EUR" => {
          "Balance" => {"value_int" => "12314", "currency" => "EUR"},
        },
        "USD" => {
          "Balance" => {"value_int" => "353302728", "currency" => "USD"},
        },
      },
      "Trade_Fee" => 0.53
    }
  }

  it { should be_a(Account) }
  its(:fee) { should eq(0.53) }

  context "btc wallet" do
    subject { account.wallet("BTC") }
    its(:balance) { should eq(0.9947) }
  end

  context "eur wallet" do
    subject { account.wallet("EUR") }
    its(:balance) { should eq(0.12314) }
  end

  context "usd wallet" do
    subject { account.wallet("USD") }
    its(:balance) { should eq(3533.02728) }
  end
end

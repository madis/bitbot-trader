require "spec_helper"

describe Utils::NonceGenerator do
  describe ".generate" do
    context "with default time_class" do
      subject { described_class.generate }

      it { should be_a(Fixnum) }
    end

    context "with custom time_class" do
      subject { described_class.generate(time_class) }

      let(:time_class) { double(now: Time.utc(2013, 2, 3, 22, 12, 23)) }

      it { should eql(1359929543) }
    end
  end
end

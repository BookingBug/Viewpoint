require "spec_helper"

describe Viewpoint::EWSClient do
  describe "#initalize" do
    context "without authorization_token" do
      it "sets username/password auth" do
        allow_any_instance_of(Viewpoint::EWS::Connection).to receive(:set_auth).with("test_username", "test_password")
        described_class.new "http://www.example.com", "test_username", "test_password"
      end
    end

    context "with authorization_token" do
      it "sets token auth" do
        allow_any_instance_of(Viewpoint::EWS::Connection).to receive(:authorization_token).with("test_authorization_token")
        described_class.new "http://www.example.com", nil, nil, authorization_token: "test_authorization_token"
      end
    end
  end

  describe "#set_auto_deepen" do
    let(:client) { described_class.new "http://www.example.com", "test", "test" }

    it "sets autodeepen to true on the web service" do
      ews = double "ews"
      expect(ews).to receive(:auto_deepen=).with(true) {true}
      expect(client).to receive(:ews) {ews}
      client.set_auto_deepen true
    end

    it "sets autodeepen to false on the web service with a behavior of 'raise'" do
      ews = double "ews"
      expect(ews).to receive(:no_auto_deepen_behavior=).with(:raise) {:raise}
      expect(ews).to receive(:auto_deepen=).with(false) {false}
      expect(client).to receive(:ews).twice {ews}
      client.set_auto_deepen false
    end

  end

end

require 'spec_helper'

describe ApiConstraints do
  let(:v1) {ApiConstraints.new(version: 1)}
  let(:v2) {ApiConstraints.new(version: 2, default:true)}

  describe "matches?" do
    it "should return v1 if v1 is specified in header" do
      request = double(host: "localhost:3000", headers: {"Accept" => "v1"})
      expect(v1.matches?(request)).to be true
    end

    it "should return v2 if no version is specified in header" do
      request = double(host: "localhost:3000")
      expect(v2.matches?(request)).to be true
    end
  end
end

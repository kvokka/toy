# frozen_string_literal: true

RSpec.describe "Toy::Robot" do
  subject { Toy::Robot.new(cmd) }
  after(:each) { subject.call }

  context "correct command sequence 1" do
    let(:cmd) { "MOVE PLACE 0,0,NORTH MOVE REPORT" }
    it("should run commands") { expect(STDOUT).to receive(:puts).with("0,1,NORTH") }
  end

  context "correct command sequence 2" do
    let(:cmd) { "PLACE 0,0,NORTH MOVE RIGHT MOVE REPORT" }
    it("should run commands") { expect(STDOUT).to receive(:puts).with("1,1,EAST") }
  end

  context "correct command sequence 3" do
    let(:cmd) { "RIGHT PLACE 3,3,SOUTH MOVE MOVE MOVE MOVE RIGHT MOVE REPORT" }
    it("should run commands") { expect(STDOUT).to receive(:puts).with("2,0,WEST") }
  end

  context "correct command sequence 3" do
    let(:cmd) { "RIGHT PLACE 0,5,SOUTH MOVE MOVE MOVE MOVE MOVE MOVE RIGHT MOVE REPORT" }
    it("should run commands") { expect(STDOUT).to receive(:puts).with("0,0,WEST") }
  end

  context "correct command sequence with bad initial coordinates" do
    let(:cmd) { "PLACE 3,7,EAST MOVE REPORT" }
    it("should run commands") { expect(STDOUT).to_not receive(:puts) }
  end
end

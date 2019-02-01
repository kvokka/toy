# frozen_string_literal: true

RSpec.describe "Toy::Parser" do
  subject { Toy::Parser.new(cmd) }

  context "correct command sequence 1" do
    let(:cmd) { "PLACE 0,0,NORTH MOVE REPORT" }

    it "should parse" do
      expect(subject.call.map { |c| c.class.command }).to eq %w[PLACE MOVE REPORT]
    end
  end

  context "correct command sequence 2" do
    let(:cmd) { "PLACE 0,0,NORTH LEFT REPORT" }

    it "should parse" do
      expect(subject.call.map { |c| c.class.command }).to eq %w[PLACE LEFT REPORT]
    end
  end

  context "correct command sequence 3" do
    let(:cmd) { "PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT" }

    it "should parse" do
      expect(subject.call.map { |c| c.class.command }).to eq %w[PLACE MOVE MOVE LEFT MOVE REPORT]
    end
  end

  context "incorrect command arguments 1" do
    let(:cmd) { "PLACE 1 REPORT" }

    it "should parse" do
      expect { subject.call }.to raise_error Toy::Command::InvalidArguments
    end
  end


  context "incorrect command arguments 2" do
    let(:cmd) { "PLACE 1,3,FOO REPORT" }

    it "should parse" do
      expect { subject.call }.to raise_error Toy::Command::InvalidArguments
    end
  end

  context "incorrect command 1" do
    let(:cmd) { "PLACE 1,4,EAST BAR" }

    it "should parse" do
      expect { subject.call }.to raise_error Toy::NotImplemented
    end
  end
end

# frozen_string_literal: true

RSpec.describe Toy::Commands::Place do
  it "to be invalid with out arguments" do
    expect { subject.parse_arguments! }.to raise_error Toy::Command::InvalidArguments
  end

  it "to be valid with arguments" do
    expect(subject.class.new("2,3,SOUTH").parse_arguments!).to be true
  end
end

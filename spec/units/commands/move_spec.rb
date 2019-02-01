# frozen_string_literal: true

RSpec.describe Toy::Commands::Move do
  it "to be valid with out arguments" do
    expect(subject.parse_arguments!).to be true
  end
end

# frozen_string_literal: true

RSpec.describe Toy::Command do
  it "the registry have to be a Hash" do
    expect(subject.class.commands_arity).to be_a Hash
  end

  it "the commands_arity have to include actual commands" do
    expect(subject.class.commands_arity).to include "MOVE"
  end

  it "the registry have to include actual commands" do
    expect(subject.class.registry.map(&:name)).to include "Toy::Commands::Move"
  end
end

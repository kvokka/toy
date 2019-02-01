# frozen_string_literal: true

RSpec.describe Toy::Command do
  it "the registry have to be a Hash" do
    expect(subject.class.registry).to be_a Hash
  end

  %w[LEFT RIGHT MOVE REPORT].each do |command|
    it "the registry have to include '#{command}' command" do
      expect(subject.class.registry).to include command
    end

    it "the registry command '#{command}' do not accept arguments" do
      expect(subject.class.registry[command].arity).to be 0
    end
  end

  it "the registry have to include PLACE command" do
    expect(subject.class.registry).to include "PLACE"
  end

  it "the registry command 'PLACE' accept arguments" do
    expect(subject.class.registry["PLACE"].arity).to be 3
  end

  it "the commands_list have to include actual commands" do
    expect(subject.class.commands_list.map(&:name)).to include "Toy::Commands::Move"
  end
end

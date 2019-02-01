# frozen_string_literal: true

RSpec.describe Toy do
  it "has a version number" do
    expect(Toy::VERSION).not_to be nil
  end
end

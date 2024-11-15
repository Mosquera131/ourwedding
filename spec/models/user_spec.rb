require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "Test User", email: "test@example.com")
    expect(user).to be_valid
  end
  it "no es válido sin un nombre" do
    user = User.new(email: "test@example.com")
    expect(user).not_to be_valid
  end
  it "no es válido sin un email" do
    user = User.new(name: "Test User")
    expect(user).not_to be_valid
  end
  it "no es válido con un email inválido" do
    user = User.new(name: "Test User", email: "invalid_email")
    expect(user).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe Event, type: :model do
  it "es válido con un nombre, fecha, descripción y usuario asociado" do
        user = User.create!(name: "Test User", email: "test@example.com")
        event = Event.new(name: "Evento de prueba", date: Date.tomorrow, description: "Breve descripción", user: user)
        expect(event).to be_valid
  end
  it "no es válido sin un nombre" do
    user = User.create!(name: "Test User", email: "test@example.com")
    event = Event.new(date: Date.tomorrow, description: "Breve descripción", user: user)
    expect(event).not_to be_valid
  end
end

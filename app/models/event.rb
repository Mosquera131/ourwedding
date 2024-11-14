class Event < ApplicationRecord
    enum status:{active:"active", completed:"completed", cancelled:"cancelled"}
    has_many :event_users
    has_many :users, through: :event_users

    #validaciones

    validates :name, presence: true,
                    length: { in: 3..100 },
                    format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and spaces" }
    validates :date, presence: true
    validates :description, presence: true, length: { maximum: 50 } 
    validate :date_is_not_past, on: :create # Ensure that the event date is not in the past/ just in the creation

   # Scope
   scope :add_in_yesterday, -> { where("created_at>=?", 1.day.ago) }
   scope :event_that_are_active, -> { where("status>=?", Event.statuses[:active]) }

   #callbacks
   before_create :log_status_change


   private
  
  def log_status_change
        if status_changed?
        puts "El estado del evento ha cambiado a #{status}"
        end
  end


   def date_is_not_past #checking that the date for the event is not in the past like yesterday
        if date.present? && date < Date.today  # If the date is not in the future
            errors.add(:date, "cannot be in the past")  # Add an error if the event date is in the past
        end
    end
end

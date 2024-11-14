class User < ApplicationRecord
    enum rol:{engaged: engaged, guest:guest, organizer:organizer}
    has_many :event_users
    has_many :events, through: :event_users

end

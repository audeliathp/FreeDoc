class Specialty < ApplicationRecord
  has_many :attributions
  has_many :doctors, through: :attributions
end

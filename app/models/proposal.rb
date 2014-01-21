class Proposal < ActiveRecord::Base
  validates_presence_of :title, :email, :name, :description, :bio, :recidence, :motivation
end

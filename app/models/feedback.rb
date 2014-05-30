class Feedback < ActiveRecord::Base
  validates_presence_of :content, :user, :proposal

  belongs_to :user
  belongs_to :proposal
end

class ProposalScore < ActiveRecord::Base
  MAX_SCORE_PER_USER = 17

  belongs_to :user
  belongs_to :proposal
end

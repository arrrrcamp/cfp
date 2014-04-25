class ProposalScore < ActiveRecord::Base
  MAX_SCORE_PER_USER = 13

  belongs_to :user
  belongs_to :proposal
end

class Crew::ProposalsController < CrewController
  def index
    @proposals = Proposal.order(:created_at)
  end

  def show
    @proposal = Proposal.find params[:id]
  end
end

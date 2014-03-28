class Crew::ProposalsController < CrewController
  def index
    @proposals = Proposal.includes(:comments, :proposal_scores).order('proposal_scores.read', :created_at)
  end

  def show
    @proposal = Proposal.find params[:id]
  end

  def mark_as_read
    @proposal = Proposal.find(params[:id])
    current_user.proposal_scores.create! read: true, proposal: @proposal
    redirect_to [:crew, @proposal]
  end

  def mark_as_favorite
    @proposal = Proposal.find(params[:id])
    @score = current_user.proposal_scores.find_or_initialize_by_proposal_id(@proposal.id)
    @score.attributes = {read: true, favorite: true}
    @score.save!
    redirect_to [:crew, @proposal]
  end

  def unfavorite
    @proposal = Proposal.find(params[:id])
    @score = current_user.proposal_scores.find_by_proposal_id(@proposal.id)
    @score.attributes = {read: true, favorite: false}
    @score.save!
    redirect_to [:crew, @proposal]
  end
end

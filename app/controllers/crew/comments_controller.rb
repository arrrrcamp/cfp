class Crew::CommentsController < CrewController
  def create
    @proposal = Proposal.find params[:proposal_id]
    if current_user.comments.create body: params[:comment][:body], proposal: @proposal
      redirect_to [:crew, @proposal], notice: 'Saved comment'
    else
      redirect_to [:crew, :proposal], error: 'Oops, comment not saved'
    end
  end
end

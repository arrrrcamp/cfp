class Crew::FeedbacksController < CrewController
  def create
    @proposal = Proposal.find params[:proposal_id]
    if current_user.feedbacks.create content: params[:feedback][:content], proposal: @proposal
      redirect_to [:crew, @proposal], notice: 'Saved feedback'
    else
      redirect_to [:crew, :proposal], error: 'Oops, feedback not saved'
    end
  end
end

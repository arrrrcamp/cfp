class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new proposal_params
    if @proposal.save
      redirect_to :root, notice: 'Arrrr ye matey. Your captain thanks ye!'
    else
      flash.now[:error] = 'Uh Ow, please fill in everything that we need'
      render :new
    end
  end

private
  def proposal_params
    params.require(:proposal).permit(
      :name,
      :email,
      :title,
      :description,
      :tags,
      :bio,
      :github,
      :twitter,
      :recidence,
      :motivation,
    )
  end
end

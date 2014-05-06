class ProposalNotifier < ActionMailer::Base
  default from: "captian@arrrrcamp.be"

  def notify_speaker proposal
    @proposal = proposal.unscramble

    mail  to: "#{@proposal.name.force_encoding('UTF-8')} <#{@proposal.email}>",
          subject: 'ArrrrCamp 2014 proposal received'
  end

  def notify_captain proposal
    @proposal = proposal

    mail  to: 'captain@arrrrcamp.be',
          from: 'cfp@arrrrcamp.be',
          subject: "Nieuw proposal ontvangen - #{@proposal.title}"
  end
end

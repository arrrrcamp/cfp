require 'digest/sha1'

class Proposal < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :title, :email, :name, :description, :bio, :recidence, :motivation

  before_create :generate_uniq_identifier
  before_save :scramble

  after_create :notify_everybody

  def unscramble
    %w(name email bio github twitter recidence).each do |attr|
      self.send "#{attr}=", Base64::decode64(self.send(attr).to_s)
    end
    self
  end

private
  def scramble
    %w(name email bio github twitter recidence).each do |attr|
      self.send "#{attr}=", Base64::encode64(self.send(attr).to_s)
    end
  end

  def generate_uniq_identifier
    self.identifier = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join ).first(20)
  end

  def notify_everybody
    ProposalNotifier.notify_speaker(self).deliver
    ProposalNotifier.notify_captain(self).deliver
  end
end

class Proposal < ActiveRecord::Base
  validates_presence_of :title, :email, :name, :description, :bio, :recidence, :motivation

  before_save :scramble

private
  def scramble
    %w(name email bio github twitter recidence).each do |attr|
      self.send "#{attr}=", Base64::encode64(self.send(attr).to_s)
    end
  end
end

class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  has_many :comments
  has_many :proposal_scores
  has_many :proposals, through: :proposal_scores

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def favorite_proposals
    proposals.where("proposal_scores.favorite = true")
  end

  def read_proposals
    proposals.where("proposal_scores.read = true")
  end

  def unread_proposals_count
    Proposal.count - read_proposals.count
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

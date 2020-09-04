class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :account
  # validates_uniqueness_of :user_id, :scope => :account_id

  has_many :memberships_roles, :class_name => "MembershipsRole", :dependent => :delete_all
  has_many :roles, :through => :memberships_roles

  def generate_api_key!
    self.update_attribute(:api_key, secure_digest(Time.now, (1..10).map{ rand.to_s }))
  end

  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end
end

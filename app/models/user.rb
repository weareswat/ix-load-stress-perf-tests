class User < ApplicationRecord
  attr_accessor :password

  # before_save   :encrypt_password # ,:check_administrator
  # before_create :create_membership

  # acts_as_authorized_user
  # acts_as_authorizable

  belongs_to :account

  has_many :memberships
  has_many :accounts, :through => :memberships
  has_many :comments
  has_many :activities, :class_name => "Activity", :foreign_key => "actor_id", :dependent => :destroy
  # has_many :notifications, :class_name => "Notify::Notification", :order => "created_at desc"

 #  has_one :current_membership, :class_name => "Membership", :foreign_key => "user_id", :conditions => 'account_id = #{self.current_account.id}'
  has_one :last_presented_feature
  has_one :accepted_terms, :class_name => "UserAcceptedTerms", :foreign_key => "user_id"
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :name_is, lambda {|name|where("name like ?", "%#{name}%")}
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable
  validates :name, :email, presence: true
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :messages
end

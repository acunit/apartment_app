class User < ApplicationRecord
  rolify

  after_create :assign_role

  def assign_role
    add_role(:user)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many(:apartments)

  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" }, default_url: "http://placehold.it/150x175"

  validates_attachment :avatar,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }

end

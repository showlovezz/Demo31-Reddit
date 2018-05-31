class Link < ApplicationRecord

  validates :title, :url, presence: true

  belongs_to :user

  acts_as_votable

end

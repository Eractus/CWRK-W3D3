# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, presence: true, uniqueness: true

  # class method, helper method
  def self.random_code
    random_url = SecureRandom.urlsafe_base64
    while self.exists?(short_url: random_url)
      random_url = SecureRandom.urlsafe_base64
    end
    random_url
  end

  # factory method
  def self.generate_shortened_url(l_url, user)
    random_s_url = ShortenedUrl.random_code
    create!(long_url: l_url, short_url: random_s_url, user_id: user.id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: User

end

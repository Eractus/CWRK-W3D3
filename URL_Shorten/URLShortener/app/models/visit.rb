# == Schema Information
#
# Table name: visits
#
#  id             :integer          not null, primary key
#  visitor_id     :integer          not null
#  visited_url_id :integer          not null
#

class Visit < ApplicationRecord
  validates :visitor_id, :visited_url_id, presence: true

  # factory method
  def self.record_visit!(user, shortened_url)
    create!(visitor_id: user.id, visited_url_id: shortened_url.id)
  end

  belongs_to :visitors,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User

  belongs_to :visited_urls,
    primary_key: :id,
    foreign_key: :visited_url_id,
    class_name: :ShortenedUrl

end

class AddTimestampToShortenedUrlAndVisit < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :shortened_urls, null: true
    add_timestamps :visits, null: true
  end
end

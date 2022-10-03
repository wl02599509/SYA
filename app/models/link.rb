class Link < ActiveRecord::Base
  require 'securerandom'

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..255, on: :create, message: "too long"
  validates_length_of :slug, within: 3..255, on: :create, message: "too long"

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end

  def self.random_charts
    SecureRandom.uuid[3..10]
  end

  def self.same_slug?(slug)
    where("slug = ?", slug).present?
  end

  def self.shorten(url, slug = random_charts)
    if Link.same_slug?(slug)
      render :new
    else
      @link = Link.new(url: url, slug: slug)
      @link.save
      shortened_url = @link.short
      @link.update_attribute(:shortened_url, shortened_url)
    end
  end
end

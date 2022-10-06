class Link < ActiveRecord::Base
  before_validation :random_charts
  after_validation :shorten_url

  belongs_to :user

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..255, on: :create, message: "too long"
  validates_length_of :slug, within: 3..255, on: :create, message: "too long"

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end

  def random_charts
    if slug == nil || ""
      self.slug = SecureRandom.uuid[3..7]
    end
  end

  def self.shorten(url, slug)
      @link = Link.create(url: url, slug: slug)
  end

  def shorten_url
    shortened_url = short
    self.update_attribute(:shortened_url, shortened_url)
  end
end

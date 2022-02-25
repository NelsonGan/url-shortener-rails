class Shortener
  attr_reader :url, :link_model

  # Accept link model for Dependency Injection
  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def slug
    # Make sure slug generated is always unique
    loop do
      slug = SecureRandom.uuid[0..4]
      break slug unless link_model.exists?(slug: slug)
    end
  end

  def create_link
    link_model.create(
      target_url: url,
      slug: slug
    )
  end
end
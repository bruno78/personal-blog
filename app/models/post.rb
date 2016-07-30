class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.search(search)
    return scoped unless search.present?
    where("title LIKE ?", "%#{search}%")
    where("blurb LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end

end

class Post < ActiveRecord::Base
  extend FriendlyId
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  mount_uploader :image, ImageUploader
  friendly_id :title, use: :slugged

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
end

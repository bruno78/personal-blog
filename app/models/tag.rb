class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("tags.name, taggings.tag_id")
    # self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id") sqlite
  end

end

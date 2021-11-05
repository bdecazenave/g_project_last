class Gossip < ApplicationRecord

  belongs_to :user
  has_many :join_table_gossip_tags
  has_many :comments
  has_many :tags, through: :join_table_gossip_tags
  validates :title, presence: true, length: { in:3..14}
  validates :content, presence: true 

  def find_author_name
    author_id = self.user_id.to_i
    author_array = []
    author_array << User.find_by(id: author_id)
    author_name = author_array[0].first_name
    return author_name
  end

  def find_all_comments
    
  end

end
 
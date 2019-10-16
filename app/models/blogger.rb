class Blogger < ApplicationRecord
 has_many :posts
 has_many :destinations, through: :posts

 validates :name, uniqueness: true
 validates :bio, length:{minimum:30}


 def total_likes
self.posts.map{|post|post.likes}.sum

 end

def featured_post
  self.posts.max_by{|post| post.likes}
end

def destinations

   self.destinations.max_by do |destination|
    @blogger.destinations.count(destination)
   end
 end

end

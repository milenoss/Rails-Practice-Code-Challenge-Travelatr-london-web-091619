class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts


def latest_post
 self.posts.last(5)
end

def featured_post

self.posts.max_by{|post|post.likes}

end

def uniq_bloggers 
    self.bloggers.uniq
end

def average_age_of_bloggers
   age = uniq_bloggers.map{|blogger|blogger.age}
   age.sum/ages.length

end
end

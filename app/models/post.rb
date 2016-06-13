class Post < ActiveRecord::Base

  belongs_to :user
  
  has_many :comments
  
  has_many :post_category_relationships
  has_many :categories, :through => :post_category_relationships



  validates_presence_of :title

end
 
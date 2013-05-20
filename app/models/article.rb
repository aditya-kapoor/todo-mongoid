class Article
  include Mongoid::Document
  field :name, :type => String
  field :content, :type => String
  field :published_on, :type => Date
  key :name

  validates :content, :name, :presence => true
  embeds_many :comments
end

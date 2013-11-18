class Topic < ActiveRecord::Base
  has_many :stories
  has_many :users, through: :stories

  def self.getByTitle(title)
    topic = Topic.find_by(title: title)
    if topic.nil?
      topic = Topic.new(title: title)
      if topic.save
        return topic
      else
        return nil
      end
    end
    topic
  end
end

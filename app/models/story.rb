class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :user, presence: true
  validates :topic, presence: true

  before_validation :checkTopic

  def checkTopic
    if self.topic.nil?
      self.topic = Topic.getByTitle(self.topic_name)
    end
  end

  def topic_title
    if self.topic
      self.topic.title
    else
      ''
    end
    #if param
      #self.topic = Topic.getByTitle(self.topic_name)
    #end
    #self.topic.title
  end

end

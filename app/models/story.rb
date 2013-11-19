class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :user, presence: true
  validates :topic, presence: true

  before_validation :checkTopic

  def checkTopic
    if self.topic.nil? and defined self.topic_name
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

  def self.latest( options = {} )
    opts = {
      user_id: nil,
      topic_id: nil,
      limit: 5,
      with_desc: true
    }.merge options

    stories = Story.includes(:topic, :user).order(:updated_at)

    if opts[:user_id].nil?
      stories = stories.where( public: true)
    else
      stories = stories.where( '(public = ? OR user_id = ?)', true, opts[:user_id])
    end

    unless opts[:topic_id].nil?
      stories = stories.where( topic_id: opts[:topic_id])
    end

    if opts[:with_desc]
      stories = stories.where( "desc != ''" )
    end

    unless opts[:limit].nil?
      stories = stories.limit(opts[:limit])
    end

    return stories

  end

end

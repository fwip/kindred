json.array!(@stories) do |story|
  json.extract! story, :user_id, :topic_id, :desc
  json.url story_url(story, format: :json)
end

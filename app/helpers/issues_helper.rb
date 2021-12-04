module IssuesHelper
  def key_to_emoji(key)
    if key == :"+1"
      "👍"
    elsif key == :"-1"
      "👎"
    elsif key == :"laugh"
      "😂"
    elsif key == :"hooray"
      "🎉"
    elsif key == :"confused"
      "😕"
    elsif key == :"heart"
      "❤️"
    elsif key == :"rocket"
      "🚀"
    elsif key == :"eyes"
      "👀"
    end
  end
end

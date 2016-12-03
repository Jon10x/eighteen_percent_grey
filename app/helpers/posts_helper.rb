# https://www.sitepoint.com/tagging-scratch-rails/
# https://www.devwalks.com/lets-build-instagram-with-rails-part-4-presenting-pretty-profiles/

module PostsHelper
  
  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end
  
 # def liked_post(post)
  #  return 'glyphicon-heart' if current_user.voted_for? post
   # 'glyphicon-heart-empty'
  # end
  
  def liked_post(post)
    if current_user.voted_for? post
      return link_to '', unlike_post_path(post), remote: true, id: "like_#{post.id}", 
          class: "glyphicon glyphicon-heart liked_post_heart"
    else
      link_to '', like_post_path(post), remote: true, id: "like_#{post.id}", 
          class: "glyphicon glyphicon-heart-empty" 
    end
  end

  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end
  
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / (max.count) * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end
 
private

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.user_name,
                                profile_path(voter.user_name),
                                class: 'user-name')
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
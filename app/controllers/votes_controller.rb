class VotesController < ApplicationController
    before_action :authenticate_user!

  def create
    if params["defined_word_id"]
      if params["commit"] == "Upvote"
        # if upvote doesnt exist
        if !Vote.where(user: current_user, voteable_type: "DefinedWord", voteable_id: params["defined_word_id"], upvote: true).exists?
          # create it
          Vote.create(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", value: 1, upvote: true)
          # delete the downvote on the word from that user if it exists
          if downvote = Vote.find_by(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", upvote: false)
            downvote.delete
          end
        end
      elsif params["commit"] == "Downvote"
        Vote.create(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", value: 1, upvote: false)
      end
    elsif params["comment_id"]

    end

    redirect_back(fallback_location: root_path)
  end
end

# if defined_word_vote
  # clicked upvote
    # if upvote exists, ignore
    # if upvote doesnt exist, create it, and delete the downvote from that user if it exists
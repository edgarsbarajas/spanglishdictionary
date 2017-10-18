class VotesController < ApplicationController
    before_action :authenticate_user!

  def create
    if params["defined_word_id"]
      if params["commit"] == "Upvote"
        p Vote.create(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", value: 1, upvote: true)
      elsif params["commit"] == "Downvote"
        p Vote.create(user: current_user, voteable_id: params["defined_word_id"], voteable_type: "DefinedWord", value: 1, upvote: false)
      end
    elsif params["comment_id"]

    end

    redirect_back(fallback_location: root_path)
  end
end
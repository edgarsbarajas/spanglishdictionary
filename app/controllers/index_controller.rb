class IndexController < ApplicationController
  def index
    @words = DefinedWord.all.limit(5)
  end
end

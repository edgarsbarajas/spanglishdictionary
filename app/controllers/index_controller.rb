class IndexController < ApplicationController
  def index
    @words = DefinedWord.all.reverse
  end
end

class DowncaseDefinedWords < ActiveRecord::Migration[5.1]
  def change
    DefinedWord.all.each { |df| df.update(word: df.word.downcase) }
  end
end

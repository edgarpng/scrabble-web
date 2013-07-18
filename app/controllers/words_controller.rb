class WordsController < ApplicationController
  def index
    @new_word = Word.new
    @previous_words = Word.all
    @last_word = @previous_words.last
  end

  def create
    @last_word = Word.new(params[:word])
    if @last_word.save!
      redirect_to words_path
    end
  end
end
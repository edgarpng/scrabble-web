class WordsController < ApplicationController
  def index
    @new_word = Word.new
    @previous_words = Word.all
    @last_word = @previous_words.last
  end

  def create
    @last_word = Word.new(params[:word])
    @last_word.save
    unless @last_word.valid?
      flash[:error] = "Sorry, please enter at least one word made up of only letters"
    end
    redirect_to words_path
  end

  def play
    @word = Word.find(params[:id])
    @word.plays << Play.new
    @word.save

    redirect_to words_path
  end
end
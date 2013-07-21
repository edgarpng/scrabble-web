class Word < ActiveRecord::Base

  before_save :downcase, :compute_score
  attr_accessible :word, :score
  has_many :plays
  validates :word,
    presence: true,
    format: /\A[a-zA-Z]+\z/

  def compute_score
    self.score = 0
    self.word.each_char do |char|
      self.score += letter_scores[char]
    end
  end

  private

  def word_params
    params.require(:word).permit(:word)
  end

  def letter_scores
    {"a"=>1, "b"=>3, "c"=>3, "d"=>2, "e"=>1, "f"=>4, "g"=>2, "h"=>4, "i"=>1, "j"=>8,
     "k"=>5, "l"=>1, "m"=>3, "n"=>1, "o"=>1, "p"=>3, "q"=>10, "r"=>1, "s"=>1, "t"=>1,
     "u"=>1, "v"=>4, "w"=>4, "x"=>8, "y"=>4, "z"=>10}
  end

  def downcase
    self.word = self.word.downcase
  end
end
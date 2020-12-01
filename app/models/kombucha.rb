class Kombucha < ApplicationRecord
  #Use this format if you want to apply several validations to several attributes
  #validates :flavor, :brew_time, :notes, presence: true, numericality: true
  #Use this format if you only want to apply one validation to several attributes
  validates_presence_of :brew_time
  validates_uniqueness_of :flavor
  validates :notes, :flavor, length: {maximum: 15, minimum: 5}, presence: true, two_words: true
  # validate :maximum_total_word_count
  #
  # def maximum_total_word_count
  #   if flavor.length + notes.length > 500
  #     errors.add(total_length: "You have too many words overall")
  #   end
  # end

end

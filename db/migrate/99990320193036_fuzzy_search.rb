class FuzzySearch < ActiveRecord::Migration
  def self.up
    #require 'enumerator' ?
    #convert all people into trigram data. use person firstname and lastname data.
    Specification.find(:all).each do |specification|
      # add a space at the beginning as this will emphasize the beginning of the word
      word = ' ' + specification.manufacturer
      (0..word.length-3).each do |idx|
        tg = word[idx,3]
        # we can score last names differently for search matches
        Trigram.create(:tg => tg, :specification_id => specification.id, :score => 2) unless Trigram.find_by_specification_id_and_tg(specification.id, tg)
      end
      word = ' ' + specification.model
      (0..word.length-3).each do |idx|
        tg = word[idx,3]
        Trigram.create(:tg => tg, :specification_id => specification.id, :score => 1) unless Trigram.find_by_specification_id_and_tg(specification.id, tg)
      end
    end
  end

  def self.down
    Trigram.delete_all
  end
end

module Search
  class Base
    include Comparable

    attr_reader :id, :score
    
    def initialize(attributes = {})
      @id = attributes[:id]
      @score = attributes[:score]
    end

    def belongs_to?(group)
      self.class.to_s.demodulize.downcase.pluralize == group.to_s
    end

    def <=>(other)
      score <=> other.score
    end    
  end
end

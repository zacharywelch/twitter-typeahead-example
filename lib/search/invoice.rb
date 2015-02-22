module Search
  class Invoice < Search::Base
    
    def self.from_json(json)
      new ({
        id: json[:number],
        score: json[:score].to_f
      })
    end
  end
end
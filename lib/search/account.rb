module Search
  class Account < Search::Base
    attr_reader :company_name, :contact_name, :contact_email
    
    def initialize(args = {})
      @company_name  = args[:company_name]
      @contact_name  = args[:contact_name]
      @contact_email = args[:contact_email]
      super args
    end
    
    def self.from_json(json)
      new ({
        id: json[:number],
        company_name: json[:companyname],
        contact_name: json[:contactname],
        contact_email: json[:contactemail],
        score: json[:score].to_f
      })
    end      
  end
end
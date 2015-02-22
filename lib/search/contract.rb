module Search
  class Contract < Search::Base
    attr_reader :amount, :company_name, :contact_name, :activated_at
    
    def initialize(args = {})
      @amount       = args[:amount]
      @company      = args[:company_name]
      @contact      = args[:contact_name]
      @activated_at = args[:activated_at]
      super args
    end
    
    def self.from_json(json)
      new ({
        id: json[:number],
        amount: json[:totalactualamount],
        company_name: json[:companyname],
        contact_name: json[:contactname],
        activated_at: json[:activatedt],
        score: json[:score].to_f
      })
    end
  end
end
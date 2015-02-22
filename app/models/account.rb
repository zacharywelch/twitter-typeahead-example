class Account
  attr_reader :id, :score, :company_name, :contact_name, :contact_email
  
  def initialize(args = {})
    @id = args[:id]
    @score = args[:score]
    @company_name  = args[:company_name]
    @contact_name  = args[:contact_name]
    @contact_email = args[:contact_email]
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

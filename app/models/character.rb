class Character < ActiveRecord::Base
  def self.search(query)
    query = "%#{query}%" unless query.nil?
    Character.where('name LIKE ?', query)
  end
end

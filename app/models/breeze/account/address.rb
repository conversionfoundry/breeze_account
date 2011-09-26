module Breeze
  module Account
    class Address
      include Mongoid::Document
     
      field :address_line_one
      field :address_line_two
      field :country
    end
  end
end


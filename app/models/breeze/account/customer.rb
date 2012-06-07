module Breeze
  module Account
    class Customer
      include Mongoid::Document

      field :title
      field :first_name
      field :last_name
      field :phone

      embeds_one :billing_address, :class_name => "Breeze::Account::Address"
      embeds_one :shipping_address, :class_name => "Breeze::Account::Address"

      field :marketing, :type => Boolean

      accepts_nested_attributes_for :billing_address
      accepts_nested_attributes_for :shipping_address

      # Include default devise modules. Others available are:
      # :token_authenticatable, :confirmable, :lockable and :timeoutable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable

      scope :marketing, where(:marketing => true)

      def name
        [ first_name, last_name ].reject { |c| c.blank? }.join(" ")
      end

    end
  end
end


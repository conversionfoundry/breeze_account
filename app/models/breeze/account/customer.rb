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

      validates_presence_of :first_name, :last_name, :email
      validates_presence_of :password, :password_confirmation, :if => :new_record?
      validates_confirmation_of :password

      include Breeze::Admin::Mixins::Login

      # Include default devise modules. Others available are:
      # :token_authenticatable, :confirmable, :lockable and :timeoutable
      # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable #, :validatable
             
       # ## Database authenticatable
       # field :email,              :type => String, :null => false
       # field :encrypted_password, :type => String, :null => false

       # ## Recoverable
       # field :reset_password_token,   :type => String
       # field :reset_password_sent_at, :type => Time

       # ## Rememberable
       # field :remember_created_at, :type => Time

       # ## Trackable
       # field :sign_in_count,      :type => Integer
       # field :current_sign_in_at, :type => Time
       # field :last_sign_in_at,    :type => Time
       # field :current_sign_in_ip, :type => String
       # field :last_sign_in_ip,    :type => String

       # ## Encryptable
       # # field :password_salt, :type => String

       # ## Confirmable
       # # field :confirmation_token,   :type => String
       # # field :confirmed_at,         :type => Time
       # # field :confirmation_sent_at, :type => Time
       # # field :unconfirmed_email,    :type => String # Only if using reconfirmable

       # ## Lockable
       # # field :failed_attempts, :type => Integer # Only if lock strategy is :failed_attempts
       # # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
       # # field :locked_at,       :type => Time

       # # Token authenticatable
       # # field :authentication_token, :type => String

       # ## Invitable
       # # field :invitation_token, :type => String
      

      scope :marketing, where(:marketing => true)

      def name
        [ first_name, last_name ].reject { |c| c.blank? }.join(" ")
      end

    end
  end
end


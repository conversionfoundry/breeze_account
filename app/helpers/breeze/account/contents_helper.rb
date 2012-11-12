module Breeze
  module Account
    module ContentsHelper
      def account_header
        if customer_signed_in?
          link = link_to "Sign out", destroy_store_customer_session_path 
          "Signed in as #{current_customer.email}. #{link}".html_safe
        else
          link = link_to "Sign up", new_customer_registration_path
          link << " "
          link << link_to("Sign in", new_customer_session_path)
          link.html_safe
        end        
      end
    end
  end
end

module Breeze
  module Account
    class Engine < ::Rails::Engine
      #include Breeze::Engine

      isolate_namespace Breeze::Account


      config.to_prepare do
        ApplicationController.helper Breeze::Account::ContentsHelper
      end

    end
  end
end


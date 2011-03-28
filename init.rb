Breeze.hook :admin_menu do |menu, user|
  menu << { :name => "Customers", :path => "/admin/customers" } if user.can? :manage, Breeze::Content::Item
end

Rails.application.config.to_prepare do
  Breeze::Controller.helper Breeze::Account::ContentsHelper
end

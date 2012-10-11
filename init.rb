require 'breeze'

Breeze.hook :admin_menu do |menu, user|
  menu << { :name => "Customers", :path => "/admin/account/customers" } if user.can? :manage, Breeze::Content::Item
end

Breeze.hook :component_info do |component_info|
	component_info << {:name => 'Breeze Account', :version => Breeze::Account::VERSION }
end

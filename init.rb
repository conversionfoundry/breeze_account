Breeze.hook :admin_menu do |menu, user|
  menu << { :name => "Customers", :path => "/admin/account/customers" } if user.can? :manage, Breeze::Content::Item
end

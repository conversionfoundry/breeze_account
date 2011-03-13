Rails.application.routes.draw do
  scope "admin/customers", :module => "breeze/account", :name_prefix => "admin_customers" do
    root :to => "customers#index"
  end
end

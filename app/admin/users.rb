ActiveAdmin.register User do
  permit_params :address
  menu priority: 2
end

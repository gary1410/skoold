ActiveAdmin.register Teacher, :namespace => :admin do
  menu :if => proc { false }
end

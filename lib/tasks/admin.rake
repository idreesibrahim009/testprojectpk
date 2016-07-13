namespace :users do
  desc "TODO"
  task create_admin: :environment do
  	User.create_new_user("admin")
  end

  desc "TODO"
  task create_user: :environment do
  	User.create_new_user("user")
  end

  desc "TODO"
  task create_guest: :environment do
  	User.create_new_user("guest")
  end
end

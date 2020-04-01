task "admin:init" => :environment do
  require 'highline/import'

  begin
    email = "{{ discourse.email }}"
    existing_user = User.find_by_email(email)

    # check if user account already exixts
    if existing_user
      admin = existing_user
      say("Existing")
    else
      # create new user
      admin = User.new
      admin.email = email
      admin.username = UserNameSuggester.suggest(admin.email)
      password = SecureRandom.hex
      admin.password = password
      say(password)
    end

    # save/update user account
    saved = admin.save
    say(admin.errors.full_messages.join("\n")) unless saved
  end while !saved

  admin.active = true
  admin.save

  # grant admin privileges
  admin.grant_admin!
  if admin.trust_level < 1
    admin.change_trust_level!(1)
  end
  admin.email_tokens.update_all confirmed: true
  admin.activate

end
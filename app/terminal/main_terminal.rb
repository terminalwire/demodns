class MainTerminal < ApplicationTerminal
  desc "open DOMAIN", "Open in browser"
  def open(name)
    if domain = Domain.find_by(name:)
      browser.launch url_for(Domain.find_by(name: domain))
    else
      fail "Domain not found."
    end
  end

  desc "domains", "List all domains"
  def domains
    Domain.all.each do |domain|
      puts domain.name
    end
  end

  desc "regsiter DOMAIN", "Register a new domain"
  def register(name)
    domain = Domain.new(name:)

    if domain.save
      puts "Domain #{domain.name} registered successfully."
    else
      puts "Failed to register domain: #{domain.errors.full_messages.join(', ')}"
    end
  end

  desc "login", "Login to your account"
  def login
    print "Email: "
    email = gets.chomp

    print "Password: "
    password = getpass

    # Replace this with your own authentication logic; this is an example
    # of how you might do this with Devise.
    user = User.find_for_authentication(email: email)
    if user && user.valid_password?(password)
      self.current_user = user
      puts "Successfully logged in as #{current_user.email}."
    else
      fail "Could not find a user with that email and password."
    end
  end

  desc "whoami", "Displays current user information."
  def whoami
    if self.current_user
      puts "Logged in as #{current_user.email}."
    else
      fail "Not logged in. Run `#{self.class.basename} login` to login."
    end
  end

  desc "logout", "Logout of your account"
  def logout
    session.reset
    puts "Successfully logged out."
  end
end

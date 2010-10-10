# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bank_session',
  :secret      => 'd63bc29b95a7a996ffd56476af5c1914b2f9e8499f069836159d0d958fa1cdfb9c15f6a1c2a51ca1aab450094c6336667fbe11cb86c51c6740becaddb0e13c08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

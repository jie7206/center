# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_center_session',
  :secret      => '870ecf157e18acbcc78d6e2e82b9c4565a058f21f6ff65dc2ca528b6d2d6c2d612c86e1c0a57a3cab0e87394fc1ff1970bc136cfa8ee1cca340acb9a23c9f577'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

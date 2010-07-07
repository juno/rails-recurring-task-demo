# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_recurring-demo_session',
  :secret      => 'c383bd8004ed5d7d040059a65573c4948f905c5794ef23bc8b94dd651bf7aba7b95c4f9327dd73939222be2bc9b3d5640576c045f94f6f792cbd36d58e7fa29c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

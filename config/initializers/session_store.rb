# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_moneyrail_session',
  :secret      => 'f56f10c9b9cde91bb4f967e6a669e6d7c84241e992100de4cacf0a58e913e6d5fe0bd9c87deef55c3edb29b19f6a5c81e37ba98db1674677897551654a2c3fbd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

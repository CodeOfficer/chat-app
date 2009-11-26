# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chat-app_session',
  :secret      => 'bb7d9ba5cdfc0146040517bb4e48d0191214ad118dce2ac6dc867e57bb09f11d74a599490cba53580c4724277f25a6a62218fbb2a60704d04a83d928bbaa89d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

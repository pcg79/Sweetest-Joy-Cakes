# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_joys_cakes_session',
  :secret      => '2809adab75c0ec0b5608f42a1b004d7cd3abe929ec6e127d869f727adf354d1abf71b0c98eb26261d4f7e96a8478d0d3f6ca8d88b093266b8338486189884b64'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

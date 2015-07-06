# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my_demo_session',
  :secret      => '4f80f48e73ecc80b42a90b7ef68b2c30a8cbca0a5d1f22654f9367394e2330d3449dc6c058ec35534690021066c372db371ac9973f01715b155332be215b3dff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

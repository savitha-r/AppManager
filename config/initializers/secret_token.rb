# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
AppManager::Application.config.secret_key_base = 'a2d21f60b5e4e6a5092d20321cac71aa9e2ca1514dd43e418260ed91f4e9b3611911f52a074f7947a998d8bd25895cf4c7ca40bddd9830cf0a587c4bb71f682e'

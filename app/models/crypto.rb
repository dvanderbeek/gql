module Crypto
  def self.table_name_prefix
    "crypto_"
  end

  def self.create_token(attrs, success, failure)
    token = Token.create(**attrs)
    yield token
    token.valid? ? success.call(token) : failure.call(token)
  end
end

require 'openssl'

module Crypt
  @@cipher_type = 'AES-256-CBC'
  def Crypt.decrypt(encrypted_data, key)
    aes = OpenSSL::Cipher::Cipher.new(@@cipher_type)
    aes.decrypt
    aes.key = key
    aes.update([encrypted_data].pack('H*')) + aes.final
  end

  def Crypt.encrypt(data, key)
    aes = OpenSSL::Cipher::Cipher.new(@@cipher_type)
    aes.encrypt
    aes.key = key
    (aes.update(data) + aes.final).unpack('H*')[0]
  end
end

class User < ActiveRecord::Base
  def self.current_user
    @@current_user
  end
  def self.current_user=(value)
    @@currrent_user=value
  end
  def self.login(username,password)
    find_by_name_and_password(username,password)
  end
end

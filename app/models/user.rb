class User < ActiveRecord::Base
  include Authority::UserAbilities
end

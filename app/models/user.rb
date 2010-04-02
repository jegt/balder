class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_permissible
  belongs_to :default_album, :class_name => 'Album'
end

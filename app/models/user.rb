class User < ActiveRecord::Base
	acts_as_authentic
	 validates_format_of :zip, :with => /^$| [0-9]*/
end

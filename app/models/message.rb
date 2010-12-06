# == Schema Information
# Schema version: 20101206025912
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  msg        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
   attr_accessible :msg

   validates :msg, :presence => true,
                   :length => { :maximum => 2500}
end

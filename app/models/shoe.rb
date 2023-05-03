# == Schema Information
#
# Table name: shoes
#
#  id          :integer          not null, primary key
#  authentic   :boolean
#  deadstock   :boolean
#  description :text
#  image       :string
#  shoe_type   :string
#  size        :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Shoe < ApplicationRecord
end

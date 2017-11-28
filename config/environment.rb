require 'pry'

require_relative '../lib/author.rb'
require_relative '../lib/story.rb'
require_relative '../lib/category.rb'

# Custom Error inheriting properties from TypeError
class AssociationTypeMismatchError < TypeError; end

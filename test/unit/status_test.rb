require 'test_helper'

class StatusTest < ActiveSupport::TestCase

	test "that a status requires content" do 
		status = Status.new
		assert !status.save
		assert !status.errors[:content].empty?

	end

	test "that a status has at least two letters" do 
		status = Status.new
		status.content = "H"

		assert !status.save
		assert !status.errors[:content].empty?

	end


	test "that a status has a user ID" do 
		status = Status.new
		status.content = "Hhello"
		assert !status.save
		assert !status.errors[:user_id].empty?

	end
end

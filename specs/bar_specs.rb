require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar')
# require_relative('../room')
# require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test 

end
require 'simplecov'
SimpleCov.start

$: << File.dirname(__FILE__) + '/../lib/'
require 'viewpoint'
require 'viewpoint/logging/config'
require 'ostruct'
require_relative 'xml_matcher'

RSpec.configure do |c|
  c.mock_with :rspec do |mocks|
    mocks.yield_receiver_to_any_instance_implementation_blocks = true
  end
end

module SpecHelper
  def specdir
    File.dirname(__FILE__)
  end

  def load_soap(name, type)
    File.read("#{specdir}/soap_data/#{name}_#{type}.xml").gsub(%r{>\s+}, '>')
  end
end

include SpecHelper

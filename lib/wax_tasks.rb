# frozen_string_literal: true

# rubygems
require 'rubygems'

# stdlib
require 'csv'
require 'fileutils'
require 'json'
require 'yaml'

# 3rd party
require 'hashie'
require 'mini_magick'
require 'rainbow'
require 'safe_yaml/load'
require 'wax_iiif'

# relative
require_relative 'wax_tasks/asset'
require_relative 'wax_tasks/collection'
require_relative 'wax_tasks/error'
require_relative 'wax_tasks/index'
require_relative 'wax_tasks/item'
require_relative 'wax_tasks/record'
require_relative 'wax_tasks/site'
require_relative 'wax_tasks/utils'

#
module WaxTasks
  DEFAULT_CONFIG_FILE = "#{Dir.pwd}/_config.yml"

  def self.config_from_file(file = nil)
    YAML.safe_load(File.open(file || DEFAULT_CONFIG))
  rescue => e
    raise WaxTasks::Error::InvalidConfig, "Cannot open config file '#{file}'."
  end
end

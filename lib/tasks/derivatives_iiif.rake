# frozen_string_literal: true

require 'wax_tasks'

namespace :wax do
  namespace :derivatives do
    desc 'generate iiif derivatives from local image files'
    task :iiif do
      args = ARGV.drop(1).each { |a| task a.to_sym }
      raise WaxTasks::Error::MissingArguments, Rainbow("You must specify a collection after 'wax:derivatives:iiif'").magenta if args.empty?

      args.each do |a|
        collection = WaxTasks::Collection.new(site, a)
        WaxTasks.generate_iiif_derivatives(collection)
      end
    end
  end

  # alias wax:iiif to wax:derivatives:iiif for backwards compatibility
  task :iiif do
    t = Rake::Task['wax:derivatives:iiif']
    desc t.full_comment if t.full_comment
    arguments = ARGV.drop(1).each { |a| task a.to_sym }
    t.invoke(*arguments)
  end
end

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "task for travis"
task :travis => [:spec]

namespace :db do
  desc "Fill database with Dimensions and a sample poll"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    d = Dimension.create(name: "Gender")
    d.values.create(label: "female")
    d.values.create(label: "male")
    d.values.create(label: "trans")
    d.values.create(label: "genderqueer")

    d = Dimension.create(name: "Religion")
    d.values.create(label: "Christianity")
    d.values.create(label: "Islam")
    d.values.create(label: "Hinduism")
    d.values.create(label: "Buddhism")
    d.values.create(label: "Judaism")

    d = Dimension.create(name: "Ability")
    d.values.create(label: "able bodied")
    d.values.create(label: "chronically ill")
    d.values.create(label: "any disability")

    d = Dimension.create(name: "National Origin")
    d.values.create(label: "Germany")
    d.values.create(label: "Indonesia")
    d.values.create(label: "Vietnam")

    d = Dimension.create(name: "Income")
    d.values.create(label: "Bafoeg")
    d.values.create(label: "Parents")
    d.values.create(label: "Own Money")
    d.values.create(label: "Working")
    d.values.create(label: "other")

    d = Dimension.create(name: "Education")
    d.values.create(label: "Has Worked before")
    d.values.create(label: "Directly from School")
    d.values.create(label: "Directly from Bachelor's Programme")
    d.values.create(label: "Did an Education before")
    d.values.create(label: "other")

    p = Poll.create(name: "WT1 Web Applications Course WS 2015")
    Dimension.all.each do |d|
      DimensionsInPoll.create(poll_id: p.id, dimension_id: d.id)
    end
    puts "done."

  end
end

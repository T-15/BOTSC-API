# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clear DB
require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

sponsor_img = File.new("test/fixtures/sponsor.png")
sponsors = Sponsor.create([{image: sponsor_img, website_url: 'http://squirespublichouse.com/'}, {image: sponsor_img, website_url: 'http://blackbull.ca/'}])

referral_methods = ReferralMethod.create([{name: 'Website'}, {name: 'Facebook'}, {name: 'Club Member'}, {name: 'Other'}])

positions = Position.create([{name: 'forward'}, {name: 'midfield'}, {name: 'defence'}, {name: 'goalkeeper'}])

member_services = MemberService.create([{name: 'Genecos', contact_name: 'Patrick Malleret', website_url: 'http://genecos.com/'}])

season = Season.create(year: '2020', name: '36th Season')

divisions = Division.create([{name: 'Over 45', season_id: season.id}, {name: 'Over 60', season_id: season.id}])

sizes = Size.create([{name: 'Large'}, {name: 'Medium'}, {name: 'Small'}])

statuses = Status.create([{name: 'Registered'}, {name: 'Applicant'}, {name: 'Un-Played'}])

members = Member.create([
    {
        shirt_size_id: sizes.first.id,
        short_size_id: sizes.first.id,
        status_id: statuses.first.id,
        first_name: 'James',
        last_name: 'Tinker',
        birthday: '1994-06-27',
        phone: '2892303614',
        email: 'j.tinker30@hotmail.com',
        postal_code: 'L7L2L9',
        member_since: '2019',
    },
    {
        shirt_size_id: sizes.first.id,
        short_size_id: sizes.first.id,
        status_id: statuses.first.id,
        first_name: 'Simon',
        last_name: 'Tinker',
        birthday: '1964-07-21',
        phone: '9056327137',
        email: 'sandh.tinker@gmail.com',
        postal_code: 'L7L2L9',
        member_since: '2009',
    }
])

teams = Team.create([
    {convenor_id: members.first.id, division_id: divisions.first.id, sponsor_id: sponsors.first.id, name: 'Black Bull Imperials'},
    {convenor_id: members.first.id, division_id: divisions.first.id, sponsor_id: sponsors.first.id, name: 'Squires Rams'},
    {convenor_id: members.first.id, division_id: divisions.first.id, sponsor_id: sponsors.first.id, name: 'Piper Arms Gunners'},
    {convenor_id: members.first.id, division_id: divisions.first.id, sponsor_id: sponsors.first.id, name: 'Aches N Pains True Blues'},
    {convenor_id: members.first.id, division_id: divisions.first.id, sponsor_id: sponsors.first.id, name: 'Air Solutions'},
    {convenor_id: members.first.id, division_id: divisions.first.id, sponsor_id: sponsors.first.id, name: 'Black Bull Rangers'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Cancro Machining'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Squires Knights'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Piper Arms Kopites'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Wentworth Arenas'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Roseland Barber Wizards'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Orthogait Celtic'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Bay City Rebels'},
    {convenor_id: members.first.id, division_id: divisions.last.id, sponsor_id: sponsors.first.id, name: 'Orange Crush'}
])

team_members = TeamMember.create([{team_id: teams.first.id, member_id: members.first.id}, {team_id: teams.first.id, member_id: members.last.id}])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sponsors = Sponsor.create([{website_url: 'http://squirespublichouse.com/'}, {website_url: 'http://blackbull.ca/'}])

referral_methods = ReferralMethod.create([{name: 'Website'}, {name: 'Facebook'}, {name: 'Club Member'}, {name: 'Other'}])

member_services = MemberService.create([{name: 'Genecos', contact_name: 'Patrick Malleret', website_url: 'http://genecos.com/'}])

season = Season.create(year: '2020', name: '36th Season')

divisions = Division.create([{name: 'Over 45', season_id: season.id}, {name: 'Over 60', season_id: season.id}])

sizes = Size.create([{name: 'Large'}, {name: 'Medium'}, {name: 'Small'}])

statuses = Status.create([{name: 'Registered'}, {name: 'Applicant'}])

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

team = Team.create(
    convenor_id: members.first.id,
    division_id: divisions.first.id,
    sponsor_id: sponsors.first.id,
    name: 'Squires Rams'
)

team_members = TeamMember.create([{team_id: team.id, member_id: members.first.id}, {team_id: team.id, member_id: members.last.id}])
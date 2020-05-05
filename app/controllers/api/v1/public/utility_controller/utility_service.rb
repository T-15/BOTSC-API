class Api::V1::Public::UtilityController::UtilityService

    def initialize
        
    end

    def required_param(params, req_params)
        errors = []
        req_params.each do |param|
            if !params.key?(param) || params[param].empty?
                errors.push({missing_param: param})
            end
        end

        return errors
    end
    
    def seed(teams)
        @weeks = {}

        # Add a nil value in case of odd number (equals a bye-week)
        teams.push(nil) if teams.size.odd?
        # Number of weeks in the season
        weeks = 20
        # Matches per round is number of teams, halved, this means each team has one game a week
        matches_per_round = teams.size / 2
        weeks.times do |index|
            #set up an array for the week number
            @weeks[index+1] = []
            matches_per_round.times do |match_index|
                # For the week number, take the index and reverse index teams to create a match.
                # eg. 1-6, 2-5, 3-4
                @weeks[index+1] << [teams[match_index], teams.reverse[match_index]]
            end
            # Reformat the teams array by keeping the first team in it's spot, and rotating the rest by 1 position
            # eg. 1,2,3,4,5,6 becomes 1,3,4,5,6,2
            teams = [teams[0]] + teams[1..-1].rotate(-1)
        end

        return @weeks
    end

    def get_schedule_dates(start_date, end_date, day_of_matches, exception_dates)
        # day of the week in 0-6. Sunday is day-of-week 0; Saturday is day-of-week 6.

        # Get all dates within the start and end dates
        schedulable_days = (start_date..end_date).to_a.select {|k| day_of_matches.include?(k.wday)}

        # Remove any dates that are listed in the exception_dates
        schedulable_days.delete_if {|x| exception_dates.include?(x)}
    end

    def match_creator(seeds, match_days)
        # seeds coms in format of[ week1, [[match1], [match2], [etc]], week2, [[match1]]]
        seeds.each do |k, v|
            # Get the week number from the key
            week = k
            match_day = match_days[week - 1]
            # Get the un-played status to mark the matches as new
            status = Status.get_un_played.first
            
            # The value is an array of matches
            v.each do |match|
                # Create a match using the array of 2 id's within for home/away, the week, and the retreived status
                Match.create(home_team_id: match[0], away_team_id: match[1], week: week, date: match_day, status: status)
            end
        end
    end
end
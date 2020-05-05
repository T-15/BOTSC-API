class Api::V1::Private::UtilityController::UtilityService

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

end
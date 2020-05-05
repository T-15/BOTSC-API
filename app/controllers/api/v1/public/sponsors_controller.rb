class Api::V1::Public::SponsorsController < ApplicationController

    # GET api/v1/public/sponsors/active
    def active
        @sponsors = Sponsor.where(active: true)

        render json: @sponsors, include: ['sponsors']
    end

end
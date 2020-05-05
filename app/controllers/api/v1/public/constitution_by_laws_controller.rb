class Api::V1::Public::ConstitutionByLawsController < ApplicationController

  # GET api/v1/public/constitution_by_laws/active
  def active
    @constitution_by_laws = ConstitutionByLaw.where(active: true)

    render json: @constitution_by_laws
  end

end

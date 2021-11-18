class PincodesController < ApplicationController

  def pincode_infection
    infection_cases = User.joins(:pincode).where(infected: true, pincode: {code: params[:pincode]}).count
    zone_type = if infection_cases.zero?
                  'green'
                elsif infection_cases < 5
                  'orange'
                else
                  'red'
                end
    render json: {numCases: infection_cases, zone_type: zone_type}
  end
end

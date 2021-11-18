class TestsController < ApplicationController
  before_action :set_user

  def new
    @test = @user.tests.build(
      travel_history: params[:travel_history],
      contact_with_covid_patient: params[:contact_with_covid_patient]
    )
    symptoms = JSON.parse(params[:symptoms])
    symptoms.each do |symp|
      @test.symptoms.build(name: symp)
    end
    @test.save
    infection_rate = 5
    unless @test.symptoms.size.zero?
      if @test.symptoms.count > 2
        infection_rate = 95
      elsif @test.symptoms.count > 1
        infection_rate = 75
      else
        infection_rate = 50
      end
    end
    @test.update(probability: infection_rate)
    render json: {riskPercentage: infection_rate}
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end

class Api::V1::TestrunController < ApplicationController
  def index
    testruns = Testrun.all 
    render json: testruns, status: 200
  end

  def create
    testrun = Testrun.new(
      firstopt: test_params[:firstopt],
      secondopt: test_params[:secondopt]
    )
    if testrun.save
      render json: testrun, status: 200
    else
      render json: {error: "Error creating testrun."}
    end
  end

  def show
    testrun = Testrun.find_by(id: params[:id])
    if testrun
      render json: testrun, status: 200
    else
      render json: {error: "testrun not found."}
    end
  end

  private
    def test_params
      params.require(:testrun).permit([
        :firstopt,
        :secondopt
      ])
    end
end

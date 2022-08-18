class TestsController < ApplicationController
  def index
    render plain: Test.all.order(id: :asc).pluck("id", "title").join("\n")
  end
end

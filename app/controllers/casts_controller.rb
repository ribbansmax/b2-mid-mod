class CastsController < ApplicationController
  def create
    actor = Actor.find_by(name: params["actor"])
    Cast.create!(actor_id: actor.id, movie_id: params["movie_id"])
    redirect_to "/movies/#{params['movie_id']}"
  end
end
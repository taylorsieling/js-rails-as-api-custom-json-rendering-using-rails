class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]

    # you can use only: or except:
  end

  def show
    # key/hash method
    # bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 

    # # slice method
    # bird = Bird.find_by(id: params[:id])
    # render json: bird.slice(:id, :name, :species)

    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
  
end
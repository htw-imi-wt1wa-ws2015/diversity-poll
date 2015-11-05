class RepliesController < ApplicationController
  before_action :set_poll, only: [:new, :create]

  NewReply = Struct.new(:dimension, :dimension_id, :values, :reply)
  @@marker = "Dimension:"
  def new
    @marker = @@marker
    @replies = []
    @poll.dimensions.each do | d |
      r = NewReply.new
      r.values = d.values
      r.dimension = d.name
      r.dimension_id = d.id
      r.reply = Reply.new(poll: @poll, dimension: d)
      @replies << r
    end
  end


  def create

    params.select {|k,v| k.start_with?(@@marker)}.each do | dimension, values |
      m = dimension.match(/#{@@marker}(.*)/)
      d = Dimension.find(m[1].to_i)
      value = Value.find(values[:value_id].to_i)
      Reply.create(dimension: d ,poll: @poll ,value: value)
      
    end

    redirect_to poll_path(@poll)

  end

  def index
    @replies = Reply.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end
end

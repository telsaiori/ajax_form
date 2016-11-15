class MemosController < ApplicationController
  before_action :set_demo, only: [:edit, :destroy, :update]

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @memoid = @memo.id
    @memo.update(memo_params)
    respond_to do |format|
      format.js 
    end
      

  end

  def create
    @memo = Memo.new(memo_params)
    respond_to do |format|
      if @memo.save
        format.html
        format.js
      else
        format.html { flash.now[:message] = "????" }
      end
    end
  end

  def destroy
    @memo.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end

  def set_demo
    @memo = Memo.find(params[:id])
  end
end

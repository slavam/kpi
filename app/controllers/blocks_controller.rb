# coding: utf-8
class BlocksController < ApplicationController
  before_filter :find_block, :only => [:show, :edit, :update, :destroy]
  def index
    @blocks = Block.order("weight desc")
  end
  
  def show
  end

  def new
    @block = Block.new
  end
  
  def create
    @block = Block.new params[:block]
    if not @block.save
      render :new
    else
      redirect_to :blocks
    end
  end
  
  def edit
  end

  def update
    if not @bolck.update_attributes params[:block]
      render :action => :edit
    else
      redirect_to block_path(@block)
    end
  end
  
  def destroy
    @block.destroy
    redirect_to blocks_path
  end
  private
  
  def find_block
    if params[:id]
      @block = Block.find params[:id]
    end
  end
end
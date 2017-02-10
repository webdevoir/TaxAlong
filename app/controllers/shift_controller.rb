class ShiftController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @shifts = @user.shifts.all
    # @shifts = Shift.all
  end

  def show
    @user = User.find(params[:user_id])
    @shift = Shift.find(params[:id])
    # @shift = @user.shifts[shift]
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_parameters)
    if @shift.save
      redirect_to shift_path(@shift)
    else 
      # flash[:danger] = "User did not save, try again"
      render 'new'
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update_attributes(shift_params)
      flash[:success] = "Info updated"
      redirect_to shift_url(@shift)
    else
      flash[:danger] = "Edits did not save, try again"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @shift = Shift.find(params[:id])
    @shift.destroy
    flash[:success] = "Shift deleted"
    redirect_to user_url(@user)
  end

end

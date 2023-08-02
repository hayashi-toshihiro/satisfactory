class MachinesController < ApplicationController
  def new
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to recipes_path, success: 'セーブできました'
    else
      flash.now[:danger] = "セーブ失敗"
      render :new
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:machine_name, :electricity)
  end
end

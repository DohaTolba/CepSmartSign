class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #GET /generate_payroll
  def generat_payroll  
  end
  
  
  
  def payroll
     @from = Date.new(params["report"]["from(1i)"].to_i, params["report"]["from(2i)"].to_i, params["report"]["from(3i)"].to_i)
    @to = Date.new(params["report"]["to(1i)"].to_i, params["report"]["to(2i)"].to_i, params["report"]["to(3i)"].to_i)
    @employees = Employee.all
  end
  
  def payrollxls
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.csv { send_data @employees.to_csv }
      format.xls 
    end
  end
  
  
  def new_sign
  end
  
  def check
    @employee = Employee.find(params["employee"]["id"])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :pay_rate, :signs)
    end

#end class
end
class Employee < ActiveRecord::Base
  has_many :signs
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee|
        csv << employee.attributes.values_at(*column_names)
      end
    end
  end
  
  def full_name 
     "#{first_name} #{last_name}"
  end
  
  def working_hours(start_date, end_date)
    puts "=============================="
    puts "the start and end are #{start_date.inspect} and end is #{end_date.inspect}"
    puts "==================================="
    total_hours = 0
    salary = 0
      signs.each do |sign|
        if sign.date > start_date && sign.date < end_date
          total_hours = total_hours + (sign.check_out - sign.check_in) / 3600.0
        end 
      end
    salary = total_hours * pay_rate
    return [total_hours, salary]
  end
  
# check the status of todays sign in or out
# if not signed in -> sign_in
# if signed_in -> sign_out

  def check_today_sign
    status = 0
    
    if signs.last.check_out != nil
      status = 0
    else 
      status = 1
    end
    return status
  end
  
#end class
end

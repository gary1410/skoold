class Student < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :picture_cache, :first_name, :date_of_birth, :city,
                  :parent_first_name, :parent_last_name, :parent_phone_number , :parent_email, :sex

  has_many :timetables
  has_many :cases

  def status
    if self.cases.joins(:case_histories).where("case_histories.status" => "open").size > 0
      "open"
    elsif self.cases.joins(:case_histories).where("case_histories.status" => "open").size > 0
      "processing"
    else
      "closed"
    end
  end

  def full_name
    "#{first_name} #{name}"
  end

  def age
    "#{((Time.now - Time.strptime(self.date_of_birth, '%m/%d/%Y'))/1.year).floor} yrs"
  end

  mount_uploader :picture, StudentPictureUploader
end

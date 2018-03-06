class Profile < ActiveRecord::Base
  belongs_to :user
  validate :male_not_sue
  validate :first_or_last
  
  #def name_present
  #if first_name.nil? and last_name.nil?
  # errors.add(:first_name, "Please enter a valid first name or last name.")
  # end
  #end   
   
   def male_not_sue
   if first_name == 'Sue' && gender == 'male'
   errors.add(:first_name, "Please enter a valid gender.")
   end
   end
   
   def first_or_last
     if first_name.nil? && last_name.nil?
	 errors.add(:first_name, "Specify a first or last name.")
	 end
	 end
   
   def self.get_all_profiles(start_year,test_year)
    Profile.where(:birth_year => start_year..test_year).order('birth_year asc')  
end
   
   validates :gender, inclusion: {in: ["male","female"]}
end

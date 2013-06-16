# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teachers = Teacher.create([{
  first_name: "Alice",
  name: "Copper",
  teacher_id: "1",
  device_id: "",
  password: "foobar",
  login: "alice"
},{
  first_name: "Bob",
  name: "Baker",
  teacher_id: "2",
  device_id: "",
  password: "foobar",
  login: "bob"
},{
  first_name: "Charlie",
  name: "Unicorn",
  teacher_id: "3",
  device_id: "",
  password: "foobar",
  login: "charlie"
},{
  first_name: "Dora",
  name: "Smith",
  teacher_id: "4",
  device_id: "",
  password: "foobar",
  login: "dora"
}])

subjects = Subject.create([{name: "Biology"}, {name: "English"}, {name: "Math"}, {name: "Art"}])
class_rooms = ClassRoom.create([{name: "404"}, {name: "69"}, {name: "42"}, {name: "3"}])

Student.create([{first_name:"Jack", name: "Dempsey", picture: "", description: "A student", date_of_birth: "06/15/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1234", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Jonathan", name: "Sarah", picture: "", description: "A student", date_of_birth: "06/16/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1235", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Bill ", name: "Donahue", picture: "", description: "A student", date_of_birth: "06/17/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1236", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Clifford", name: "Park", picture: "", description: "A student", date_of_birth: "06/18/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1237", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Toby", name: "Turbinstein", picture: "", description: "A student", date_of_birth: "06/19/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1238", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Michael", name: "Davinchi", picture: "", description: "A student", date_of_birth: "06/20/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1239", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Adam", name: "Blake", picture: "", description: "A student", date_of_birth: "06/21/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1240", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Mila", name: "Percherrsky", picture: "", description: "A student", date_of_birth: "06/22/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1241", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Lipscomb", name: "Nebraska", picture: "", description: "A student", date_of_birth: "06/23/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1242", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Simpson", name: "Mcguire", picture: "", description: "A student", date_of_birth: "06/24/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1243", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Herbert", name: "Maple", picture: "", description: "A student", date_of_birth: "06/25/2000", parent_first_name: "Pedrom", parent_last_name: "Maeshiro", parent_phone_number: "(555)555-1244", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Jenkins", name: "Tompson", picture: "", description: "A student", date_of_birth: "06/26/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1245", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Woodrow", name: "Tyson", picture: "", description: "A student", date_of_birth: "06/27/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1246", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Tom", name: "Hampton", picture: "", description: "A student", date_of_birth: "06/28/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1247", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Susan", name: "Ray", picture: "", description: "A student", date_of_birth: "06/29/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1248", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Will", name: "Walker", picture: "", description: "A student", date_of_birth: "06/30/2000", parent_first_name: "Jacky", parent_last_name: "Sandal", parent_phone_number: "(555)555-1249", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Leonardo", name: "Donaldson", picture: "", description: "A student", date_of_birth: "07/01/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1250", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Roy", name: "Burmingham", picture: "", description: "A student", date_of_birth: "07/02/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1251", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Shash", name: "Sam", picture: "", description: "A student", date_of_birth: "07/03/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1252", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Patty", name: "Libinskid", picture: "", description: "A student", date_of_birth: "07/04/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1253", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Gary", name: "Lincoln", picture: "", description: "A student", date_of_birth: "07/05/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1254", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Sully", name: "Jennifer", picture: "", description: "A student", date_of_birth: "07/06/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1255", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Zylen", name: "Champion", picture: "", description: "A student", date_of_birth: "07/07/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1256", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Honovan", name: "Chen", picture: "", description: "A student", date_of_birth: "07/08/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1257", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Venus", name: "Delanore", picture: "", description: "A student", date_of_birth: "07/09/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1258", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Raven", name: "Washington", picture: "", description: "A student", date_of_birth: "07/10/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1259", parent_email: "foo@bar.com"}])
Student.create([{first_name:"Conor", name: "Freidersdorf", picture: "", description: "A student", date_of_birth: "07/11/2000", parent_first_name: "Rashid", parent_last_name: "Evans", parent_phone_number: "(555)555-1260", parent_email: "foo@bar.com"}])

['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'].each do |day_of_week|
  ['9:00','10:00','11:00','12:00','13:00','14:00','15:00'].each do |hour|
    subjects = Subject.all.to_a.shuffle.slice(0,2)
    class_rooms = ClassRoom.all.to_a.shuffle.slice(0,2)
    teachers = Teacher.all.to_a.shuffle.slice(0,2)
    Student.all.each_with_index do |student, index|
      Timetable.create class_room_id: class_rooms[index % 2],
                       subject_id: subjects[index % 2],
                       teacher_id: teachers[index % 2],
                       student_id: student,
                       day_of_week: day_of_week,
                       hour: hour
    end
  end
end

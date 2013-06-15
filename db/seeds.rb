# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = Student.create([{
  first_name: "foo",
  name: "bar",
  picture: "",
  description: "foobar",
  date_of_birth: "06/15/2013",
  parent_first_name: "Foo",
  parent_last_name: "Bar",
  parent_phone_number: "0123455",
  parent_email: "foo@bar.com"
}])

teachers = Teacher.create([{
  first_name: "foo_teacher",
  name: "bar_teacher",
  tutor_id: "123_foobar",
  device_id: "",
  password: "123",
  login: "123"
}])

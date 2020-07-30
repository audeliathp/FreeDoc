# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all
Attribution.destroy_all
Appointment.destroy_all
City.destroy_all

Specialty.create!(specialty_name: "ophtalmology")
Specialty.create!(specialty_name: "neurology")
Specialty.create!(specialty_name: "family medecine")
Specialty.create!(specialty_name: "dermatology")
Specialty.create!(specialty_name: "pediatrics")
Specialty.create!(specialty_name: "psychiatry")
Specialty.create!(specialty_name: "surgery")

50.times do
  city = City.create!(name: Faker::Address.city)
end

100.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: City.all.sample.id)
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
  
end
  
100.times do
  attribution = Attribution.create!(doctor_id: Doctor.all.sample.id, specialty_id: Specialty.all.sample.id)
end

puts "100 doctors and patients added"
50.times do
  appointment = Appointment.create!(date: Faker::Date.between(from: '2020-04-01', to: '2025-09-28'), doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id, city_id: City.all.sample.id)
end
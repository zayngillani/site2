# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
puts "Import Profession to DB Process Start"

professions = ["ROR Developer", "Cloud Architect", "Cloud Consultant", "Cloud Product and Project Manager", "Cloud Services Developer", "Cloud Software and Network Engineer", "Cloud System Administrator", "Cloud System Engineer", "Computer andInformation Research Scientist", "Computer and Information Systems Manager",
 "Computer Network Architect", "Computer Systems Analyst", "Computer Systems Manager", "IT Analyst", "IT Coordinator", "Network Administrator", "Network Architect", "Network and Computer Systems Administrator", "Network Engineer", "Network Systems Administrator", "Senior Network Architect", "Senior Network Engineer", "Senior Network System Administrator", "Telecommunications Specialist", "Customer Support Administrator", "Customer Support Specialist", "Desktop Support Manager", "Desktop Support Specialist", "Help Desk Specialist", "Help Desk Technician", "IT Support Manager", "IT Support Specialist", "IT Systems Administrator", "Senior Support Specialist", "Senior System Administrator", "Support Specialist", "Systems Administrator", "Technical Specialist", "Technical Support Engineer", "Technical Support Specialist", "Data Center Support Specialist", "Data Quality Manager", "Database Administrator", "Senior Database Administrator", "Application Support Analyst", "Senior System Analyst", "Systems Analyst", "Systems Designer", "Chief Information Officer (CIO)",
"Chief Technology Officer (CTO)", "Director of Technology", "IT Director", "IT Manager", "Management Information Systems Director", "Technical Operations Officer",
"Information Security Analyst", "Security Specialist", "Senior Security Specialist", "Application Developer", "Applications Engineer",
"Associate Developer" , "Computer Programmer", "Developer", "Java Developer", "Junior Software Engineer" , ".NET Developer",
"Programmer", "Senior Applications Engineer", "Senior Programmer", "Senior Programmer Analyst", "Senior Software Engineer", "Senior System Architect", "Senior System Designer", "Senior Systems Software Engineer", "Software Architect", "Software Developer",
"Software Engineer", "Software Quality Assurance Analyst", "System Architect", "Systems Software Engineer", "Front End Developer", "Senior Web Administrator", "Senior Web Developer", "Web Administrator", "Web Developer"]
import_profession = []
professions.each do |p|
  import_profession << {name: p}
end

Profession.create(import_profession)
puts "Import Profession to DB Process End"
testy = Owner.create(name: "Testy McTesterton", email: "testy@test.com", phone: "555-555-5555", password: "testpw")
demo = Owner.create(name: "Demo McDemoface", email: "demo@demo.com", phone: "444-444-4444", password: "demopw")
 
nooka = Dog.create(name: "Nooka", breed: "Alaskan Malamute", special_notes: "Needs extra brushing", owner_id: testy.id)
chewie = Dog.create(name: "Chewie", breed: "Mix", special_notes: "Doesn't like water", owner_id: testy.id)
captain = Dog.create(name: "Captain", breed: "Husky", owner_id: demo.id)

Appointment.create(date_time: "October 14, 2020", owner_id: testy.id, dog_id: nooka.id)
Appointment.create(date_time: "December 21, 2020", owner_id: testy.id, dog_id: chewie.id)

manager = Owner.create(name: "Wagtorium Manager", email: "manager@wagtorium.com", phone: "555-555-5555", password: "managerpw")

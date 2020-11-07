testy = Owner.create(name: "Testy", email: "testy@test.com", phone: "555-555-5555", password: "testpw")

nooka = Dog.create(name: "Nooka", breed: "Alaskan Malamute", special_notes: "Needs extra brushing", owner_id: testy.id)
chewie = Dog.create(name: "Chewie", breed: "Mix", special_notes: "Doesn't like water", owner_id: testy.id)

Appointment.create(date_time: "October 14, 2020", owner_id: testy.id, dog_id: nooka.id)
Appointment.create(date_time: "December 21, 2020", owner_id: testy.id, dog_id: chewie.id)

manager = Owner.create(name: "Wagtorium Manager", email: "manager@wagtorium.com", password: "managerpw")

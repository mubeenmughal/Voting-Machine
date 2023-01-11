# frozen_string_literal: true

c = Constituency.create(name: 'c1')
c1 = Constituency.create(name: 'c2')
c2 = Constituency.create(name: 'c3')
Party.create(name: 'asd')
User.create(name: 'anas', email: 'ahmadanas4490@gmail.com', cnic: '1234567', password: '123456',
            password_confirmation: '123456', role: 'admin', constituency_id: c.id)
User.create(name: 'ahmad', email: 'ahmad@gmail.com', cnic: '1111123', password: '123456',
            password_confirmation: '123456', role: 'voter', constituency_id: c.id)
User.create(name: 'ali', email: 'ali@gmail.com', cnic: '1232211', password: '123456',
            password_confirmation: '123456', role: 'candidate', constituency_id: c2.id)

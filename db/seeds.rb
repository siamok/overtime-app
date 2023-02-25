# frozen_string_literal: true

employee = Employee.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test',
                           last_name: 'Test', phone: ENV['VERIFIED_NUMBER'], ssn: 1234, company: 'Test Company')

admin_user = AdminUser.create(email: 'admin@admin.com', password: 'adminadmin', password_confirmation: 'adminadmin', first_name: 'Admin',
                              last_name: 'Admin', phone: ENV['VERIFIED_NUMBER'], ssn: 1234, company: 'Test Company')
pp 'Users seeded'

AuditLog.create!(user_id: employee.id, status: 0, start_date: 6.days.ago)
AuditLog.create!(user_id: employee.id, status: 0, start_date: 13.days.ago)
AuditLog.create!(user_id: employee.id, status: 0, start_date: 20.days.ago)
pp 'Audit logs seeded'

100.times do |post|
  Post.create!(date: Date.today, work_performed: "#{post} work_performed content", user_id: employee.id, daily_hours: 2.5)
end

pp 'Posts seeded'

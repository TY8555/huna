# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 1번 경희대 , 2번 외대
# true : 남자, false : 여자
User.create(user_email: 'admin@huna.com', password: '1234', nickname: '관리자', age: 26, school: '1', major: '경영', kakao: 'admin', sex: true)
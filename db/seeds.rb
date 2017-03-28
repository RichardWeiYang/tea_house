# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DIS = [
  "浦东", "徐汇", "长宁", "普陀",
  "闸北", "虹口", "杨浦", "黄浦",
  "卢湾", "静安", "宝山", "闵行",
  "嘉定", "金山", "松江", "青浦",
  "南汇", "奉贤", "崇明"
];

puts "Create Shanghai District DB"
DIS.each do |dis|
  District.create!(:name => dis)
end

# Cat.destroy_all
# cat1 = Cat.create!(name: "Tabby", sex: "F", birth_date: "2013/06/05", color: "red")
# cat2 = Cat.create!(name: "Sharkie", sex: "M" , birth_date: "2004/3/3", color: "red")
# cat3 = Cat.create!(name: "Monsta", sex: "F" , birth_date: "2015/12/19", color: "red")
# cat4 = Cat.create!(name: "CrackerJ4x", sex: "M" , birth_date: "2001/4/11", color: "red")


CatRentalRequest.destroy_all
request1 = CatRentalRequest.create!(cat_id: 3,
                                    start_date: "2016/01/01",
                                    end_date: "2016/01/10",
                                    status: "APPROVED")

request2 = CatRentalRequest.create!(cat_id: 3,
                                    start_date: "2016/01/12",
                                    end_date: "2016/01/15",
                                    status: "APPROVED")

request3 = CatRentalRequest.create!(cat_id: 3,
                                    start_date: "2016/01/17",
                                    end_date: "2016/01/18",
                                    status: "APPROVED")

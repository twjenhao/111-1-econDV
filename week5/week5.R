#list

listExample = list()
listExample$obj1 = c(1, 2)
listExample$obj2 = "John"
listExample$objAdd2 = function(){
  return(listExample$obj1 + 2)
}

#Environment can be attached

envExample$obj1Add2()
attach(envExample)
search()

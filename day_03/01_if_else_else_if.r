x <- 2

if (x > 5){
  print('x is greater than 5')
}


x <- 7

if (x > 5){
  print('x is greater than 5')
}


x <- 4

if (x > 5){
  print('x is greater than 5')
} else {
  print('x is less than 5')
}


x <- 7

if (x > 5){
  print('x is greater than 5')
} else {
  print('x is less than 5')
}


x <- 5

if (x > 5){
  print('x is greater than 5')
} else if (x == 5) {
  print('x is 5')
} else {
  print('x is less than 5')
}


# the first if / else if / else that is TRUE will execute, ending the IF statement
x <- 1

if (x > 5){
  print('x is greater than 5')
} else if (x == 1) {
  print('x is 1')
} else if (x == 5) {
  print('x is 5')
} else {
  print('x is less than 5')
}

if (x > 5){
  print('x is greater than 5')
} else if (x != 5) {
  print('x is not 5')
} else if (x == 5) {
  print('x is 5')
} else {
  print('x is less than 5')
}

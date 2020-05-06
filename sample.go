package main

import (
	"fmt"
)

func foo(a []int) []int {
	for i := 0; i < 10; i++{
		a = append(a, i)
	}
	return a
}

func bar(a *[]int){
	for i := 0; i < 10; i++{
		*a = append(*a, i)
	}
}


func main() {
	ar := []int{}
	fmt.Printf("%p: %v\n", &ar, ar)
	foo(ar)
	fmt.Printf("%p: %v\n", &ar, ar)
	fmt.Printf("%p: %v\n", &ar, ar)
	bar(&ar)
	fmt.Printf("%p: %v\n", &ar, ar)
}

package main

import "fmt"

func main() {
	a := map[string][]int{
		"a": []int{1},
		"b": []int{2},
	}
	fmt.Printf("a: %T\n", a)
	fmt.Println("a", a)
}

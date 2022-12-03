package main

// https://go.dev/doc/tutorial/getting-started
// https://www.digitalocean.com/community/tutorials/how-to-write-comments-in-go
// https://www.tutorialkart.com/golang-tutorial/golang-check-if-strings-are-equal/
// https://www.geeksforgeeks.org/different-ways-to-concatenate-two-strings-in-golang/
// https://go.dev/tour/moretypes/15
// https://www.golangprograms.com/how-to-convert-string-to-integer-type-in-go.html

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	// "rsc.io/quote"
)

func main() {

	// fmt.Println("Hello, World!")
	// fmt.Println(quote.Go())
	// fmt.Println("")

	fmt.Println("(go) Day 1 Part 1")
	var s []int

	// fmt.Println("----------")
	ElfNumber := 0
	// fmt.Println("- Elf Number Is")
	// fmt.Println(ElfNumber)
	// fmt.Println("- Increase Slice Size")
	s = append(s, 0)

	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		InputLine := scanner.Text()
		// fmt.Println("- New Data")
		// fmt.Println(InputLine)

		if strings.Compare(InputLine, "") == 0 {
			ElfNumber++
			// fmt.Println("- Incrementing Elf Number To")
			// fmt.Println(ElfNumber)
			// fmt.Println("- Increase Slice Size")
			s = append(s, 0)
		} else {
			intVar, cow := strconv.Atoi(InputLine)
			if cow != nil {
				log.Println(cow)
			}
			// fmt.Println("- Adding To Slice")
			// fmt.Println(ElfNumber)
			s[ElfNumber] = s[ElfNumber] + intVar
		}

		if err := scanner.Err(); err != nil {
			log.Println(err)
		}

		// fmt.Println("----------")
		// fmt.Println("")

	}

	// printSlice(s)

	// https://stackoverflow.com/questions/34259800/is-there-a-built-in-min-function-for-a-slice-of-int-arguments-or-a-variable-numb
	max := s[0]
	maxElf := 0
	for i := 1; i < len(s); i++ {
		if max < s[i] {
			max = s[i]
			// cheesy hack because of difference in indexes between awk and go
			maxElf = i + 1
		}
	}
	// fmt.Println("Max Elf")
	// fmt.Println(maxElf)
	// fmt.Println("Value")
	// fmt.Println(max)
	fmt.Printf("(go) Elf %d has %d calories\n", maxElf, max)

}

func printSlice(s []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
}

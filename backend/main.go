// tells go that this an executable program
package main

import (
	"fmt"      //used for printing text
	"net/http" //enables web server tools
)

func main() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "ok")
	})
	fmt.Println("Backend running on http://localhost:8080")
	http.ListenAndServe(":8080", nil)
}

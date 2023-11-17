package main

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"os"
	"strconv"
	"strings"
)

const usage = `usage: testname path/to/file.go:line_number`

func exit(msg string, code int) {
	fmt.Fprintln(os.Stderr, msg)
	os.Exit(code)
}
func main() {
	if len(os.Args) != 2 {
		exit(usage, 2)
	}
	parts := strings.Split(os.Args[1], ":")
	if len(parts) != 2 {
		exit(usage, 2)
	}
	filename := parts[0]
	line, err := strconv.Atoi(parts[1])
	if err != nil {
		exit(err.Error(), 1)
	}
	fset := token.NewFileSet()
	file, err := parser.ParseFile(fset, filename, nil, 0)
	if err != nil {
		exit(err.Error(), 1)
	}
	for _, decl := range file.Decls {
		decl, _ := decl.(*ast.FuncDecl)
		if decl == nil {
			continue
		}
		start := fset.Position(decl.Pos())
		end := fset.Position(decl.End())
		if start.Line <= line && line <= end.Line {
			fmt.Println(decl.Name)
			return
		}
	}
	exit("no function found", 1)
}

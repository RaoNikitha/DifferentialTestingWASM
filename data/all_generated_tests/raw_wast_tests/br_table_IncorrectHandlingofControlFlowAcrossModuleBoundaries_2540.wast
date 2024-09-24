;; 9. Design a WebAssembly function using `br_table` to branch to various labels, with one branch leading to a function that imports another module's function. Inspect if the handling of control flow and operand types remains accurate when crossing module boundaries.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32)))
    (func $test
      (block
        (br_table 0 (i32.const 0))
        (i32.const 1)
      )
      (block
        (call $imported)
        (br_table 0 1 (i32.const 2))
      )
    )
  )
  "unknown label"
)
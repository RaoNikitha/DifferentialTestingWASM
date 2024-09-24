;; Test 5: Utilize multiple nested loops with `br` instructions targeting sibling loops. Incorrect resolution will result in invalid branching, demonstrating failed loop reinitialization and operand stack handling.

(assert_invalid
  (module (func $nested-loops-br (result i32)
    (loop (result i32)
      (i32.const 1)
      (loop (result i32)
        (i32.const 2)
        (br 1)
      )
    )
    (i32.const 0)
  ))
  "type mismatch"
)
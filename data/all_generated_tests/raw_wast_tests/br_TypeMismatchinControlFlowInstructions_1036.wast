;; Test 7: Define a block that expects a string output and use br within this block to provide a float operand, testing the operand type management.

(assert_invalid
  (module
    (func $type-arg-string-in-block
      (block (result i32)
        (f64.const 1.0)
        (br 0)
      )
    )
  )
  "type mismatch"
)
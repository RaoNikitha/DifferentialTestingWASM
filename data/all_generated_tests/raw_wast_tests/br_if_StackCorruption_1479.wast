;; Test 10: Create a test with `br_if` instructions that depend on complex conditions evaluated at runtime. The test should verify that conditional branching based on dynamic conditions consistently maintains the correct stack state and operand values.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 5)
        (i32.const 10)
        (i32.sub)
        (br_if 0 (i32.const 1))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
;; - Test Description 5: Write a loop with `br_if` conditions that depend on multiple stack operands via arithmetic comparison (e.g., greater than). Ensure the result of the arithmetic comparison is accurately evaluated to test condition handling in branching.

(assert_invalid
  (module 
    (func $stack-operand-test (result i32)
      (i32.const 5)
      (i32.const 10)
      (loop (result i32)
        (i32.const 3)
        (i32.gt_s)
        (br_if 0)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
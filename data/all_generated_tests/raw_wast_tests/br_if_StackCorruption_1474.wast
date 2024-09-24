;; Test 5: Generate a test involving nested loops where `br_if` targets an inner loop or blocks conditionally. Check for stack integrity when branching back to loop headers and ensure no operand mismatch occurs.

(assert_invalid
  (module
    (func $nested-loops (result i32)
      (loop (result i32)
        (loop (result i32)
          (br_if 1 (i32.const 1) (br_if 0 (i32.const 0) (i32.const 2)))
          (i32.const 3)
        )
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)
;; 6. Construct an `if` block where the `then` branch includes nested loops, and ensure that the control flow exits to the correct loop scope when using a `br_table`.    - **Constraint**: Nested rules for control instructions need to match the expected scope.    - **Behavior**: If the depth is calculated incorrectly, control flow might jump incorrectly.

(assert_invalid
  (module 
    (func $test 
      (block $outer
        (loop $inner
          (if (result i32) (i32.const 1)
            (then (br_table 1 0) (i32.const 0))
            (else (i32.const 1))
          )
        )
      )
    )
  )
  "depth mismatch"
)
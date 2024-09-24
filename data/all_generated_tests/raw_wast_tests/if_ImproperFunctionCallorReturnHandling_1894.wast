;; 5. **Test Function Return Values across Nested if Statements**:    Create deep-nested `if` statements where each level involves a function call that returns different stack states. Ensure that function return values are properly handled across multiple `if` conditions.

(assert_invalid
  (module
    (func $nested-if-function-returns
      (i32.const 1)
      (if (result i32)
        (then
          (if (result i32)
            (then (f32.const 1))
            (else (f32.const 0))
          )
        )
        (else
          (if (result i32)
            (then (f32.const 0))
            (else (f32.const 1))
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)
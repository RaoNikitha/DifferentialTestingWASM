;; 7. Build an `if` block that includes re-entering another `if` statement from within an `else` branch and verify correct nesting with matching `end` instructions.    - **Constraint**: Nested `if-else` blocks should validate properly.    - **Behavior**: Mismanagement could lead to control jumping beyond the intended scope.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then) 
        (else
          (if (i32.const 1)
            (then)
            (else)
          )
        )
      )
    )
  )
  "type mismatch"
)
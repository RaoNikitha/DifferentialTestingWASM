;; 10. **Test Description**: Design an `if` block followed by another `if` block, where the second condition relies on the first block’s result. This verifies nested conditional evaluations and proper stack management when switching between branches.

(assert_invalid
  (module 
    (func $nested-if (result i32)
      (if (result i32) (i32.const 1)
        (then 
          (if (result i32) (i32.const 0) (then (i32.const 2)) (else (i32.const 3)))
        )
        (else 
          (i32.const 4)
        )
      )
    )
  )
  "type mismatch"
)
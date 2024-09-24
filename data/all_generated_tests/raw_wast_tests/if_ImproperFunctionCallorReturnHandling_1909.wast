;; 10. **Improper Context Handling in Nested `if` within Function Call**:    - Nested `if` block within a function, with improper context extension leading to label mismatches.    - Verify if label indexing and context extensions are properly handled to avoid incorrect function returns.

(assert_invalid
  (module 
    (func $improper-context-handling
      (call $nested-if
        (if (result i32)
          (i32.const 1)
          (then (call $someFunction (i32.const 1)))
          (else (if (result i32) (i32.const 0) (then) (else (i32.const 0))))
        )
      )
    )
    (func $nested-if (param i32) (result i32)
      (if (result i32) (local.get 0) (then (i32.const 1)) (else (i32.const 0)))
    )
    (func $someFunction (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)
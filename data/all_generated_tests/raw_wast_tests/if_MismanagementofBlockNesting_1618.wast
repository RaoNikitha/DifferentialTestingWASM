;; 9. **Test for `call` Instruction within Nested `if`**: Invoke `call` instructions within nested `if` blocks. Verify if control resumes correctly post-execution of the `call` and the call's stack effects are manageable.

(assert_invalid
  (module (func $nested-call-if (result i32)
    (if (result i32) (i32.const 1)
      (then (call $dummy) (i32.const 0))
      (else (if (result i32) (i32.const 1)
        (then (call $dummy) (i32.const 0))
        (else (i32.const 1))
      ))
    )
  ))
  "type mismatch"
)
(func $dummy (result i32) (i32.const 42))
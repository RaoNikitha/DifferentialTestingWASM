;; 3. **Test Stack Unwinding with Unused `br_if`**:    Create a loop where `br_if` uses an unaltered stack value that always evaluates false, testing if it results in an infinite loop.

(assert_invalid
  (module
    (func $test-unwind-if (result i32)
      (i32.const 1)
      (loop (result i32)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)
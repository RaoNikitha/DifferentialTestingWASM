;; 3. **Test 3**: Create a structured control flow with `if-else` constructs, where the `else` branch has an `br_if` instruction that conditionally branches to `unreachable`. Push a zero value, ensuring the else branch does not execute the `unreachable`, and then confirm normal execution flow continues.

(assert_invalid
  (module
    (func $test (i32.const 0)
      (if (result i32)
        (i32.const 1)
        (then unreachable)
        (else (br_if 1 (i32.const 1)))
      )
      drop
    )
  )
  "unknown label"
)
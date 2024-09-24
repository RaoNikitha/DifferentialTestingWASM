;; 5. Create a function that includes a `nop`, followed by a nested function call. Confirm that the nested function call executes properly and returns the correct value, ensuring that the `nop` does not disrupt the nested call or return sequence.

(assert_invalid
  (module
    (func $nested-call (result i32) (i32.const 42))
    (func $test (result i32)
      nop
      call $nested-call
    )
  )
  "type mismatch"
)
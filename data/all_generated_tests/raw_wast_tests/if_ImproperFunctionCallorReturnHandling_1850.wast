;; 1. A test where the `then` block of an `if` instruction immediately calls a function that has a mismatched return type with the expected block return type, while the `else` block has an `unreachable` instruction. The test checks whether the improper return type from the function call is caught correctly in both implementations.

(assert_invalid
  (module
    (func $mismatched-return (result f64)
      (f64.const 3.14)
    )
    (func $test-function (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call $mismatched-return)
        )
        (else
          unreachable
        )
      )
    )
  )
  "type mismatch"
)
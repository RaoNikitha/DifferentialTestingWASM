;; Test 1: Create a function with an early return that bypasses a block containing an `unreachable` instruction. Ensure that the return causes the stack polymorphism to skip the `unreachable` instruction by validating proper stack unwinding during the return.

(assert_invalid
  (module
    (func $early-return-bypass (result i32)
      (i32.const 42)
      (block
        (unreachable)
        (return)
      )
    )
  )
  "type mismatch"
)
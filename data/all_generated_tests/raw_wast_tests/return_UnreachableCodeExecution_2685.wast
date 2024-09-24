;; Test 4: Implement a function as a sequence of operations where the `return` statement correctly captures and unwinds any additional stack values before an `unreachable` instruction, confirming the stack frame consistency.

(assert_invalid
  (module
    (func $return-unwind-before-unreachable (result i32)
      (i32.const 1)
      (i32.const 2)
      (return)
      (unreachable)
    )
  )
  "type mismatch"
)
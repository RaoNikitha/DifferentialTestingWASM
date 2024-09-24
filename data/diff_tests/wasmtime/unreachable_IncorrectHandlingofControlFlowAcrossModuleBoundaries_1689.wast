;; 10. Test a function exported from one module, containing a block that uses the `unreachable` instruction. Call this function from another module and ensure the trap results in a consistent and well-defined behavior without stack corruption or control flow errors.

(assert_invalid
  (module
    (import "mod2" "func2" (func $func2))
    (func $test
      (block
        (call $func2)
        (unreachable)
      )
    )
  )
  "type mismatch"
)
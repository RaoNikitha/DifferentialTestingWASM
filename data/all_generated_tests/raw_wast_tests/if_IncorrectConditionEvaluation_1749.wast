;; 10. Test an `if` instruction with a `br_if` condition based on stack values being popped during the condition check. Ensure correct evaluation and stack integrity after branching. This verifies condition evaluation correctness with stack operations.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (i32.const 1)
        (i32.const 0)
        (if (result i32)
          (then (br_if 0 (i32.const 1)) (i32.const 1))
          (else (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)
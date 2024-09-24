;; 8. **Test 8**: Test with a series of `if` and `else` blocks where `br_if` instructions branch to the beginning of the `if-else` structure. Place an `unreachable` instruction within the `else` block to see if incorrect branching logic allows execution of the `unreachable`.

(assert_invalid
  (module
    (func $test_if_else_br_if (result i32)
      (block (result i32)
        (if (result i32)
          (br_if 0 (i32.const 1))
          (then (i32.const 2))
          (else (unreachable))
        )
      )
    )
  )
  "type mismatch"
)
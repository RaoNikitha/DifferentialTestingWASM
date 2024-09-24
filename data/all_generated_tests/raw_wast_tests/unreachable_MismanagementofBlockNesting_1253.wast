;; 4. **Test 4:** Develop a series of nested `if` statements where each `else` branch contains an `unreachable` instruction, with a `br_table` managing jumps across these statements:    - **Check:** Examine that each `unreachable` in `else` correctly traps and that `br_table` manages control flow correctly.    - **Constraint:** Checks if `unreachable` in `else` blocks is properly handled by both implementations.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then)
        (else (unreachable))
      )
      (if (i32.const 0)
        (then)
        (else (unreachable))
      )
      (br_table 0 1 0 (i32.const 0))
    )
  )
  "unreachable instruction in else branch leads to type mismatch"
)
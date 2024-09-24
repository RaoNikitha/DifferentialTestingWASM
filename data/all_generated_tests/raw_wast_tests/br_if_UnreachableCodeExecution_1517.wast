;; 8. **Test 8 - Forward Branch to Unreachable**:    Create a scenario with a `block` where `br_if` attempts to forward branch (break) to a block containing an `unreachable` instruction. Tests label reference validity and execution of unreachable code.

(assert_invalid
  (module (func $forward-branch-unreachable
    (block
      (unreachable)
      (br_if 0 (i32.const 1))
    )
  ))
  "unreachable code"
)
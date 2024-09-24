;; 8. Execute a `nop` followed by a branching instruction that directs control flow to an unreachable block. Ensure the branch does not erroneously execute the `nop` and miss the branching logic.

(assert_invalid
  (module
    (func $test
      (nop)
      (block
        (br 0)
        (unreachable)
      )
    )
  )
  "unreachable executed"
)
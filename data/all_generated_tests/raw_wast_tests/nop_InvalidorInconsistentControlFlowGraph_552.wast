;; 3. **Unreachable Code Following `nop`**:    - Insert unreachable instructions immediately after a `nop` within divergent control paths. Test if the CFG correctly flags the unreachable code without altering the stack or flow.    - Constraint: Ensures `nop` does not cause reachable code issues in complex branching scenarios.

(assert_invalid
  (module
    (func $unreachable-following-nop
      (block
        (nop)
        (unreachable)
      )
    )
  )
  "unreachable code following nop"
)
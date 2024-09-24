;; 9. **Test Description:** Include `unreachable` after a combination of stack-affecting operations (like `tee_local` or `set_local`) followed by control flow constructs. This evaluates how faithfully the CFG respects stack state changes upon trapping.    - **Constraint:** Trap should prevent further stack or control actions.    - **Relation to CFG:** Validates CFG's stack handling consistency upon trapping.

(assert_invalid
  (module (func $type-stack-affecting-ops-unreachable
    (local i32)
    (set_local 0 (i32.const 1))
    (unreachable)
    (block (i32.const 0))
  ))
  "type mismatch"
)
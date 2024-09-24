;; 7. **Loop with Early Exit Using Unreachable Instruction**:    - Implement a loop where an `unreachable` instruction causes an early exit. Verify handling of stack unwinding up to the loop entry.    - **Constraint**: Correctly handle `unreachable` causing stack unwinding within cycles.    - **CFG Check**: Ensure the CFG recognizes `unreachable` paths stopping further instructions' execution.

(assert_invalid
  (module
    (func $loop_with_unreachable
      (i32.const 1)
      (loop (result i32)
        (br_if 1 (i32.eqz (get_local 0)))
        unreachable
      )
      drop
    )
  )
  "stack unwinding with unreachable"
)
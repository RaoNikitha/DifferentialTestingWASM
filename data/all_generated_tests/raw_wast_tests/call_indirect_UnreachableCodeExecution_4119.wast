;; 8. **Branch to Unreachable**:    Use a conditional branch to redirect to `call_indirect` with incorrect type indices, causing the function to default and reach an `unreachable` instruction. This tests branching and type validation under dynamic conditions.

(assert_invalid
  (module
    (func $f1 (param i32))
    (type $sig1 (func (param i32)))
    (table funcref (elem $f1))
    (func $branch-to-unreachable
      (i32.const 0) (i32.const 1)
      (if (result i32)
        (then
          (call_indirect (type $sig1) (i32.const 0))
        )
        (else
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)
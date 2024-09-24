;; 8. **Overlapping Operand Consumption with Unreachable Exit**:    Create a scenario where branching inside a loop consumes specific stack operands, but mismanagement post-branch leads to an `unreachable` instruction.

(assert_invalid
  (module
    (func $overlapping-operand-unreachable
      (i32.const 1)
      (loop (result i32)
        br 1
        unreachable
      )
    )
  )
  "type mismatch"
)
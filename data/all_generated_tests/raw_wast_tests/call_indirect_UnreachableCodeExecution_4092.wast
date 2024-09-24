;; 1. **Test: Unreachable Function Call with Mismatched Type Index**     - Description: Define a function table with functions of varying signatures and ensure one entry is a deliberate type mismatch. Use the `call_indirect` instruction to invoke this function with a mismatched type index and expect an unreachable instruction to be triggered if the type check fails.    - Constraint: Function type mismatch with `typeidx` leads to a trap.    - Unreachable Execution: Reaching `unreachable` due to improper type indexing should trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32) (i32.const 0))
    (func $unreachable-call
      (call_indirect (type 1) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
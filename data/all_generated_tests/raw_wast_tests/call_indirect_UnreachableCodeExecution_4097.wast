;; 6. **Test: Multiple Function Signatures with Incorrect Type Indexing**    - Description: Construct a table with multiple functions having different signatures. Use the `call_indirect` instruction with an invalid alternate signature reference, resulting in a mandatory type check failure and hence hitting the `unreachable` instruction.    - Constraint: Function signature mismatch triggers a trap.    - Unreachable Execution: Gaps in type matching lead to accidental triggering of `unreachable`.

(assert_invalid
  (module
    (type $sig1 (func (param i32 i32) (result i32)))
    (type $sig2 (func (param f32) (result f32)))
    (func $f1 (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1)))
    (func $f2 (param f32) (result f32)
      (local.get 0))
    (table funcref (elem $f1 $f2))
    (func $test
      (call_indirect (type $sig1) (i32.const 1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
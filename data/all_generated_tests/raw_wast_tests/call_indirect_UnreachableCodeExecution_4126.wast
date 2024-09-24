;; 5. **Mismatched Return Types Ending in Unreachable**:    - Call a function through `call_indirect` that has a mismatched return type, ensuring a trap occurs and the code subsequently reaches the `unreachable` instruction.    - This checks dynamic return type handling and confirms correct trapping mechanisms which direct to unreachable paths.

(assert_invalid
  (module
    (func $f (param i32) (result i32))
    (type $sig (func (param i32) (result f32)))
    (table funcref (elem $f))
    (func $mismatched-return
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
      (unreachable)
    )
  )
  "type mismatch"
)
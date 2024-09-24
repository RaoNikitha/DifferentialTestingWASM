;; 9. **Test Description:**    Create a test case where `call_indirect` directs to a function featuring an immediate `br` instruction at the beginning of the execution. Validate that the branch leads to the correct label and that the stack integrity is maintained correctly throughout the jump.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $target (param i32) (result i32)
      (br 0)
      (i32.const 42)
    )
    (table funcref (elem $target))
    (func $test (param i32) (result i32)
      (call_indirect (type $sig) (i32.const 0) (local.get 0))
    )
  )
  "type mismatch"
)
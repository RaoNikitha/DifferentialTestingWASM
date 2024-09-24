;; 7. **Test Description**: Create a scenario where an `if` statement uses `call_indirect` based on conditionally changing indices. One branch has a valid index, while the other branch has an invalid one. Verify that the invalid branch triggers a trap and control flow correctly resolves to the error handling block.

(assert_invalid
  (module
    (func $f (param i32) (result i32) (i32.const 0))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $conditional-call
      (param i32) (result i32)
      (local i32)
      (local.set 1 (local.get 0))
      (if (result i32)
        (i32.eq (local.get 1) (i32.const 1))
        (then (call_indirect (type $sig) (i32.const 0) (i32.const 0)))
        (else (call_indirect (type $sig) (i32.const 0) (i32.const 100)))
      )
    )
  )
  "type mismatch"
)
;; 6. **Test Description**:    - Develop a case where `br_if` operates conditionally around different types of tables specified to `call_indirect`, ensuring the branch properly evaluates compatibility and enforces the funcref requirement.

(assert_invalid
  (module
    (func $f1 (param i32) (result i32))
    (type $sig1 (func (param i32) (result i32)))
    (table funcref (elem $f1))
    (func $test
      (local $cond i32)
      (local.set $cond (i32.const 1))
      (block
        (br_if 0 (local.get $cond))
        (call_indirect (type $sig1) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
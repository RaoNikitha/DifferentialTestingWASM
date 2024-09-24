;; 10. Evaluate whether incorrect conditional branching (`br_if`) due to a failed dynamic function type check within `call_indirect` leads to unexpected control flow paths or non-standard behavior across implementations.

(assert_invalid
  (module
    (type (func (param i32) (param i32)))
    (type $expected (func (param i32) (result i32)))
    (table funcref (elem $type-func \param \param i32))
    (func $branch-check
      (call_indirect (type $expected) (i32.const 0) (i32.const 1) (i32.const 2))
      (br_if 0 (i32.const 1))
    )
  )
  "type mismatch"
)
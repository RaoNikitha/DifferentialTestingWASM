;; 5. **Exact Function Type Match with Correct Table Index**:    - Test a `call_indirect` instruction with a correct table entry and a suitable function type to be called.    - Checks for: Accurate dynamic type checking, stack use, and control flow branching as per the signature requirements.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $correct-func (param i32) (result i32)
      (local.get 0)
    )
    (elem (i32.const 0) $correct-func)
    (func $test-func
      (call_indirect (type $sig) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)
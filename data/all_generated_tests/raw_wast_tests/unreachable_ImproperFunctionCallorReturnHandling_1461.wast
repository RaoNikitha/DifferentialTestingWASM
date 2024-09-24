;; 2. **Test Description:**    - Execute `call_indirect` to a function index that leads to `unreachable` and validate if the correct trap behavior is observed.    - This test investigates if `call_indirect` correctly handles type checking and indirect table lookup to trap as intended.

(assert_invalid
  (module
    (type $sig (func (result f32)))
    (table funcref (elem 1))
    (func (result i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)
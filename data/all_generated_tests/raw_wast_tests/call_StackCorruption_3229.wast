;; 8. Test edge cases where functions have optional or default parameters, especially when not all parameters are provided. Verify if stack operations correctly handle missing parameters without causing corruption.

(assert_invalid
  (module
    (type $t (func (param i32 i32) (result i32)))
    (func $f (type $t)
      (call $f (i32.const 1))
    )
  )
  "type mismatch"
)
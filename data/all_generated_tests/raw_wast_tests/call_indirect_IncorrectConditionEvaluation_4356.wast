;; 5. **Test Description**: Utilize a `call_indirect` with a function that modifies a global variable, followed by `br_if` to conditionally branch based on the global's value.      **Specific Constraint**: Correctly handling side effects such as global variable modification.      **Incorrect Condition Evaluation**: Check if `br_if` properly evaluates condition based on side effects.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (type $sig (func (result i32)))
    (func $modify_global
      (global.set $g (i32.const 1))
      (global.get $g)
    )
    (table funcref (elem $modify_global))
    (func $test 
      (call_indirect (type $sig) (i32.const 0))
      (global.get $g)
      (br_if 0 (i32.const 0))
    )
  )
  "type mismatch"
)
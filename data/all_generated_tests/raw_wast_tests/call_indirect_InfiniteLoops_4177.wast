;; 6. **Test Description**: Set up a test with a loop where `call_indirect` function calls a function that manipulates a global variable. The loop relies on this global variable for the `br_if` condition to exit.    - **Constraint Being Checked**: Correct global variable manipulation and consistency across indirect calls.    - **Relation to Infinite Loops**: Improper handling of global variables in differential implementations leading to infinite loops if the condition is permanently unsatisfied.

(assert_invalid
  (module
    (type (func (param) (result i32)))
    (global $g (mut i32) (i32.const 0))
    (table 1 funcref)
    (elem (i32.const 0) $inc-global)
    (func $inc-global
      (global.set $g
        (i32.add (global.get $g) (i32.const 1))
      )
      (i32.const 0)
    )
    (func $loop
      (loop $label
        (call_indirect (type 0) (i32.const 0))
        (br_if $label (i32.lt (global.get $g) (i32.const 5)))
      )
    )
  )
  "type mismatch"
)
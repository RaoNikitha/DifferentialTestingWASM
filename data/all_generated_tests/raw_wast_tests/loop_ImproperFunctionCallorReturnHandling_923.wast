;; 4. **Test Case**: Construct a loop where an inner function modifies global variables, and the loop relies on these globals between function calls.    - **Constraint Check**: Ensure that global variable modifications within functions are consistently used in the loop.    - **Improper Function Call or Return Handling**: Incorrect context application of global variables after function execution within loops.

(assert_invalid
  (module
    (global $g1 (mut i32) (i32.const 0))
    (func $modify_global
      (global.set $g1 (i32.add (global.get $g1) (i32.const 1)))
    )
    (func (result i32)
      (loop $loop
        (call $modify_global)
        (global.get $g1)
        (i32.const 10)
        (i32.ge_s)
        (br_if $loop)
        (global.get $g1)
      )
    )
  )
  "type mismatch"
)
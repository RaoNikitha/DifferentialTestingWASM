;; 3. Define an `if` block that relies on an imported function to update a global variable. Check the consistency of the global variable's value before and after the function call, as control flows through the `if` block.

(assert_invalid
  (module 
    (import "env" "external_func" (func $external_func (result i32)))
    (global $glob (mut i32) (i32.const 0))
    (func $test_if_global_update
      (if (result i32)
        (external_func)
        (then 
          (global.set $glob (i32.const 10))
          (global.get $glob)
        )
        (else
          (global.set $glob (i32.const 20))
          (global.get $glob)
        )
      )
    )
  )
  "type mismatch"
)
;; Test 9: Test a loop that conditionally calls a function based on a stack value. The function modifies the value and returns it to the stack. Ensure the value correctly influences the loop's exit condition, preventing the loop from running forever due to improper type or stack handling.

(assert_invalid
  (module
    (func $loop_test
      (local $cond i32)
      (i32.const 10) ;; Initial loop counter
      (loop $label
        (local.set $cond) ;; Store counter value
        (call $mod_func) ;; Call function to modify value
        (local.get $cond)
        (br_if $label (i32.eqz)) ;; Break if counter reaches zero
      )
    )
    (func $mod_func (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.sub)
      (return)
    )
  )
  "type mismatch"
)
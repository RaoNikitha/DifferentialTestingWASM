;; 8. **Test Description**:    Formulate a scenario where a function containing a loop calls another function by index. Ensure the called function contains a `br_if` that should exit the loop based on an argument. Test should reveal infinite loop if argument type mismatch occurs.

(assert_invalid
  (module
    (func $loop_with_call (param i32)
      (local i32)
      loop
        get_local 0
        call 1
        br_if 0
      end
    )
    (func (param f64))
  )
  "type mismatch"
)
;; 5. **Test Infinite Loop due to Failed Dynamic Type Check**:    Implement a function called indirectly which has a deliberately incorrect dynamic type check within a loop. If the dynamic check fails without trapping, the loop will never exit.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $infinite_loop
      (loop $label
        (call_indirect (type $sig) (i32.const 0))
        (br $label)
      )
    )
    (table 1 funcref)
  )
  "type mismatch"
)
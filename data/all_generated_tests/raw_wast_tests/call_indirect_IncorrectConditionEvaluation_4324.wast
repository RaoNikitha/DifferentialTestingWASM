;; 3. **Test 3**: Pass fewer arguments on the operand stack than required by the function signature in the `call_indirect` instruction. Analyze how each implementation handles the resulting stack underflow. OCaml might trap, while Java might produce a stack error differently.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 1 funcref)
    (func $test-stack-underflow
      (call_indirect (type 0) (i32.const 0) (i32.const 10))
    )
  )
  "type mismatch"
)
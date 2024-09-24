;; 7. **Test Description**:    Create functions with correct signatures but incorrect stack management that call each other within a loop. Confirm the infinite loop presence due to improper operand stack consumption and return value pushing.

(assert_invalid
  (module
    (func $infinite-loop
      (loop $label
        (call 1)
        (br $label)
      )
    )
    (func (param i32) (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)
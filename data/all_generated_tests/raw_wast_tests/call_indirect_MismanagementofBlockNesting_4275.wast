;; 4. **Indirect call on looping construct experiencing stack underflow**:    - **Description**: Implement an indirect call inside a nested loop where the operand stack does not sufficiently match the function signature requirements, ensuring underflow conditions are checked.    - **Expected outcome**: Check that both implementations trap correctly due to insufficient operands on the stack, demonstrating proper stack management within nested structures.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (table funcref (elem $func_empty))
    (func $func_empty)
    (func $indirect_call_in_loop
      (block
        (loop
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
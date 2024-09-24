;; 9. **Test Description**: Mix direct calls and indirect function calls via function tables.    - **Constraint**: Tests the robustness in handling direct vs. indirect invocation methods.    - **Relation to Stack Corruption**: Validates that both calling methods maintain stack consistency without corrupting the operand stack.

(assert_invalid
  (module
    (type $t0 (func))
    (type $t1 (func (param i32) (result i32)))
    (table 1 funcref)
    (func $f0 (result i32)
      (call_indirect (type $t1) (i32.const 0))
    )
    (func (type $t0))
    (func (param i32) (result i32)
      (call 0)
    )
  )
  "type mismatch"
)
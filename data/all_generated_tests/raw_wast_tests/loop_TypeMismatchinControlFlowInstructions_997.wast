;; 8. **Manipulated Operand Stack Height with Type Inconsistencies**:    - Performing operations that alternately push and pop mismatching types to/from the operand stack within a loop.    - Tests proper dynamic type-checking against stack height derivations during loop execution.    - Specific Constraint: Validation of type consistency in dynamically managed operand stacks.

(assert_invalid
  (module (func $manipulated-operand-stack-height
    (block (loop (result i32)
      (i32.const 42)
      (br 0)
      (drop)
      (f32.const 3.14) 
    ))
  ))
  "type mismatch"
)
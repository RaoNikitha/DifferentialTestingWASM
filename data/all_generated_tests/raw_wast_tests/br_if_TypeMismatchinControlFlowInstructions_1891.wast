;; 2. **Type Mismatch in Block Output**:    - **Description**: Create a `br_if` that conditionally targets a block, where the block is defined to output an `f64` value, but `br_if` attempts to provide an `i32`.    - **Constraint**: Ensures block output types are correctly handled and checked.    - **Differential Behavior**: WASM enforces strict type rules, wizard_engine might allow incorrect type pushing to the operand stack.

(assert_invalid
  (module (func
    (block (result f64) (br_if 0 (i32.const 1) (i32.const 0)))
  ))
  "type mismatch"
)
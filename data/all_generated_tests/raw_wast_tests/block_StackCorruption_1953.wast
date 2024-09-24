;; 4. **Unbalanced Stack Operations**: Execute a block that consumes two values but produces only one. Follow with another instruction expecting the stack to have the wrong number of values and check for stack underflow.

(assert_invalid
  (module (func $unbalanced-stack
    (block (param i32 i32) (result i32) (i32.add) (drop))
    (i32.const 1)
  ))
  "type mismatch"
)
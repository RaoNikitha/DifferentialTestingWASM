;; 2. **Test Description**: Define a nested `block` where the inner block attempts to pop more elements from the operand stack than are available, ensuring stack underflow is checked within nested blocks.    - **Constraint Checked**: Ensures nested blocks correctly manage stack depths and handle stack underflow conditions.    - **Relation to Stack Corruption**: Improper handling may result in corrupted stack state propagation outside the innermost block, affecting subsequent instructions.

(assert_invalid
  (module
    (func $stack-underflow-in-nested-blocks
      (block (result i32)
        (i32.const 10)
        (block
          (drop)
          (drop) 
        )
      )
    )
  )
  "type mismatch"
)
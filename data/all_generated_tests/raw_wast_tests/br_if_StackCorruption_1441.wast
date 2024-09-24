;; 2. **Deeply Nested Blocks with Stack Check**:    - **Description**: Create a deeply nested series of `block` instructions, with a `br_if` targeting an outer block and manipulating the operand stack. Ensure the stack is appropriately reset when the branch is taken.    - **Constraint Checked**: Validation of correct operand stack unwinding through several nested blocks.    - **Relation to Stack Corruption**: Ensures that the deep nesting and stack unwinding do not corrupt stack state.

(assert_invalid
 (module
  (func $deep-nested-br_if
   (block
    (block
     (block
      (br_if 2 (i32.const 1) (i32.const 0) (i32.const 42)))))))
 "type mismatch")
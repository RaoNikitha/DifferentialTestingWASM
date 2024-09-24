;; 8. **Test Description**: Define a `block` where the instruction set inside the block pushes more elements onto the stack than the block’s `blocktype` specifies as output.    - **Constraint Checked**: Checks for correct enforcement of block type's output arity regarding stack state.    - **Relation to Stack Corruption**: Over-pushing elements can pollute the stack with unwanted values, leading to stack overflow or corruption outside the block scope.

(assert_invalid
  (module (func $excessive-push-block (result i32)
    (block (result i32) (i32.const 1) (i32.const 2) (i32.add))
  ))
  "type mismatch"
)
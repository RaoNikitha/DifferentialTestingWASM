;; 2. **Test Case: Conditional Branch within Nested Blocks**    - **Test Description**: Construct nested blocks where an inner block contains a `br_if` that conditionally jumps to the outer block. Verify correct stack state before and after branching by balancing the operand stack size properly.    - **Constraint**: Ensures proper conditional branching behavior and accurate stack unwinding if the condition is met.    - **Relation to Mismanagement**: Mismanagement would result in incorrect branch targets and improper stack state transitions.

(assert_invalid
 (module
  (func $conditional-branch-nested-blocks
   (block (result i32)
    (i32.const 1)
    (block (result i32)
     (i32.const 2)
     (br_if 1 (i32.const 0))
     (i32.add)
    )
   )
  )
 )
 "type mismatch"
)
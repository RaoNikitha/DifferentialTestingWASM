;; 1. **Test Description**: Create a block that expects a single i32 input and produces a single i32 output. Inside the block, include more instructions than necessary such that some of them operate on an uninitialized stack.    - **Constraint**: This checks the proper stack management when entering and exiting a block.    - **Relation to Stack Corruption**: Improper handling will cause the stack to contain uninitialized values or mismanage the stack height.

(assert_invalid
  (module
    (func $test-stack-management (param i32) (result i32)
      ;; (block (result i32) 
      (block (param i32) (result i32)
        ;; i32 is already on stack from param
        ;; More instructions than necessary to check proper stack management 
        i32.const 1 
        i32.add 
        i32.const 2 
        i32.add
      )
    )
  )
  "type mismatch"
)
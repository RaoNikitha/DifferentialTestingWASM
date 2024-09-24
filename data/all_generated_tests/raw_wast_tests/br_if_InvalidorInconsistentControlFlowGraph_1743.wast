;; 4. **Test Description: Forward Branching with Stack Mismatch**    - Create a `block` structure and a `br_if` targeting the block but with a mismatch in the expected stack operands.    - **Constraint Check**: Validate operands consumed by forward branches follow the block’s output type.    - **CFG Relevance**: Ensures forward branching respects the block’s operand requirements in CFG.

(assert_invalid
  (module
    (func $forward-branch-stack-mismatch
      (block (result i32)
        (i32.const 10) (f32.const 5.0)
        (br_if 0) 
      )
    )
  )
  "type mismatch"
)
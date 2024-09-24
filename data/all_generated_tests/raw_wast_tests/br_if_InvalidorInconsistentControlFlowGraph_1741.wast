;; 2. **Test Description: Unreachable Code After Conditional Branch**    - Simulate a `br_if` instruction followed by unreachable instructions due to a branching logic that never executes.    - **Constraint Check**: Ensure the stack is appropriately adjusted even if the branch makes the following code unreachable.    - **CFG Relevance**: Verifies the ability to handle unreachable code paths within the CFG.

(assert_invalid
  (module
    (func $unreachable-code-after-br_if
      (block (br_if 0 (i32.const 1)) (i32.add (i32.const 1) (i32.const 2)))
    )
  )
  "unreachable code"
)
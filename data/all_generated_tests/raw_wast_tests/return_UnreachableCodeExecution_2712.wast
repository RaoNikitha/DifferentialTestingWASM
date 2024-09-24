;; 1. **Test Scenario**: Create a function that returns a value from a nested block, with an unreachable instruction placed after the return statement in the outer block.    **Constraint**: Ensures `return` correctly unwinds the stack to the outermost block.    **Unreachable Code**: Confirm if control reaches after `return` unexpectedly.

(assert_invalid
 (module
  (func $nested-return-unreachable (result i32)
   (block
    (block
     (return (i32.const 42))
    )
    unreachable
   )
  )
 "type mismatch"
)
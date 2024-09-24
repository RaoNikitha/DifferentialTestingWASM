;; 1. **Test Description**:     Create a function with multiple `nop` instructions interleaved between different `push` operations that manipulate the stack. Validate that the state of the stack remains consistent before and after the `nop` operations.    **Constraint**: Ensures `nop` does not affect the stack.    **Reasoning**: This checks if `nop` accidentally interacts with stack operations by verifying stack consistency.

 ;; (module
  (func $stack-consistency
    (i32.const 1)
    nop
    (i32.const 2)
    nop
    (i32.add)
    nop
    (drop)
  )
)
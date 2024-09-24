;; 1. **Test: Incorrect Operand Stack Manipulation in `else` Block**    - **Description**: Create a WebAssembly module where the `else` block has instructions that manipulate the operand stack incorrectly, such as expecting values that are not on the stack.    - **Constraint Checked**: Ensures proper operand stack management when transitioning into the `else` block.    - **CFG Relevance**: Verifies that the CFG generation accounts for the stack state correctly when diverging into the `else` block.

(assert_invalid
  (module
    (func $incorrect-else-operand
      (if (result i32)
        (i32.const 1)
        (then (i32.const 42))
        (else (i32.add (i32.const 10)))) 
    )
  )
  "type mismatch"
)
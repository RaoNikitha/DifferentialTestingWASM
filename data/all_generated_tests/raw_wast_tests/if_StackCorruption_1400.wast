;; 1. Create an `if` instruction where the `then` block has instructions that leave more values on the stack than specified by the block type. This checks if the control flow correctly unwinds the operand stack after the `then` block execution.

(assert_invalid
  (module (func $invalid-if-stack-mismatch (result i32)
    (if (result i32) (i32.const 1) 
      (then (i32.const 1) (i32.const 2)) 
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
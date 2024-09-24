;; 6. **Block with Stack Unwinding Involving a `br` to Outer Block:**    - Create a block with multiple pushes to the stack ending with a `br` instruction targeting an outer block, followed by an `unreachable` instruction.    - Tests if the operand stack is correctly unwound and the `br` avoids unreachable code execution.

(assert_invalid
  (module (func $block-stack-unwinding 
    (block 
      (i32.const 1) 
      (i32.const 2) 
      (block 
        (i32.const 3) 
        (br 1)
        (unreachable)
      ) 
      (drop)
    )
  ))
  "type mismatch"
)
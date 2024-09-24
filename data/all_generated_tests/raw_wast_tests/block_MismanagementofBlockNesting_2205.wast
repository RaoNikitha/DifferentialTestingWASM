;; 6. Formulate nested `block` instructions with a `br_if` targeting the outer `block` while conditionally pushing different values to the stack. Verify if each stack state at the moment of jumping is managed correctly by the targeted block.

(assert_invalid
  (module
    (func $nested_blocks_conditional_stack (result i32)
      (block (result i32)
        (block 
          (br_if 1 (i32.const 10))
          (i32.const 5)
        )
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)
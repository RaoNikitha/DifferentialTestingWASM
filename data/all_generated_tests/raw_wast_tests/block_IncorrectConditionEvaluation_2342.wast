;; 3. Implement a block that starts by pushing i32 0 and i32 1 onto the stack. Use the `br_if` conditional branch with the top stack value to exit the block early. Capture the block’s final stack state to check if the condition is evaluated correctly.

(assert_invalid
  (module
    (func (result i32 i32)
      (block (result i32 i32)
        (i32.const 0)
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (i32.const 2) 
      )
    )
  )
  "type mismatch"
)
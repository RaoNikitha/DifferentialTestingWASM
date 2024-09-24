;; 5. Implement a test where a loop performs a series of instructions that modify the stack height (e.g., `push`/`pop` operations), followed by a `br` branch. Validate that branching to the loop’s start correctly manages the stack’s height and content.

(assert_invalid
  (module (func (result i32) 
    (i32.const 0) 
    (loop (result i32) 
      (i32.const 1) 
      (drop) 
      (i32.const 2) 
      (br 0)
    )
  ))
  "type mismatch"
)
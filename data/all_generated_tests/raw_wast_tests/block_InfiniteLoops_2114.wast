;; 5. **Test 5: Loop with Stack Depth Manipulation**    - A `block` containing a loop increments a counter on the stack and uses `br` to jump out of the loop based on the counter's value.    - Focuses on ensuring stack depth consistency during loop execution to prevent unintentional infinite loops.

(assert_invalid
  (module (func $loop-stack-depth (result i32)
    (block (result i32) 
      (loop (result i32) 
        (i32.const 0) 
        (br_if 1 (i32.const 1))
        (i32.const 1)
      )
    )
  ))
  "type mismatch"
)
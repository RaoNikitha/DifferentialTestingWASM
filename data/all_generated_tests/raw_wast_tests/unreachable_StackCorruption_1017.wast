;; 8. **Test: Loop with Unreachable and Stack Operations**    - Combine `loop` with stack operations such as `i32.load`, `i32.store` which follow `unreachable`.    - **Stack Corruption Check:** This checks if memory manipulation instruction post-unreachable maintains the stack correctly.

(assert_invalid
 (module (memory 1)
  (func (loop
   (unreachable)
   (i32.const 0)
   (i32.const 1)
   (i32.store)
  ))
 )
 "type mismatch"
)
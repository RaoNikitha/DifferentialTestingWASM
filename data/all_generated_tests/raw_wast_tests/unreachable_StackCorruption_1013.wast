;; 4. **Test: Tail Calls with Unreachable**    - Make a tail call to a function that contains `unreachable` and ensure subsequent main function instructions are not affecting the stack.    - **Stack Corruption Check:** Ensures tail call does not leave corrupted return addresses or other values on the stack.

(assert_invalid
  (module
    (func $callee
      (unreachable)
    )
    (func $caller
      (call $callee) 
      (i32.const 10)
      (drop)
    )
  )
  "type mismatch"
)
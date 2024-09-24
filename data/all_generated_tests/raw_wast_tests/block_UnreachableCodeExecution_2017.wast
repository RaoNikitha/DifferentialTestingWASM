;; 8. **Test Description**: Design a block where a sequence of instructions manipulates the stack, followed by a `br` instruction targeting an external label that leads to a section of unreachable code. Check if the forward branch bypasses the `unreachable` section correctly.

(assert_invalid
  (module (func $test (result i32)
    (block (result i32)
      (i32.const 42)
      (block 
        (i32.const 1) 
        br 1 
        unreachable)
      (i32.const 0))
    (i32.add)
  ))
  "type mismatch"
)
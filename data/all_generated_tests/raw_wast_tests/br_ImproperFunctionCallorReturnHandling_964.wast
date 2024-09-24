;; 5. **Function Call in a Loop with Backward Branching:**    Implement a function call nested within a `loop` that utilizes a `br` instruction to branch backward. Check if the operand stack is correctly adjusted for the loop to repeatedly call the function without errors.

(assert_invalid
  (module
    (func $test_func (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add)
    (func (param i32) (result i32)
      local.get 0
      loop (result i32)
        call $test_func
        br 0
      end))
  "type mismatch"
)
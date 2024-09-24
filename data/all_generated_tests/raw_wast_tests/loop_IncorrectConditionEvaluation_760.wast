;; - Test Description 1: Create a loop that includes a `br_if` instruction which should only branch if the top operand of the stack is zero. The test will check if condition evaluation of `br_if` correctly handles the zero value to prevent branching.

(assert_invalid
  (module (func $invalid-loop-br_if
    (loop (result i32)
      (i32.const 1)
      (br_if 0 (i32.const 0))
    )
    (i32.const 2)
  ))
  "type mismatch"
)
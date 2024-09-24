;; 1. **Empty Stack Before `if` Execution**:    - **Focus**: Stack underflow before the `if` instruction.    - **Description**: Add an `if` instruction without pushing the required `i32` condition to the stack. This tests if the implementation correctly identifies the missing stack element.

(assert_invalid
  (module (func $empty-stack-before-if (if (result i32) (then (i32.const 0)) (else (i32.const 1))))
  "type mismatch"
)
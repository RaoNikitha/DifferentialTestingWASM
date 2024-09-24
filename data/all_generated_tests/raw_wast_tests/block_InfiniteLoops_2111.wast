;; 2. **Test 2: Deep Nested Loop with Conditional Branch**    - A deeply nested loop structure with multiple `block` and `loop` instructions, each with conditional branches (`br_if`). Evaluates if the correct stack operations pop values properly.    - Ensures `br_if` conditions are met and stack accurately transitions, preventing infinite loops.

(assert_invalid
  (module (func $deep-nested-loop (result i32)
    (block (result i32)
      (loop (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 0 (i32.const 0))  ;; Branch back to innermost enclosing block
            (br 1 (i32.const 1))     ;; Branch to middle block
            (return (i32.const 2))   ;; This should never be reached
          )
          (br_if 1 (i32.const 0))    ;; Branch to outer block
          (br 2 (i32.const 3))       ;; Invalid: exceeds nesting
        )
        (i32.const 4)
      )
    )
  ))
  "type mismatch"
)
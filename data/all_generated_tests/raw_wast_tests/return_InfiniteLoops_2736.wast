;; 5. **Incorrect Stack Transition with Loop and Return**:    Create a function incorporating a loop that performs complex stack operations within each iteration. After the loop completes, include a `return` instruction. The test ensures any discrepancy in stack transition through the loop and `return` does not hinder exiting the function, thus preventing infinite looping.

(assert_invalid
  (module
    (func $incorrect-stack-transition-loop-return
      (result i32)
      (local i32)
      (local.set 0 (i32.const 0))
      (block (loop (block (br_if 1 (i32.const 1)))
              (local.set 0 (i32.add (local.get 0) (i32.const 1)))
              (br 1 (return (local.get 0)))))
    )
  )
  "type mismatch"
)
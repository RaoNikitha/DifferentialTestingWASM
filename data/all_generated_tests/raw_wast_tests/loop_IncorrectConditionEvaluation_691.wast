;; Test a `loop` with a `br_if` instruction that depends on a condition pushed onto the stack. Ensure the condition is always false (e.g., push `0` and use `i32.eqz`). Check that the loop doesn't prematurely branch.

(assert_invalid
  (module (func $incorrect-loop-branch 
    (loop (result i32) 
      i32.const 0 
      br_if 0 
    )
  ))
  "type mismatch"
)
;; 7. Formulate a test where `br_if` should exit a nested loop early based on a condition, but the incorrect evaluation of stack elements affects condition checking, causing the loop to iterate infinitely without breaking.

(assert_invalid
  (module (func $incorrect-br_if-stack-operand (result i32)
    (block (result i32) 
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i64.const 0)) ;; Incorrect condition operand type
        (i32.const 2)
      )
    )
  ))
  "type mismatch"
)
;; Test a `block` inside a loop where the block pushes unexpected types onto the stack and the loop terminates with a `return` expecting different types. This checks for correct type handling across nested control flows.

(assert_invalid
  (module
    (func $type-nested-block-loop-return (result i32)
      (loop
        (block
          (f64.const 0.0)  ;; Adding an unexpected type to the stack
          (return)
        )
      )
    )
  )
  "type mismatch"
)
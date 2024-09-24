;; 1. Create a function with a `br_if` branch inside a loop that depends on a stack condition. Verify that calling `return` in a nested block correctly terminates the outermost function and not just the enclosing loop. If the condition is mis-evaluated, the function might incorrectly continue the loop or terminate early.

(assert_invalid
  (module
    (func $br_if_return_in_loop (result i32)
      (i32.const 0)
      (loop
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (return (i32.const 2))
      )
    )
  )
  "type mismatch"
)
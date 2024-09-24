;; - Create a function with a loop that includes return within a nested block inside the loop. Verify if the return instruction exits the function or if it causes the loop to iterate again incorrectly targeting another block within the loop.

(assert_invalid
  (module
    (func $type-value-loop-nested-block (result i32)
      (loop
        (block
          (i32.const 0)
          (return)
        )
        (i32.const 1) ;; This value should be discarded
      )
    )
  )
  "type mismatch"
)
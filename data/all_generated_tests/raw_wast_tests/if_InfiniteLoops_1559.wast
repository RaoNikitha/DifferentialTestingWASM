;; 10. Create a loop with a conditional `if` that does an incorrect branch on a type mismatch leading to infinite looping due to continual incorrect condition re-evaluation:    ```    (loop $outer      (if (result i32) (i32.const 1)        (then (i32.const 1) (br $outer))      )    )    ```    Ensures type-checking and conditional evaluations within loops correctly branch out, preventing infinite re-execution due to type or condition errors.

(assert_invalid
  (module
    (func $infinite_loop_on_type_mismatch
      (loop $outer
        (if (result i32) (i32.const 1)
          (then (i32.const 1) (br $outer))
        )
      )
    )
  )
  "type mismatch"
)
;; 4. Create a function with consecutive `if` blocks followed by `loop` and another `if` block inside the loop. Use a `br_table` to target different depths of the stack based on a condition checked in the outermost `if` block. This ensures the block depth stack is correctly initialized and reset.

(assert_invalid
  (module 
    (func $test
      (i32.const 1)
      (i32.const 0)
      (if (result i32)
        (then 
          (i32.const 42)
        )
        (else 
          (loop
            (if (result i32)
              (then
                (i32.const 1)
              )
              (else
                (br_table 0 1 (i32.const 0))
              )
            ) 
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)
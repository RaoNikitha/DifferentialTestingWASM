;; Introduce a loop with an internal block that itself contains a nested loop. Use a `br_if` to conditionally move to the start of the inner loop multiple times. WebAssembly should maintain the block context accurately, while Wizard Engine may fail to reset the control stack correctly.

(assert_invalid
  (module 
    (func $test 
      (loop (result i32) 
        (block 
          (loop 
            (br_if 1 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)
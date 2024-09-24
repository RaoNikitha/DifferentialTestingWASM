;; 2. Construct a WebAssembly function with an `if` block inside a loop, where the `else` branch contains another `if` block. The `then` branch of the nested `if` uses `br` to break to the outermost loop. This tests if the implementation properly handles the label context and branching out of deeply nested structures.

(assert_invalid
  (module
    (func $nested-if-loop (result i32)
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (then 
            (i32.const 42)
          )
          (else
            (if (result i32) 
              (i32.const 0) 
              (then 
                (br 1)
              )
              (else 
                (i32.const 0) 
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 1. Test nested `if` instructions where the inner `if` block has an `else` but the outer does not. Verify that jumping out of the inner block correctly resumes execution in the outer block. ```wasm (block   (if     (i32.const 1)     (if (i32.const 0) (then (unreachable)) (else (nop)))   ) ) ```

(assert_invalid
  (module
    (block
      (if
        (result i32)
        (i32.const 1)
        (then
          (if (result i32) 
            (i32.const 0) 
            (then (unreachable)) 
            (else (nop))
          )
        )
      )
    )
  )
  "type mismatch"
)
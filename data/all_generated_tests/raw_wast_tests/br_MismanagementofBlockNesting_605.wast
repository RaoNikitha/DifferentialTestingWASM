;; 6. Test Description: **Complex Nesting with Breaking and Continuing Loops**    - Design a deeply nested structure where `br` both breaks out of intermediate loops and continues inner loops based on conditions. Check if control flow jumps to the correct block or loop start.    - Constraint: Checks mixed `break` and `continue` behaviors in nested contexts.

(assert_invalid
  (module
    (func $complex-nesting-with-br 
      (loop (br 1)) 
      (block 
        (loop 
          (br 1 (i32.const 1))
          (br 0 (i32.const 2)) 
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)
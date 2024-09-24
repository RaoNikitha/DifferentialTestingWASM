;; 9. **Test Description:**    Implementing a chained loop structure where multiple loops call each other recursively, with the outermost loop expecting a final return type that mismatches the chain's cumulative result. This test uncovers issues in recursive function call handling inside loops.

(assert_invalid
  (module
    (func $chained-loops
      (block (result i32)
        (loop $outer (result i32)
          (loop $middle (result i32)
            (loop $inner (result i32) 
              (i32.const 0)
              (br $inner)
            )
            (drop)
            (i32.const 1)
            (br $middle)
          )
          (drop)
          (i32.const 2)
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)
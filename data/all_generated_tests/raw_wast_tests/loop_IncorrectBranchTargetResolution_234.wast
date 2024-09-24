;; 5. Create a `loop` with conditional branching where backward branches target different iteration points. Ensure correct label resolution for the `br` and `br_if` instructions.

(assert_invalid 
  (module 
    (func $loop-label-resolution 
      (local i32)
      (i32.const 5)
      (loop $loop1 (result i32) 
        (local.set 0)
        (br_if 1 (i32.const 1)) 
        (i32.const 2)
        (br $loop1))
      (drop)
    )
  )
  "type mismatch"
)
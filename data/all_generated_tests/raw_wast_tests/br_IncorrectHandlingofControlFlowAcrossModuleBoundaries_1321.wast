;; 2. Evaluate a block containing multiple nested loops with `br` instructions that exit to different levels, combined with calls to imported functions that should maintain correct stack depths.

(assert_invalid
  (module 
    (func $nested_br (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (loop (result i32)
            local.get 0
            br 2
          )
          i32.const 1
          br 1
        )
        i32.const 0
      )
    )
    (func $caller (result i32)
      i32.const 42
      call $nested_br
    )
  )
  "type mismatch"
)
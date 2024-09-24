;; A `block` that uses multiple `br` and `br_if` instructions to jump out of the block with varying stack depths to test if the stack unwinds correctly.

(assert_invalid
  (module (func $br-depth-varied-stack
    (block (result i32) 
      (i32.const 42)
      (block 
        (br_if 0 (i32.const 1)) ; should not break
        (br 1 (i64.const 99)) ; mismatched type
      )
      (i32.add)
    )
  ))
  "type mismatch"
)
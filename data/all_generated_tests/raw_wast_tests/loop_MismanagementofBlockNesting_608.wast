;; 9. Design a combination of nested `block` and `loop`, where `block` contains loops, and `loop` contains blocks. Place `br` instructions inside both blocks and loops targeting different levels. Validate correct handling of control flow across complex nesting while maintaining stack consistency.

(assert_invalid
  (module
    (func $test-nested-block-loop
      (block (result i32)
        (i32.const 1)
        (loop (result i32)
          (block
            (i32.const 2)
            (br 1) ;; branch to outer block
            (loop
              (i32.const 3)
              (br 0) ;; continue to inner loop
            )
          )
          (drop)
        )
      )
    )
  )
  "type mismatch"
)
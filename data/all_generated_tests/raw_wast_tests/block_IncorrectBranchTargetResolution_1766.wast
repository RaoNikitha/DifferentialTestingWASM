;; 7. A test including mixed `block` and `loop` constructs with `br` instructions that switch control between blocks and loops. This checks if the label resolution correctly identifies the control type and resolves the correct target.

(assert_invalid
  (module
    (func $mixed-block-loop (result i32)
      (block (result i32)
        (loop (result i32)
          (br 1 (i32.const 42)) 
          (block (result i32)
            (br 0 (i32.const 99))
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
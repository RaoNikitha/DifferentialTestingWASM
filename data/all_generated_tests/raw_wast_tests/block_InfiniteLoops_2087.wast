;; 8. Test a `block` containing multiple `loop` instructions where `br_if` conditions are incorrectly processed by wizard_engine, perpetuating an infinite loop.

(assert_invalid
  (module (func $block-with-multiple-loops
    (block (result i32)
      (i32.const 0)
      (loop (result i32) 
        (i32.const 1)
        (br_if 1)
        (i32.const 2)
      )
      (loop (result i32)
        (i32.const 3)
        (br_if 1)
        (i32.const 4)
      )
    )
  ))
  "type mismatch"
)
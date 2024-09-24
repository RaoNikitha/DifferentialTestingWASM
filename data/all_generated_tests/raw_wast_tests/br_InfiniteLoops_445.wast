;; 6. Create a control flow where nested `loop` instructions rely on proper operand stack management by `br` for correct continuation. If the target label within loops and popping logic are mishandled, it can cause an infinite loop where execution never reaches the intended exit block.

(assert_invalid
 (module
  (func $label-index-mismatch
   (block $L1
    (loop $L2 (result i32)
     (br 1)
    )
    (drop)
   )
   (i32.eqz) (drop)
  )
  "type mismatch"
 )
)
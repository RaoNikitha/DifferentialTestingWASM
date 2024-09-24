;; 8. A `loop` that expects to iterate with `i32` types but has conditional `br` instruction paths that result in `i64` types being placed on the operand stack, causing type mismatches during backward jumps.

(assert_invalid
 (module
  (func $type-br-loop-mismatch
   (block
    (loop (result i32)
     (i32.const 0)
     (i64.const 1)
     (br_if 1 (i32.const 1))
     (br 0)
    )
   )
   (i32.eqz) (drop)
  )
 )
 "type mismatch"
)
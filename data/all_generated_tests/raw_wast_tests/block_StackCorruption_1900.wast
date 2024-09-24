;; 1. A `block` with complex nested instructions where inner blocks manipulate the stack extensively and the outer block must validate the final stack state against its `blocktype` result type.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i64)
        (i32.const 1)
        (br 0 (i32.const 2)) (i64.const 3))
      (br 0 (i32.const 4)))
    (i32.const 5))
  )
  "type mismatch"
)
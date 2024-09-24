;; 7. Combine the results of multiple calls into a `block` where the types of the function's return values are inconsistent with the block's expected result types.

(assert_invalid
  (module
    (func $f1 (result i32) (i32.const 42))
    (func $f2 (result i64) (i64.const 99))
    (func $type-mismatch-in-block
      (block (result i32)
        (call $f1)
        (call $f2)
      )
    )
  )
  "type mismatch"
)
;; 10. **Test Description:**    Use a mix of `br_if` with preceding call-return values, ensuring wrong value type handling/popping leads to true conditions despite returned false results demonstrating improper handling of call frame results.

(assert_invalid
  (module
    (func $mixed_br_if_handling (result i32)
      (block (result i32)
        (call $dummy)
        (drop)
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (i32.const 1)
      )
    )
    (func $dummy (result i64)
      (i64.const 0)
    )
  )
  "type mismatch"
)
;; 4. **Test Description:**    - Create nested `blocks` where the inner block expects `i64` and the outer expects `i32`.    - Use a `br` to exit from the inner block to the outer block but with only an `i32` available on the stack.    - The test checks whether type mismatches between nested block exits are correctly handled.

(assert_invalid
  (module
    (func $type-mismatch-nested-br
      (block (result i32)
        (block (result i64)
          (br 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
;; 6. **Test Description 6**: Use multiple nested `br_if` instructions within a `loop` that pushes varied types onto the stack. Each `br_if` should conditionally continue the loop or exit to different nesting levels. Test whether all stack manipulations result in correct final stack contents to expose potential stack corruption.

(assert_invalid
  (module (func $nested-br_if-loop (result i32)
    (i32.const 0)
    (loop
      (block (result i32)
        (br_if 0 (i32.const 1) (i32.const 0))
        (i32.const 0)
        (loop
          (block (result i32)
            (br_if 1 (i32.const 1))
            (br_if 0 (i64.const 1) (i32.const 0))
          )
        )
      )
      (return (i32.const 42))
    )
  ))
  "type mismatch"
)
;; 5. **Test Description**: Develop a test where a `br_if` within a conditional branch targets a further nested block. The condition should only be `true` on specific iterations of a loop.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 1)
        (loop
          (block
            (br_if 1 (i32.const 1) (i32.const 0))
            (block (result i32) (br 0 (i32.const 2)))
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 5. **Test Description 5: Conditional Branch in Complex Nesting**    - Create deeply nested control flow with `if`, `block`, and `loop`. Insert `br_if 4` in an intermediate level and observe if the branch correctly unwinds to the labeled context.

(assert_invalid
  (module (func $complex-nesting (result i32)
    (block (result i32)
      (if (i32.const 1)
        (block
          (loop
            (if (i32.const 1)
              (block
                (br_if 4 (i32.const 1))
                (return (i32.const 42))
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)
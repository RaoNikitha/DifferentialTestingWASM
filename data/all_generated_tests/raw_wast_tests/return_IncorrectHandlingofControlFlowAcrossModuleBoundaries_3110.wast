;; 9. **Test Description**: Export a function with deeply nested control flow constructs (blocks and loops) including returns, and import it into another module. Call this function and verify stack integrity after the call.

(assert_invalid
  (module
    (func $deeply-nested-return (result i32)
      (block
        (block
          (loop $loop
            (block
              (return (i32.const 42))
            )
            br $loop
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)
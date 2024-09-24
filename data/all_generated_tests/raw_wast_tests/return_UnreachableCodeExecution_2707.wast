;; Test 6: Function returns a complex type; place `return` in block setting this type, followed by unreachable. Reason: Checks type handling in blocks and branches; incorrect return implementation may hit `unreachable`.

(assert_invalid
  (module
    (func $complex-return-in-block (result i32 i32)
      (block (result i32 i32)
        (return (i32.const 1) (i32.const 2))
      )
      unreachable
    )
  )
  "type mismatch"
)
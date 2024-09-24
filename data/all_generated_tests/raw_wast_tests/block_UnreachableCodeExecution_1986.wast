;; 7. **Test Description**: A `block` that consumes multiple operands but due to incorrect type handling in nested instruction could lead to an `unreachable` execution if the stack operations fail. This tests proper type validation and stack behavior in both implementations.

(assert_invalid
  (module
    (func $multiple-operand-block (param i32 i32) (result i32)
      (block (param i32 i32) (result i32)
        (i32.add)
        (block (result i32)
          (i32.sub)
        )
      )
    )
  )
  "type mismatch"
)
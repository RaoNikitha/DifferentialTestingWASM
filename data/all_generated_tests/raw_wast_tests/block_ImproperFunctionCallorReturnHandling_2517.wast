;; Construct a block that has a series of nested function calls, where subsequent calls depend on output from previous ones. Include a type mismatch midpoint to validate the operand stack’s consistency and the correct propagation of return values through nested calls within blocks.

(assert_invalid
  (module
    (func $nested-block (result i32)
      (block (result i32)
        (i32.const 0)
        (block (result i32)
          (br 0 (i32.const 42))
        )
        (i32.const 3.14) ;; Intentional type mismatch
        (i32.add)
      )
    )
  )
  "type mismatch"
)
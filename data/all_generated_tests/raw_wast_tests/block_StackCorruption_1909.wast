;; Using a `block` that performs deep recursive function calls, validating that stack depth management prevents overflows or underflows, and ensuring the final stack state aligns with the block type specification.

(assert_invalid
  (module (func $deep-recursive-stack-management
    (block (result i32)
      (i32.const 1)
      (loop $outer (result i32)
        (block $inner1 (result i32)
          (block $inner2 (result i32)
            (br_if $inner2 (i32.eqz (i32.const 0)))
            (br_if $outer (i32.eqz (i32.const 0)))
          )
          (call 0)
        )
      )
    )
  ))
  "type mismatch"
)
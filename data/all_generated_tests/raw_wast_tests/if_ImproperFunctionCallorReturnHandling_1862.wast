;; A test where nested `if-else` blocks are used, with each level making a direct function call (`call`) and verifying if the return values and stack states match the blocktype’s requirements, ensuring proper control flow continuity.

(assert_invalid
  (module (func $nested-if-else (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then
        (if (result i32 i32) (i32.const 1)
          (then (call 0) (i32.const 1) (i32.const 1))
          (else (call 0) (i32.const 1) (i32.const 1))
        )
      )
      (else
        (if (result i32 i32) (i32.const 0)
          (then (call 0) (i32.const 1) (i32.const 1))
          (else (call 0) (i32.const 1) (i32.const 1))
        )
      )
    )
  ))
  "type mismatch"
)
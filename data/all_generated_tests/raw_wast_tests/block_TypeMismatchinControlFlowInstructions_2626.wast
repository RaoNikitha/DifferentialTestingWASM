;; - **Test 7 Description**:   Test `block` with an expected input type `f32`, and an instruction `f32.add` incorrectly trying to add `i32` values within the block. This exposes type enforcement within arithmetic operations and how mismatches are detected.

(assert_invalid
  (module
    (func $type-block-arith-mismatch
      (block (result f32)
        (i32.const 1)
        (i32.const 2)
        (f32.add)
      )
    )
  )
  "type mismatch"
)
;; Test 1: Insert a `nop` within a `block` that returns a result type `i32`, but follow the `nop` with an unrelated type operation, such as `f32.add`. Check if the `block` correctly identifies a type mismatch.

(assert_invalid
  (module
    (func
      (block (result i32)
        (nop)
        (f32.add)
      )
    )
  )
  "type mismatch"
)
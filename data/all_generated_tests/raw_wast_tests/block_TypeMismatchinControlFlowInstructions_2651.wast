;; Test 2: Create a nested block structure where the inner block specifies an i64 result type but the outer block expects an i32 result type. Test for type mismatch errors when the inner block exits and attempts to propagate its result to the outer block.

(assert_invalid
  (module
    (func $nested-block-type-mismatch
      (block (result i32)
        (block (result i64)
          (i64.const 0)
        )
      )
    )
  )
  "type mismatch"
)
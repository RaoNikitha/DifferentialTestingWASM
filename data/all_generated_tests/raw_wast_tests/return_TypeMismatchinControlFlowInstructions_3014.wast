;; Create a nested `block` within a function that returns multiple values of mixed types (integer and float). The innermost block should return incompatible types to the outer block, inducing a type mismatch.

(assert_invalid
  (module
    (func $nested-blocks-type-mismatch (result i32 f32)
      (block (result i32 f32)
        (block (result i32 f32)
          (i32.const 42)
          (return)
        )
        (f32.const 3.14)
      )
    )
  )
  "type mismatch"
)
;; Nest a block within another block, where the inner block calls a function with correct parameter types but expects a different return type than specified. This ensures proper stack management and return value handling through nested block scopes.

(assert_invalid
  (module (func $nested-block-type-mismatch (result i32)
    (block (result f32)
      (block (result i32)
        (call $some_func)
        (f32.const 1.0)
      )
    )
  ))
  "type mismatch"
)
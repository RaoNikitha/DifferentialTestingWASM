;; 9. Develop a nested block scenario where an intermediate block includes a `br` that should escape to the outermost block. Place a `return` within a subsequent nested block to ensure stack unwinding correctly terminates at the function scope, not the intermediate block.

(assert_invalid
  (module
    (func $nested-blocks-with-return (param i32) (result i32)
      (block $outer (result i32)
        (block $intermediate
          (br $outer)
          (block $inner
            (return (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)
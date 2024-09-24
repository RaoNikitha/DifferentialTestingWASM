;; A nested block within a function returns an array object instead of an integer, checking for stack type unwinding and matching against the function's return type.

(assert_invalid
  (module
    (func $nested-block-return-type-mismatch (result i32)
      (block
        (return (i32.const 1))
      )
      (return (memory 0))
    )
  )
  "type mismatch"
)
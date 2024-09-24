;; 10. Develop a deeply nested set of `block`s where an inner `block` incorrectly produces a type (`i32`) that is not expected by an outer block expecting `f64`, targeting type propagation in nested contexts.

(assert_invalid
  (module
    (func $nested-blocks-type-mismatch
      (block (result f64)
        (block (result i32)
          (i32.const 42)
        )
      )
    )
  )
  "type mismatch"
)
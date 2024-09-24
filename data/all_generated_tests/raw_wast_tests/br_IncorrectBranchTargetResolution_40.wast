;; 1. Create a test where `br` targets a deeply nested `block` structure. The test ensures that the label is resolved correctly to the outermost `block`, checking that the `br` does not mistakenly jump to an inner block. This targets the constraint of **correct label indexing in nested structures**.

(assert_invalid
  (module
    (func $deep-nested-br
      (block (result i32)
        (i32.const 0)
        (block
          (block
            (br 2)
          )
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
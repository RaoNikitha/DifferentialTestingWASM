;; Test 8: Implement deeply nested control structures with alternating `block` and `loop` constructs. Use a `br` in the innermost structure to target an ancestor block multiple levels out. Verify correct label indexing and target block identification.

(assert_invalid
  (module (func $deeply-nested-block-label-invalid
    (block
      (loop
        (block
          (loop (block (block (br 6)))))
        )
      )
    )
  ))
  "unknown label"
)
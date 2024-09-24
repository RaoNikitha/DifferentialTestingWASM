;; Test 4: In a function, use a `block` containing an `if` with a nested `br_if`. The `br_if` should only execute when a specific condition within the `if` block is true. Use values that make the condition false to confirm no unintended branch execution, testing nested condition evaluation.

(assert_invalid
  (module
    (func $nested_br_if
      (block
        (i32.const 1)
        (if
          (then
            (block
              (br_if 0 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
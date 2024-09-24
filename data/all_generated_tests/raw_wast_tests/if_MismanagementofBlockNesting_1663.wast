;; 4. Test a triple-nested structure where an inner `if` block causes an early exit using `br`. Ensure labels are interpreted correctly, respecting the nesting levels. ```wasm (block   (block     (if (i32.const 1)       (then          (block           (if (i32.const 1)              (then (br 2))           )         )       )     )   ) ) ```

(assert_invalid
  (module
    (func
      (block
        (block
          (if (i32.const 1)
            (then
              (block
                (if (i32.const 1)
                  (then (br 2))
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
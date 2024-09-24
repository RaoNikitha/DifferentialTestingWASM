;; 1. Test a deep nesting structure where the `br` instruction targets a middle `block` label. Validate proper label resolution relative to depth.

(assert_invalid
  (module
    (func $deep-nest (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (block (result i32)
                  (br 3 (i32.const 1))
                )
                (i32.const 2)
              )
              (i32.const 3)
            )
            (i32.const 4)
          )
          (i32.const 5)
        )
        (i32.const 6)
      )
      (i32.const 7)
    )
  )
  "type mismatch"
)
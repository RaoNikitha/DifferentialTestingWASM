;; 7. Test a situation where a `br` instruction inside a deeply nested structure targets an outer block with different operand types. This ensures the correct interpretation of relative label indices and type consistency across multiple nesting levels.

(assert_invalid
  (module
    (func $deep-nesting-type-mismatch
      (block (result i32)
        (block
          (block
            (block
              (block
                (br 4 (i32.const 1))
              )
            )
          )
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)
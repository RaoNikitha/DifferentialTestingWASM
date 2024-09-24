;; 7. Test a `br` instruction with complex operand types and ensure they are correctly processed when branching out of varied depth of nested `block` and `if` structures. Incorrect stack manipulation with complex types can surface stack corruption issues.

(assert_invalid
  (module
    (func
      (block $nested-1
        (block $nested-2
          (block $nested-3
            (f32.const 1.0) (f64.const 2.0) (br $nested-1)
          )
        )
      )
      (f32.add) (drop)
    )
  )
  "type mismatch"
)
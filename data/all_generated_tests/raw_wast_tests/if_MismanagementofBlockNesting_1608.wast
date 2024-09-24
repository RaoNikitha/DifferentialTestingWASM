;; 9. A nested `if` instruction within another block that contains jumps using `br` instructions targeting different labels in the nested `then` and `else` blocks. This checks if the jumps correctly resolve their respective targets based on depth and nesting.

(assert_invalid
  (module
    (func $nested-if-br-targets
      (block $outer
        (if (result i32) (i32.const 1)
          (then
            (block $then
              (if (result i32) (i32.const 2)
                (then (br $outer) (i32.const 3))
                (else (br $then) (i32.const 4))
              )
            )
          )
          (else
            (block $else
              (if (result i32) (i32.const 5)
                (then (br $outer) (i32.const 6))
                (else (br $else) (i32.const 7))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
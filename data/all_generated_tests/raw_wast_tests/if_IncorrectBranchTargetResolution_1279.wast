;; 10. **Branch target scope violation**: Design an `if` instruction with an `else` block including a nested `block` where a condition within the nested `block` improperly attempts to jump to the outermost block using a `br` instruction.     ```     (block $outer       (if (i32.const 0)         (then           (i32.const 9)         )         (else           (block $inner             (br $outer)           )         )       )     )     ```

(assert_invalid
  (module
    (func $branch_target_scope_violation
      (block $outer
        (if (i32.const 0)
          (then
            (i32.const 9)
          )
          (else
            (block $inner
              (br $outer)
            )
          )
        )
      )
    )
  )
  "unknown label"
)
;; 9. **Deeply Nested Conditional Loop:**    Construct a highly nested conditional loop where the `br` instruction must correctly interpret label indices over several levels. Ensure proper functionality without hitting `unreachable` code due to possible mislabeling or control context issues.

(assert_invalid
  (module
    (func $deeply_nested_conditional_loop
      (block
        (loop
          (block
            (block
              (br_if 0 (i32.const 1))
              (block
                (br_if 1 (i32.const 1))
                (loop
                  (block
                    (br_if 2 (i32.const 1))
                  )
                )
                  (br 3)
              )
            )
            (br 4)
          )
        )
      )
      unreachable
   )
  )
  "type mismatch"
)
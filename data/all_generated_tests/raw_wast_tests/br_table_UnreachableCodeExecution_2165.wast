;; 5. Construct a complex branching scenario using `br_table` with mixed forward and backward branches. Set one label to an `unreachable` block. Verify if misinterpretation of forward/backward branches causes the control flow to reach this `unreachable` instruction erroneously.

(assert_invalid
  (module
    (func $complex-br_table-test
      (block
        (loop $outer
          (block $inner
            (block $unreachable
              (br_table $outer $inner $unreachable (i32.const 3))
              unreachable
            )
          )
        )
      )
    )
  )
  "unknown label"
)
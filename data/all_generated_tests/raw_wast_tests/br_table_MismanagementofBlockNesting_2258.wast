;; Test8: Design an example with several nested control constructs where `br_table` inaccurately targets a label from a middle nested block. Expect `wizard_engine` to promptly detect a label arity issue, unlike WebAssembly, which might yield faulty execution or traps due to control flow misinterpretation.

(assert_invalid
  (module
    (func $nested-br_table
      (block
        (block
          (block
            (br_table 0 1 0 (i32.const 2))
          )
        )
      )
    )
  )
  "label arity mismatch"
)
;; 10. Test `br_table` in a multi-branch setup with multiple labels and a default within a `loop`. Check if incorrect operand conditions lead to an infinite loop scenario instead of breaking out correctly.

(assert_invalid
  (module
    (func $infinite-loop-check
      (loop $continue
        (block $exit
          (i32.const 10)
          (br_table $exit $continue (i32.const 20))
        )
        (br $continue)
      )
    )
  )
  "type mismatch"
)
;; 8. **Test Description 8:**    Implement a `br_table` instruction that includes a mix of `block`, `loop`, and `if` targets with indices cycling repeatedly through them. This tests the correct resumption of execution after diverse types of control instructions.

(assert_invalid
  (module
    (func $complex-br-table
      (block $label0 (result i32)
        (loop $label1 (result i32)
          (if $label2 (result i32)
            (i32.const 1) (br_table 0 1 2)
            (else (br_table 0 1 2))
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)
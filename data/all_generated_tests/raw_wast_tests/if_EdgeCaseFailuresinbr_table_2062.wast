;; Construct an `if` block with an operand stack mismanagement scenario where stack heights differ before and after the `br_table` use in the `else` branch, then compare the behavior of mismatched inputs across WebAssembly and wizard_engine.

(assert_invalid
  (module
    (func $stack-mismatch-before-after-br_table
      (block
        (i32.const 1)
        (if (result i32)
          (then (i32.const 1))
          (else
            (i32.const 2)
            (br_table 0 (else))
          )
        )
      )
    )
  )
  "type mismatch"
)
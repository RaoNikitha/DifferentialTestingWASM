;; Test6: Set up a nested structure with multiple labels where `br_table` targets an out-of-bounds operand for the innermost block. Expect `wizard_engine` to throw `BrTableArityMismatch` due to non-existent nesting level, while WebAssembly might use a default label and execute potentially unexpected control flow.

(assert_invalid
  (module
    (func $nested_br_table
      (block $outer (result i32)
        (block $inner (result i64)
          (br_table 1 2 3 (i32.const 5))
        )
      )
    )
  )
  "BrTableArityMismatch or default label execution"
)
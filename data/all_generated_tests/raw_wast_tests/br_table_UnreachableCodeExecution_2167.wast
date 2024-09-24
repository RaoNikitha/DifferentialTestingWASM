;; 7. Test a `br_table` with a manipulated operand stack such that misunwinding of the stack results in an out-of-bounds condition. The default label pointing to `unreachable` checks if stack mismanagement leads to unintended code execution.

(assert_invalid
  (module
    (func
      (block $label_0
        (block $label_1 (result i32)
          (block $label_2
            (br_table $label_2 $label_0 $label_1 (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)
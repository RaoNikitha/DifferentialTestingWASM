;; Test 9: Test a `br_table` scenario where the operand value is dynamically provided through external inputs to ensure the consistency of branch decisions based on varying runtime input conditions. This examines how the system handles condition evaluations influenced by external factors.

(assert_invalid
  (module
    (func $dynamic-br-table
      (param $input i32)
      (block $default
        (block $target0
          (br_table $target0 $default (local.get $input))
        )
      )
    )
  )
  "type mismatch"
)
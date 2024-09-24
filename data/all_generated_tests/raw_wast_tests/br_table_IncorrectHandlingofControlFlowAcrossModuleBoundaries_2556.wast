;; **Test 5: Cross-module function invoking br_table with type mismatch on backward branch** - Module A defines a loop using `br_table` for backward branching to a mismatching label type. - Module B calls this as part of its control flow. Test confirms if `wizard_engine` halts due to type mismatch while WebAssembly continues execution.

(assert_invalid
  (module
    (func $exported_function
      (block $outer_block
        (loop $loop
          (i32.const 1)
          (br_table 0 $outer_block (i32.const 1))
        )
      )
    )
    (func $invoke_external_func
      (call $exported_function)
    )
    (export "invoke" (func $invoke_external_func))
  )
  "type mismatch"
)
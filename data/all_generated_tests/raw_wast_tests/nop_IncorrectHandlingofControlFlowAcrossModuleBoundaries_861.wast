;; 2. **Test: Imported Function with Nested Control Structures Containing Nop**    - Construct Module A to export a function that includes multiple nested control structures (`block`, `if`, `loop`) containing `nop`. Module B should import and call this function. Verify whether the control flow and stack state are correctly preserved.    - **Constraint Check**: Validates proper control flow handling when `nop` is present within nested structures across modules.    - **Relation to Differential Handling**: Checks if wizard_engine’s `resetSig` improperly interferes with nested control flow preservation.

 ;; (module
  (func $nested_nop_test (result i32)
    (local i32)
    (block
      (loop
        (if (i32.const 1)
          (then
            (nop)
            (return (i32.const 42))
          )
        )
      )
    )
    (unreachable)
  )
  (export "nested_nop_test" (func $nested_nop_test))
)
(module
  (import "env" "nested_nop_test" (func $imported_nop_test (result i32)))
  (func (export "call_imported") (result i32)
    call $imported_nop_test
  )
)

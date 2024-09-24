;; 7. **Test 7: Conditional Branch Leading to Exported Function Call**    - **Description**: Create a conditional `br_if` leading to a call to an exported function in another module. Ensure the calling module retains correct control flow and stack legitimacy, scrutinizing diverging behaviors between implementations.

(assert_invalid
  (module
    (func $type-conditional-export (param i32) (result i32)
      (block (result i32) 
        (call $exported_func (br_if 0 (local.get 0)))
      )
    )
    (export "exported_func" (func $type-conditional-export))
  )
  "type mismatch"
)
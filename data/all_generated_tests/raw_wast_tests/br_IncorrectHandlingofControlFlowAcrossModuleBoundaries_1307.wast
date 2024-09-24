;; 8. **Test Description 8**:    Write a test where a WASM module imports a function that uses `br` to target labels across deeply nested structures. Call this function within a nested control structure in the importer module. Validate correct label targeting and stack unwinding.

(assert_invalid
  (module
    (import "env" "importedFunc" (func $importedFunc (result i32)))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call $importedFunc)
            (br 3)
          )
        )
      )
    )
  )
  "type mismatch"
)
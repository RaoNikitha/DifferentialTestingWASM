;; 3. **Test Nested Loop Mismatched Types**: Use nested blocks with misaligned block types that confuse WebAssembly but are reset improperly by `wizard_engine`, leading to continuous execution without exiting.

(assert_invalid
  (module (func $nested-loop-mismatch-type
    (block (result i32) 
      (block (result f64) 
        (i64.const 0)
        (br 1 (i32.const 1))
      )
    )
  ))
  "type mismatch"
)
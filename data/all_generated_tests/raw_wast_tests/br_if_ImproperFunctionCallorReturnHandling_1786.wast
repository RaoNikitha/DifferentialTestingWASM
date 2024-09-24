;; 7. **Test 7: Nested Blocks with Indirect Calls**: Execute deeply nested blocks containing indirect calls and `br_if` to see if branching targets are accurately maintained across varying nesting depths in function call contexts. This test looks for potential indexing faults in `wizard_engine` versus `WASM`.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $target (result i32) (i32.const 0))
    (func $test
      (block
        (block
          (block
            (call_indirect (type $sig) (i32.const 0))
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)
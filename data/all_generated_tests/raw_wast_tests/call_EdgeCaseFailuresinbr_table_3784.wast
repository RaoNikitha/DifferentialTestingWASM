;; 3. Create a nested function call scenario where a function calls another function that immediately executes a `br_table`. The index for `br_table` should be exactly on the boundary of valid targets. Test if there is a discrepancy in how the call stacks are managed between WebAssembly and wizard_engine.

(assert_invalid
  (module
    (func $nested-call (result i32)
      (call 1)
      (br_table 0 (i32.const 1) (i32.const 0))
    )
    (func (result i32)
      (i32.const 42)
    )
  )
  "br_table target out of bounds"
)
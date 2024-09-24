;; 3. Implement a WebAssembly function that uses `br_table` to conditionally branch to either a block within the same module or an exported function in a different module, depending on the operand value. Analyze if the correct function is called and if the operand stack remains consistent.

(assert_invalid
  (module
    (import "mod" "func" (func $imported_func (result i32)))
    (func (export "test")
      (block $blk
        (br_table 0 1 (i32.const 2))
      )
      (call $imported_func)
    )
  )
  "unknown label"
)
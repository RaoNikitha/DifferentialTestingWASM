;; 10. Test an exported function with a `block` instruction that branches with `br_if` while simultaneously calling an imported function containing its own `block`. Verify correct state propagation and branching outcomes across the modules.

(assert_invalid
  (module
    (func $imported (import "env" "importedFunc"))
    (func (export "test")
      (block (result i32)
        (i32.const 0)
        (br_if 0 (call $imported))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
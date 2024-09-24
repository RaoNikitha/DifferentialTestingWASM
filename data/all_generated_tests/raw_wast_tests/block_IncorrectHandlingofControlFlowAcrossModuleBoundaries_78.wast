;; 9. **Block Instructions with Imported Table Elements**:    - Insert a block with calls to imported functions that manipulate elements from an imported table. The test verifies if control flows correctly particularly when interacting with elements managed in different modules.

(assert_invalid
 (module
  (type $t0 (func (param i32) (result i32)))
  (import "env" "table" (table funcref))
  (elem (i32.const 0) $f0)
  (func $f0 (result i32) (i32.const 1))
  (func $type-block-imported-table
    (result i32)
    (block (result i32)
      (call_indirect (type $t0) (i32.const 0) (i32.const 100))
    )
  )
 )
 "type mismatch"
)
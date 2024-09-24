;; 8. **Test Description:**    - Have module A export a complex function sequence comprising of `nop` instructions, memory operations, and indirect function calls within a table. Module B imports and tests sequencing integrity by ensuring expected outcomes and no stack corruption.    - **Constraint Checked:** Ensure `nop` does not impact memory operations and function calls when bundled.    - **Relation to Issue:** Combines memory and control operations with `nop`, testing interaction across boundaries.

(assert_invalid
  (module 
    (func $complex_fn
      (local $a i32)
      (nop)
      (call_indirect (type (func (result i32))) (i32.const 0))
      (nop)
      (i32.store (i32.const 0) (i32.const 42))
      (nop)
      (end)
    )
    (table 1 funcref)
    (elem (i32.const 0) $complex_fn)
    (memory $0 1)
    (export "complex_fn" (func $complex_fn))
  )
  "indirect call type mismatch"
)
;; 10. **Test Description**:     Create a WebAssembly module with a repeating pattern of `loop` and `block` instructions with a `call_indirect` inside. Use multiple `br`, `br_if`, and `br_table` instructions to branch at various depths.    **Constraint**: Verify that the control flow is correctly managed, and the `call_indirect` functions are dynamically type-checked in all nested structures.    **Relation to Mismanagement of Block Nesting**: Tests robust handling of control flow and function call type checking amidst complex, nested structures.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func $callee (param i32))
    (elem (i32.const 0) funcref $callee)
    (func $complex-control-flow
      (block
        (loop
          (block
            (br 1)
            (call_indirect (type $sig) (i32.const 0))
          )
          (block
            (br_if 0 (i32.const 0))
            (call_indirect (type $sig) (i32.const 1))
          )
          (block
            (br_table 0 1 (i32.const 0))
            (call_indirect (type $sig) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)
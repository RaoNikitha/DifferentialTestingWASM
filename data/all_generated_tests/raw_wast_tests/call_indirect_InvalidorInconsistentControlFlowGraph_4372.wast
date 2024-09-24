;; 1. **Test Non-Existent Table Index**: Construct a test where `call_indirect` tries to access a function from a table index that does not exist within the WebAssembly module. Ensure this index is out of the defined range of the table.    - **Constraint**: Exceeds valid table index.    - **CFG Relation**: Tests if invalid indexing causes an incorrect control flow path leading to unexpected termination or skips in execution.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type $sig) (i32.const 99))
    )
  )
  "index out of bounds"
)
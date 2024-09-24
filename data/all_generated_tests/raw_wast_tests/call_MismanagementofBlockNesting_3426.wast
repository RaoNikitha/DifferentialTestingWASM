;; 5. **Br Table with Invalid Function Call**:    - **Description**: Construct a WebAssembly function using a `br_table` to jump between nested blocks, with one of the target blocks containing a `call` instruction to an invalid function index.    - **Constraint**: Include an incorrect function index in a block that `br_table` could jump to.    - **Relation to Mismanagement of Block Nesting**: Tests if the control flow handles nested blocks and invalid function calls correctly within a `br_table`.

(assert_invalid
  (module
    (type $sig (func))
    (table funcref)
    (func $br_table_invalid_call
      (block $outer
        (block $inner
          (br_table $inner $outer (i32.const 0))
          (call 99)
        )
      )
    )
  )
  "unknown function"
)
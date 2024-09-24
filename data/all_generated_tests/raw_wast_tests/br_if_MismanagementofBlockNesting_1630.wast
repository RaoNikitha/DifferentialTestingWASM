;; 1. **Basic Mis-nested `br_if` Test**:    - **Description**: Create a `block` within another `block`, and use a `br_if` to target the outer block from the inner block based on a non-zero condition. This tests if the implementation correctly handles the relative label indexing of nested blocks.    - **Constraint Checked**: Relative Label Lookup.    - **Expected Failure**: The wizard_engine should throw an `OobLabel` error if it misinterprets the label index space.

(assert_invalid
  (module 
    (func $misnested_br_if
      (block
        (block
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "OobLabel"
)
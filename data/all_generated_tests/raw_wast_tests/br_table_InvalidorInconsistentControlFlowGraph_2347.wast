;; Test 7: Formulate a `br_table` that uses a non-existent label index in an improperly nested block, resulting in an invalid control flow graph and testing how incorrect label targets are handled. - **Constraint Tested**: Proper resolution and error handling of invalid label indices.

(assert_invalid
  (module (func (block
    (block
      (br_table 1 (i32.const 2))
    )
  )))
  "unknown label"
)
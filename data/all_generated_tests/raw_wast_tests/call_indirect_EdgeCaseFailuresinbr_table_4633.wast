;; 2. **Test for Non-Existent Function Type in `call_indirect` Following `br_table`**:    - Perform a `br_table`, and after landing at the index, use `call_indirect` with a type index that does not exist in the module. This checks how implementations handle gaps in function types after branching.    - Constraint: Non-existent function type index.    - Relation: Examines error handling when resolving `call_indirect` post branching.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32)))
    (table funcref (elem $f))
    (func $f (param i32))
    (func $br_table_indirect_call
      (block
        (loop
          (br_table 0 0 (i32.const 0))
          (call_indirect (type 2) (i32.const 0))
        )
      )
    )
  )
  "type index out of bounds"
)
;; 7. **Test Description:**    Test `call_indirect` involving indexed table lookups within nested blocks and loops, where the index could be out-of-bounds due to erroneous exit from nested contexts, resulting in a trap.    - **Constraint Checked:** Table indexing with nested control structures.    - **Mismanagement Relation:** Ensures table indices are correctly handled without nested context exits causing out-of-bounds errors.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem $f))
    (func $f (param i32))
    (func $nested-blocks-loops
      (block
        (loop
          (call_indirect (type 0) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
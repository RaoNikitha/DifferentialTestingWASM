;; - **Test 10**: Define a `block` with variable stack height changes and a `br_table` instruction branching based on non-uniform label indexing. Investigate `wizard_engine`’s ability to explicitly rearrange the `ctl_stack` and WebAssembly's nesting context consistency for such edge cases.

(assert_invalid
  (module (func $br_table-non-uniform-label-indexing
    (block (result i32) 
      (i32.const 0)
      (block (result i32)
        (i32.const 1)
        (br_table 0 1 0)
        (i32.const 2)
      )
      (i32.const 3)
    )
    (i32.const 4)
  ))
  "type mismatch"
)
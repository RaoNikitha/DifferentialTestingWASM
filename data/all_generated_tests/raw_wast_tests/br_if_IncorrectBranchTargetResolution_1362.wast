;; Test 3: - Implement a `loop` within a `block` and create a `br_if` instruction within the loop targeting label `2` (should be out of bounds). Check if wizard_engine throws an error or behaves erratically compared to the expected out-of-bounds error in WASM. - **Constraint Checked**: Stack Bounds and Label Lookup. - **Relation to Incorrect Branch Target Resolution**: Tests proper error handling for out-of-bounds label indices.

(assert_invalid
  (module
    (func $out_of_bounds_br_if
      (block
        (loop
          (br_if 2 (i32.const 1)) (i32.const 0)
        )
      )
    )
  )
  "out of bounds label"
)
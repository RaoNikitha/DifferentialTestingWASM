;; 4. **Test Description 4:**    Construct a `br_table` with identical consecutive labels and an index that could test an off-by-one error condition at the switch between valid labels. Evaluate if both implementations handle the edge seamlessly.

(assert_invalid
  (module (func $br_table-edge
    (block (br_table 0 0 1 1 2 (i32.const 3)))
  ))
  "unknown label"
)
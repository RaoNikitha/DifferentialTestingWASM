;; 9. Devise a test combining `br_table` indices that include an index exactly equal to the highest legal label index within the current block structure, checking for edge-boundary branching correctness.

(assert_invalid
  (module (func $br_table-edge-case
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 2 1 0 (i32.const 0)) (unreachable)
        ) (i32.const 42)
      ) (i32.const 42)
    ) (i32.add)
  ))
  "type mismatch"
)
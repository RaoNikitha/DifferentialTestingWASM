;; 8. Insert `unreachable` in conjunction with `br_table`, causing complex jump destinations within a loop. The test examines whether type resilience and immediate trapping are consistent across implementations, rather than incorrectly entering infinite loops.

(assert_invalid
  (module (func $unreachable-br_table
    (block (loop
      (br_table 0 1 (unreachable) (i32.const 0))
      (i32.const 1)
    ))
  ))
  "type mismatch"
)
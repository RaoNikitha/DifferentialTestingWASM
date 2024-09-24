;; 8. Introduce a `br_table` where the entry at the boundary index leads to `unreachable`. Verify that both environments properly handle the maximum valid index without execution continuation.

(assert_invalid
  (module (func (block (block (br_table 1 0 (i32.const 1)) (unreachable))))
  )
  "type mismatch"
)
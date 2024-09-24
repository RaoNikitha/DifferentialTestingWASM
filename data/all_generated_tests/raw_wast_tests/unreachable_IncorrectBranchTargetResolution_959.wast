;; 10. **Invalid Nesting Order Test:**    - Introduce an `unreachable` at a confusing point in the control flow where blocks and loops are partially overlapped. Follow it with `br` and `br_table` instructions targeting mismatched enclosing layers. Ensure the trap captured by `unreachable` leads to immediate halt in erroneous context switches.

(assert_invalid
  (module (func $invalid-nesting-order-test
    (block (loop (block (unreachable) (br 2))))
  ))
  "type mismatch"
)
;; 10. Implement a loop with a combination of `br` and `br_if` that prevent the loop's correct termination by manipulating stack operations, ensuring the branch conditions always keep the loop running indefinitely.

(assert_invalid
  (module (func $infinite-loop-via-br
    (local i32)
    (loop (br 0) (br_if 0 (local.get 0)))
  ))
  "loop does not terminate"
)
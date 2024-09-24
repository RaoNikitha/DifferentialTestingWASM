;; 7. Implement `unreachable` within a nested branching (using `block` and `loop`) context and include labels for each block/loop level. Post-unreachable checks such as `end` instructions ensure the correct completion of all open blocks without disruption.

(assert_invalid
  (module (func (block (loop (block (unreachable))) (i32.const 1))))
  "type mismatch"
)
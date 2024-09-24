;; 5. Create a block that contains an `unreachable` followed by a `br_table` branching table. Validate if the `unreachable` prevents any jump table branches from being executed.

(assert_invalid
  (module (func (block (unreachable) (br_table 0 0 0))))
  "unreachable"
)
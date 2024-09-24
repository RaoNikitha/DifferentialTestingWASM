;; 8. Use an `unreachable` in a block that is part of a chain of blocks linked by `br` instructions. Ensure that the trap prevents the branch chain from executing past the `unreachable`.

(assert_invalid
  (module
    (func (block (block (br 1) (unreachable)) (br 0)))
  )
  "type mismatch"
)
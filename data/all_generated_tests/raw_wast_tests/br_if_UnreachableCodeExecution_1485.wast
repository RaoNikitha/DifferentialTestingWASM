;; 6. **Test 6**: Construct a `block` with several `br_if` instructions that conditionally exit to the end of the block. Place nested `unreachable` instructions just before the end of the block to see if improper label resolution wrongly executes the `unreachable`.

(assert_invalid
  (module (func (block (br_if 0 (i32.const 1)) (unreachable))))
  "unreachable executed"
)
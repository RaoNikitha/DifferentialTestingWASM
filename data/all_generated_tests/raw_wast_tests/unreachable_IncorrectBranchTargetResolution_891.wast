;; 2. **Test with Loop and Conditional:** Inside a loop, place an `if` conditional with an `unreachable` instruction inside the true branch of the `if`. Test to ensure that the `br` instruction correctly exits the loop immediately upon hitting `unreachable`, verifying proper branch target resolution.

(assert_invalid
  (module (func (loop (if (i32.const 1) (then (unreachable))) (br 0)))
  "type mismatch"
)
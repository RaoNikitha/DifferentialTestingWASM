;; 3. Utilize a `nop` instruction immediately before a sequence of condition checks (multiple `br_if` statements). Ensure no unintended branches occur, verifying correctness of conditional evaluations.

(assert_invalid
  (module (func (block (nop) (br_if 0 (i32.const 1)) (br_if 0 (i32.const 0)))))
  "unexpected branch"
)
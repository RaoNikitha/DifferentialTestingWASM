;; A test where two levels of nested blocks are present, and a `br` instruction jumps out of both levels in a single step. This will check if the implementation properly unwinds the operand stack and maintains correct control flow.

(assert_invalid
  (module (func $test-block-double-br (result i32)
    (block (block (br 1 (i32.const 1))) (i32.const 2))
  ))
  "type mismatch"
)
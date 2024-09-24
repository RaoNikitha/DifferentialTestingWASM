;; Create a `block` containing a `br` instruction to an implicit label within the same block and an `end`. The block should call an imported function followed by a `br_if` conditional branch. Check that the stack state is preserved and correct across module transition points.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (result i32)))
    (func (result i32)
      (block (result i32)
        (call $func1)
        (i32.const 1)
        (br_if 0 (i32.eqz (i32.const 0)))
        (unreachable)
      )
    )
  )
  "type mismatch"
)
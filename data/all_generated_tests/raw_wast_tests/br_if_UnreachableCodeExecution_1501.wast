;; - **Test 2**: Create a `loop` with internal logic that includes a `br_if` with an always true condition (e.g., conditioned on a `1` value) targeting an outer block. Follow the `br_if` inside the loop with an `unreachable` instruction. This tests whether the loop correctly exits to the outer block, avoiding the `unreachable` instruction.

(assert_invalid
  (module
    (func (result i32)
      (block
        (loop
          (br_if 1 (i32.const 1))
          unreachable
        )
      )
      (i32.const 0)
    )
  )
  "the instruction will never reach the end"
)
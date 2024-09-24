;; Test 10: Construct a block that creates a loop via `loop` with an exit condition using `br_if` to see if the CFG captures correct loop exit and re-entry states, focusing on accurate loop structure handling.  These tests should reveal differences in the operand stack behavior and control flow graph handling between the two implementations, highlighting issues with inconsistent or incorrect CFG generation and interpretation.

(assert_invalid
  (module (func $loop-with-exit-via-br_if
    (block $outer (result i32)
      (loop $inner (result i32)
        (i32.const 0)
        (br_if $outer (i32.const 1))
        (br $inner)
      )
    )
  ))
  "type mismatch"
)
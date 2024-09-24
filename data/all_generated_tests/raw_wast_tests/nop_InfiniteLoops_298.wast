;; Test 9: Design a loop body with `nop` at various positions and nested `br_if` instructions. Validate that looping conditions function correctly and avoid infinite repetition.

(assert_invalid
  (module
    (func $loop-nop
      (loop $L
        nop
        (br_if $L (i32.const 0))
        nop
      )))
  "unexpected end of section"
)
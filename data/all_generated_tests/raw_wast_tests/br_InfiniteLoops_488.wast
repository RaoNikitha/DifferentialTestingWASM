;; 9. A `loop` containing nested `br_if` instructions with constant propagation optimization scenarios, testing if conditions are interpreted correctly depending on constant values and thus verifying effective loop exit strategies.

(assert_invalid
  (module
    (func $loop_with_nested_br_if
      (loop $outer
        (block $inner
          (br_if $outer (i32.const 0)) ; Incorrectly specified condition for br_if
        )
      )
    )
  )
  "type mismatch"
)
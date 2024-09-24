;; 9. **Test 9: Misbranch with Mixed Control Flow Constructs**    - Nested `if` blocks mixed with `loop` and `block` constructs where branches within `if` blocks are incorrectly targeting the surrounding `loop` or `block`.

(assert_invalid
  (module
    (func $misbranch-mixed-control (result i32)
      (block $outer
        (loop $inner
          (if (i32.const 1) (then (br $inner)) (else (br $outer)))
        )
      )
    )
  )
  "type mismatch"
)
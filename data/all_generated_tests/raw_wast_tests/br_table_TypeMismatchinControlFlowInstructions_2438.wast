;; Write a `br_table` instruction within a `loop` construct where one of the target labels is incorrectly addressing an operand type mismatch by providing an unexpected operand type like `v128`, ensuring the test catches correctly structured control flow.

(assert_invalid
  (module
    (func $type-mismatch-in-loop
      (loop $outer
        (block $inner
          (br_table 0 1 (i32.const 0) (v128.const i32x4 0 0 0 0))
        )
      )
    )
  )
  "type mismatch"
)
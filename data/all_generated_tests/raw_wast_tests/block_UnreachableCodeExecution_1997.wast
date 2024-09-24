;; 8. Frame a block nested with other blocks where a `br` targets the precise parent block but pushes the stack to a problematic depth leading to an `unreachable` if not managed accurately. Confirm proper label stack handling.

(assert_invalid
  (module (func $nested-blocks-br-mismanaged (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br 2 (i32.const 1))
        )
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)
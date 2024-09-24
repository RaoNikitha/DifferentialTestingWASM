;; 4. Design a block structure where an inner `block` declares a result type of `f32`, but inside this block, a backward branch (`br`) targets an outer `loop` expecting `i32` values. This will check for proper type enforcement on branches out of nested structures.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result f32)
          (br 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
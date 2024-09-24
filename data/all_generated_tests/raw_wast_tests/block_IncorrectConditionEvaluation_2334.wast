;; 5. Construct a block containing `br_if` with conditions derived from multiple logical operations (e.g., `i32.and` resulting false). Check misbranching due to conditional checks not integrating multiple logical results properly.

(assert_invalid
  (module (func $conditional-br_if-misbranch (result i32)
    (block (result i32)
      (br_if 0
        (i32.and (i32.const 0) (i32.const 0))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)
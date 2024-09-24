;; 7. Construct a `loop` within a `block` that contains branches resolving to the loop's beginning and the block's end. Ensure effective label index handling to prevent misdirected branches.

(assert_invalid
  (module
    (func $nested-loop-block
      (block $block
        (loop $loop (result i32)
          (i32.const 1)
          (br $block)
          (br $loop)
        )
      )
    )
  )
  "type mismatch"
)
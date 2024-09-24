;; 5. **Erroneous Endless Loops Within Blocks**:    - Construct blocks that inadvertently create endless loops with improper stack handling and results that do not type-match the block's own signature.    - Testing how CFG manages and interprets endless loops and stack consistency.

(assert_invalid
  (module (func $infinite-loop-block (result i32)
    (block (result i32)
      (loop
        (block $again
          (br 1)
          (i32.const 0)
          (br $again)
        )
      )
    )
  ))
  "type mismatch"
)
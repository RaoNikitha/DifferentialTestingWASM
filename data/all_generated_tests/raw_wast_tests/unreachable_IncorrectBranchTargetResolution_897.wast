;; 8. **Test with Interleaved Block and Loop Constructs:** Design interleaved nested constructs comprising blocks and loops, strategically placing `unreachable` in various inner constructs. Verify branch instructions exit the correct constructs when `unreachable` is encountered, ensuring branch targets are accurately resolved.

(assert_invalid
  (module
    (func $nested-block-loop
      (block (result i32)
        (block
          (loop
            (br 1)
            (unreachable)
          )
        )
        (unreachable)
      )
      (unreachable)
    )
  )
  "type mismatch"
)
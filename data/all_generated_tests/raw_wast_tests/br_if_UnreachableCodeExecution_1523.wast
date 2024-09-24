;; 4. **Test `BLOCK` Followed by Loop**: A `block` containing a `br_if` targeting a label within a subsequent `loop` that leads to `unreachable`. This tests correct distinction between `block` and `loop` label arguments and prevents the unwinding error.

(assert_invalid
  (module
    (func $block_loop
      (block
        (loop
          (br_if 0 (i32.const 1))
          (unreachable)
        )
        (br_if 1 (i32.const 1))
        (unreachable)
      )
    )
  )
  "unknown label"
)
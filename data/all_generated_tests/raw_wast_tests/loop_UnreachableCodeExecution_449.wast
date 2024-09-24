;; Design complex branching and nesting of loops where the label indices are mishandled, potentially causing unexpected jumps to an `unreachable`. Confirm that accurate label indexing prevents hitting `unreachable` under correct branch conditions.

(assert_invalid
  (module
    (func $nested_loop_label_error
      (i32.const 0)
      (loop $outer (result i32)
        (loop $inner
          (br 2) ;; Attempting to branch to a non-existent label
        )
      )
    )
  )
  "unknown label"
)
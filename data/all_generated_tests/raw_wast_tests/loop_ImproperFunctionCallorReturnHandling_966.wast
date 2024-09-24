;; Implement a loop where the termination condition is based on the result of a called function conditionally executed within a `block`. This tests control flow instructions inside the loop and ensures return handling is integrated correctly with blocks.

(assert_invalid
  (module (func $nested-loop-control
    (local $i i32)
    (loop (param i32)
      (block
        (call $condition)
        (br_if 1 (i32.eqz (get_local $i)))
        (br 0)
      )
    )
  )
  (func $condition (result i32)
    (i32.const 1)
  ))
  "type mismatch"
)
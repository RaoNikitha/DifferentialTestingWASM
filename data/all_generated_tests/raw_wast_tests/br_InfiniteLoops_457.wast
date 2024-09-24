;; Implement a `loop` with a nested `if` condition. The `if` contains a `br_if` targeting the loop’s start that evaluates as false. This checks if the branch conditions allow proper loop continuation without infinite cycling.

(assert_invalid
  (module
    (func $br_if_in_loop
      (loop
        (if (i32.const 1)
          (then (br_if 0 (i32.const 0)))
        )
        (br 1)
      )
    )
  )
  "unknown label"
)
;; 6. Set up a deep nested loop structure with several layers of conditionals (`if` and `br_if`) leading to an `unreachable`. The test should check whether the layers of control correctly propagate the trap without evaluation leading to infinite looping.

(assert_invalid
  (module
    (func $deep-nested-control-with-unreachable
      (block
        (loop
          (if (i32.const 1)
            (then
              (br 0)
            )
            (else
              (unreachable)
            )
          )
          (br 1)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)